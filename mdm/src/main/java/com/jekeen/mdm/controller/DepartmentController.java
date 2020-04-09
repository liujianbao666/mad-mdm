package com.jekeen.mdm.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.jekeen.mdm.model.Department;
import com.jekeen.mdm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/department")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = "/tree")
    public ModelAndView treeDepartment() {

        ModelAndView mv = new ModelAndView("html/departmenttreegrid");
        Department department = new Department();
        mv.addObject("department", department);
        return mv;
    }
    @RequestMapping(value = "/selectAllDepartmentsTree")
    @ResponseBody
    public JSONArray selectAllDepartmentsTree(@RequestParam(required = false) Department department) {
        JSONArray result = new JSONArray();

        List<Department> departments = departmentService.getDepartmentsSelective(department);
        for(Department depart:departments){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id",Integer.valueOf(depart.getDepartmentId()));
            /**
             * 父节点
             */
            jsonObject.put("pid",depart.getParentId());
            jsonObject.put("name",depart.getName());
            jsonObject.put("code",depart.getDepartmentId());
            jsonObject.put("departmentType",depart.getDepartmentType());
            if(depart.getCostCenter()!=null){
                jsonObject.put("costCenterName",depart.getCostCenter().getName());
            }
            jsonObject.put("orderClassName",depart.getOrderClassId());
            result.add(jsonObject);
        }


        return result;
    }

    @RequestMapping(value = "/loadDepartmentsTree")
    @ResponseBody
    public JSONArray LoadDepartmentsTree(@RequestParam(required = false) Department department) {
        JSONArray result = new JSONArray();
        List<Department> departments = departmentService.getDepartmentsSelective(department);
        for(Department depart:departments){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id",depart.getDepartmentId());
            /**
             * 父节点
             */
            if(depart.getParentId() == null){
                jsonObject.put("parent","#");
            }else{
                jsonObject.put("parent",depart.getParentId());
            }
            jsonObject.put("text",depart.getName());
            result.add(jsonObject);
        }

        return result;
    }
    @RequestMapping(value = "/manage")
    public ModelAndView toDepartment(Model model) {
        ModelAndView mv = new ModelAndView("html/department");
        Department department = new Department();
        mv.addObject("department", department);
        return mv;
    }

    @RequestMapping(value = "/selectDepartments")
    @ResponseBody
    public Map<String, Object> selectDepartments(Integer draw, Integer start, Integer length, Department department) {

        Map<String, Object> result = new HashMap<String, Object>();

        PageInfo<Department> departments = departmentService.getDepartmentsPageSelective(start, length,department);
        long total = departments.getTotal();
        result.put("draw", draw);
        result.put("recordsTotal", total);
        result.put("recordsFiltered", total);
        result.put("data", departments.getList());
        return result;
    }
    @RequestMapping(value = "/selectAllDepartments")
    @ResponseBody
    public List<Department> selectAllDepartments(@RequestBody(required = false) Department department) {
        List<Department> departments = departmentService.getDepartmentsSelective(department);
        return departments;
    }

    /**
     * 添加
     */
    @RequestMapping("/saveOrUpdateDepartment")
    @ResponseBody
    public Map<String, Object> saveOrUpdateDepartment(@ModelAttribute(value = "department")Department department) {
        Map<String, Object> map = new HashMap<>();
        //查询已存在
        Department departmenttmp = new Department();
        departmenttmp.setDepartmentId(department.getDepartmentId());
        List<Department> departmentsSelective = departmentService.getDepartmentsSelective(departmenttmp);
        if(department.getDepartmentId() == null|| "".equals(department.getDepartmentId()) ){
            if (departmentsSelective.size() > 0) {
                map.put("msg", "编码已存在！");
                return map;
            }
            int n = departmentService.insertSelective(department);
            if (n == 1) {
                map.put("msg", "添加成功！");
                map.put("code", 200);
                return map;
            }
            map.put("msg", "添加失败！");
        }else{//如果不为空时为修改
            if (departmentsSelective.size() < 2) {
                //数据中就一条数据看是不是自己
                if(departmentsSelective.size() == 0 || departmentsSelective.get(0).getDepartmentId().equals(department.getDepartmentId())){
                    int n = departmentService.updateByPrimaryKeySelective(department);
                    if (n == 1) {
                        map.put("msg", "修改成功！");
                        map.put("code", 200);
                        return map;
                    }
                }
                map.put("msg", "编码已存在！");
                return map;
            }

            map.put("msg", "修改失败！");
        }

        return map;
    }

    /**
     * 按主键查询
     */
    @RequestMapping("/{id}")
    @ResponseBody
    public Department selectByPrimaryKey(@PathVariable String id) {
        return departmentService.selectByPrimaryKey(id);
      /*  Map<String, Object> map = new HashMap<>();
        Department departmenttmp = new Department();
        departmenttmp.setCode(department.getCode());
        int count = departmentService.countAllDepartments(departmenttmp);
        if (count > 0) {
            map.put("msg", "编码已存在！");
            return map;
        }
        int n = departmentService.updateByPrimaryKeySelective(department);
        map.put("msg", "修改成功！");
        map.put("code", 200);
*/
//        return map;
    }

    /**
     * 删除
     *
     * @param ids
     * @return
     */

    @RequestMapping("/deleteDepartment")
    @ResponseBody
    public Map<String, Object> deleteDepartment(String[] ids) {
        int n = 0;
        for (String id : ids) {
            n += departmentService.deleteByPrimaryKey(id);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("msg", "删除成功:" + n + "条记录！");
        if (n == ids.length) {
            map.put("code", 200);
        }
        return map;
    }
}

