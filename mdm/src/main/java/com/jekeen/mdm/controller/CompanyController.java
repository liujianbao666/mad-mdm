package com.jekeen.mdm.controller;


import com.github.pagehelper.PageInfo;
import com.jekeen.mdm.model.Company;
import com.jekeen.mdm.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/company")
public class CompanyController {
    @Autowired
    private CompanyService companyService;

    /**
     * 管理页面
     */
    @RequestMapping("/manage")
    public ModelAndView manage() {
        ModelAndView mv = new ModelAndView("html/company");
        Company company = new Company();
        mv.addObject("company", company);
        return mv;
    }
    @RequestMapping(value = "/selectCompanys")
    @ResponseBody
    public Map<String, Object> selectCompanys(Integer draw, Integer start, Integer length,Company company) {

        Map<String, Object> result = new HashMap<String, Object>();
        PageInfo<Company> companys = companyService.getPageCompanysSelective(start, length,company);
        long total = companys.getTotal();
        result.put("draw", draw);
        result.put("recordsTotal", total);
        result.put("recordsFiltered", total);
        result.put("data", companys.getList());
        return result;
    }

    /**
     * 添加
     */
    @RequestMapping("/saveOrUpdateCompany")
    @ResponseBody
    public Map<String, Object> saveOrUpdateCompany(@ModelAttribute(value = "company")Company company) {
        Map<String, Object> map = new HashMap<>();
        //查询已存在
        Company companytmp = new Company();
        companytmp.setCode(company.getCode());
        List<Company> companysSelective = companyService.getCompanysSelective(companytmp);
        if(company.getId() == null|| "".equals(company.getId()) ){
            if (companysSelective.size() > 0) {
                map.put("msg", "编码已存在！");
                return map;
            }
            int n = companyService.insertSelective(company);
            if (n == 1) {
                map.put("msg", "添加成功！");
                map.put("code", 200);
                return map;
            }
            map.put("msg", "添加失败！");
        }else{//如果不为空时为修改
            if (companysSelective.size() < 2) {
                //数据中就一条数据看是不是自己
                if(companysSelective.size() == 0 || (int)companysSelective.get(0).getId()==(int)company.getId()){
                    int n = companyService.updateByPrimaryKeySelective(company);
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
    @RequestMapping("/selectByPrimaryKey")
    @ResponseBody
    public Company selectByPrimaryKey(Integer id) {
        return companyService.selectByPrimaryKey(id);
      /*  Map<String, Object> map = new HashMap<>();
        Company companytmp = new Company();
        companytmp.setCode(html.getCode());
        int count = companyService.countAllCompanys(companytmp);
        if (count > 0) {
            map.put("msg", "编码已存在！");
            return map;
        }
        int n = companyService.updateByPrimaryKeySelective(html);
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

    @RequestMapping("/deleteCompany")
    @ResponseBody
    public Map<String, Object> deleteCompany(String[] ids) {
        int n = 0;
        for (String id : ids) {
            n += companyService.deleteByPrimaryKey(Integer.valueOf(id));
        }
        Map<String, Object> map = new HashMap<>();
        map.put("msg", "删除成功:" + n + "条记录！");
        if (n == ids.length) {
            map.put("code", 200);
        }
        return map;
    }
}

