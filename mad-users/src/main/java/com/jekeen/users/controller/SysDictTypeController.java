package com.jekeen.users.controller;

import com.github.pagehelper.PageInfo;
import com.jekeen.common.util.MyTool;
import com.jekeen.users.model.SysDictType;
import com.jekeen.users.service.SysDictTypeService;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 用户字典，后台控制器
 *
 * @author lgh
 * @create 2019-07-05 下午 16:44
 **/
@Controller
@RequestMapping("/dictType")
@Log4j2
public class SysDictTypeController {
    @Autowired
    SysDictTypeService sysDictTypeService;

    /**
     * 管理页面
     */
    @RequestMapping("/manage")
    public String manage(Model model) {
        SysDictType sysDictType = new SysDictType();
        model.addAttribute("sysDictType", sysDictType);
        return "dictType/manage";
    }

    /**
     * 分页查询
     *
     * @param draw   请求次数(浏览器cache的编号，递增不可重复)
     * @param start  起始数
     * @param length 每页显示数
     * @return json
     */
    @RequestMapping("/listSysDictTypes")
    @ResponseBody
    public Map<String, Object> listSysDictTypes(int draw, int start, int length, String code, String value, String name) {
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> parameterMap = new HashMap<String, Object>();

        parameterMap.put("code", code);
        parameterMap.put("value", value);
        parameterMap.put("name", name);

        PageInfo<SysDictType> listSysDictTypes = sysDictTypeService.listSysDictTypes(start, length, parameterMap);
        long count = listSysDictTypes.getTotal();
        result.put("draw", draw);
        result.put("recordsTotal", count);
        result.put("recordsFiltered", count);
        result.put("data", listSysDictTypes.getList());
        return result;
    }


    /**
     * 添加
     */
    @Transactional
    @RequestMapping("/addSysDictType")
    @ResponseBody
    public Map<String, Object> addSysDictType(SysDictType sysDictType) {
        Map<String, Object> map = new HashMap<>();
        String msg = "";
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        String id = sysDictType.getId();
        //新增
        if (StringUtils.isEmpty(id)) {
            //查询已存在
            parameterMap.put("id", sysDictType.getId());
            parameterMap.put("equalLikeFlag", "equal");

            sysDictType.setId(MyTool.getUUID());
            int n = sysDictTypeService.insertSelective(sysDictType);
            if (n == 1) {
                msg = "添加成功！";
                map.put("msg", msg);
                map.put("code", 200);
                log.info(msg);
                return map;
            }
            msg = "添加失败！";
            map.put("msg", msg);
            log.info(msg);
            return map;
        }
        //修改
        else {
            parameterMap.put("id", sysDictType.getId());
            parameterMap.put("equalLikeFlag", "equal");
            parameterMap.put("start", 0);
            parameterMap.put("length", Integer.MAX_VALUE);

            PageInfo<SysDictType> dictTypes = sysDictTypeService.listSysDictTypes(0, Integer.MAX_VALUE, parameterMap);

            if (dictTypes.getSize() == 1) {
                msg = "编码已存在！";
                map.put("msg", msg);
                return map;
            }
            int n = sysDictTypeService.updateByPrimaryKeySelective(sysDictType);
            msg = "修改成功！";
            map.put("msg", msg);
            map.put("code", 200);
        }
        log.info(msg);
        return map;
    }


    /**
     * 删除
     *
     * @param ids
     * @return
     */
    @Transactional
    @RequestMapping("/sysDictTypeDelete")
    @ResponseBody
    public Map<String, Object> sysDictTypeDelete(String[] ids) {
        int n = 0;
        for (String id : ids) {
            n += sysDictTypeService.deleteByPrimaryKey(id);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("msg", "删除成功:" + n + "条记录！");
        if (n == ids.length) {
            map.put("code", 200);
        }
        log.info("删除成功:" + n + "条记录！");
        return map;
    }


    /**
     * 查询
     *
     * @return
     */
    @RequestMapping("/getDictType")
    @ResponseBody
    public Map<String, Object> getDictType(String id) {
        Map<String, Object> map = new HashMap<>();
        String msg = "";
        SysDictType sysDictType = sysDictTypeService.selectByPrimaryKey(id);
        if (null != sysDictType) {
            map.put("code", 200);
            map.put("sysDictType", sysDictType);
            log.info("查询成功!");
        } else {
            msg = "查询失败！";
            map.put("msg", msg);
            log.info(msg);
        }
        return map;
    }
}
