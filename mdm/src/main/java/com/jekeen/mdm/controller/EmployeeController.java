package com.jekeen.mdm.controller;


import com.github.pagehelper.PageInfo;
import com.jekeen.mdm.model.Employee;
import com.jekeen.mdm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/manage")
    public ModelAndView addEmployee() {
        ModelAndView mv = new ModelAndView("html/employee");
        return mv;
    }

    @RequestMapping(value = "/selectEmployees")
    @ResponseBody
    public Map<String, Object> selectEmployees(Integer draw, Integer start, Integer length, Employee employee) {

        Map<String, Object> result = new HashMap<String, Object>();

        PageInfo<Employee> employees = employeeService.getEmployeesPageSelective(start, length,employee);
        long total = employees.getTotal();
        result.put("draw", draw);
        result.put("recordsTotal", total);
        result.put("recordsFiltered", total);
        result.put("data", employees.getList());
        return result;
    }

    @RequestMapping(value = "/selectSelective")
    @ResponseBody
    public List<Employee> getEmployeesSelective(@RequestBody(required = false) Employee employee) {
        List<Employee> employees = employeeService.getEmployeesSelective(employee);
        return employees;
    }

    /**
     * 添加
     */
    @RequestMapping("/saveOrUpdateEmployee")
    @ResponseBody
    public Map<String, Object> saveOrUpdateEmployee(@ModelAttribute(value = "Employee")Employee employee) {
        Map<String, Object> map = new HashMap<>();

        int i = employeeService.saveOrUpdateEmployee(employee);
        if(i>0){
            map.put("msg", "更新成功:");
        }else{
            map.put("msg", "更新失败:");
        }
        return map;
    }

    /**
     * 按主键查询
     */
    @RequestMapping("/selectByPrimaryKey")
    @ResponseBody
    public Employee selectByPrimaryKey(String id) {
        return employeeService.selectByPrimaryKey(id);
    }
    /**
     * 按主键查询
     */
    @RequestMapping("/{id}")
    @ResponseBody
    public Employee selectEmployeeByPrimaryKey(@PathVariable String id) {
        return employeeService.selectByPrimaryKey(id);
    }
    /**
     * 删除
     *
     * @param ids
     * @return
     */

    @RequestMapping("/deleteEmployee")
    @ResponseBody
    public Map<String, Object> deleteEmployee(String[] ids) {
        int n = 0;
        for (String id : ids) {
            n += employeeService.deleteByPrimaryKey(id);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("msg", "删除成功:" + n + "条记录！");
        if (n == ids.length) {
            map.put("code", 200);
        }
        return map;
    }
}

