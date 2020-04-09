package com.jekeen.users.controller;

import com.github.pagehelper.PageInfo;
import com.jekeen.users.model.SysUsers;
import com.jekeen.users.service.SysUsersService;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * 系统用户，后台控制器
 */
@RestController
@RequestMapping("/users")
@Log4j2
public class SysUsersController {

    @Autowired
    SysUsersService sysUsersService;
    @Autowired
    private RestTemplate restTemplate;

    /**
     * 管理页面
     */
    @RequestMapping("/manage")
    public ModelAndView manage(@ModelAttribute("sysUsers")SysUsers sysUsers) {
        ModelAndView mv = new ModelAndView("users/manage");
        return mv;
    }

    /**
     * 分页查询
     *
     * @param draw   请求次数(浏览器cache的编号，递增不可重复)
     * @param start  起始数
     * @param length 每页显示数
     * @return json
     */
    @RequestMapping("/listSysUsers")
    public Map<String, Object> listSysUsers(int draw, int start, int length, String name, String account, String teamName, String onlineFlag, String lockFlag, String wechatNickname, String remark) {
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> parameterMap = new HashMap<String, Object>();

        parameterMap.put("name", name);
        parameterMap.put("account", account);
        parameterMap.put("teamName", teamName);
        parameterMap.put("onlineFlag", onlineFlag);
        parameterMap.put("lockFlag", lockFlag);
        parameterMap.put("wechatNickname", wechatNickname);
        parameterMap.put("remark", remark);

        PageInfo<SysUsers> listSysUsersPageInfo = sysUsersService.listSysUsers(start, length,parameterMap);
        long count =listSysUsersPageInfo.getTotal();
        result.put("draw", draw);
        result.put("recordsTotal", count);
        result.put("recordsFiltered", count);
        result.put("data", listSysUsersPageInfo.getList());
        return result;
    }
    /**
     * 添加
     */
    @Transactional
    @RequestMapping("/addSysUsers")
    public Map<String, Object> addSysUsers(SysUsers sysUsers) {
        Map<String, Object> map = new HashMap<>();
        String msg = "";
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        String id = sysUsers.getId();
        SysUsers sysUsersTemp = sysUsersService.selectByPrimaryKey(id);
        //新增
        //if (StringUtils.isEmpty(id)) {
        if (sysUsersTemp == null) {
            //查询已存在
            parameterMap.put("account", sysUsers.getAccount());
            parameterMap.put("equalLikeFlag", "equal");
            PageInfo<SysUsers> listSysUsers =   sysUsersService.listSysUsers(0,Integer.MAX_VALUE,parameterMap);

            if (listSysUsers.getSize() > 0) {
                msg = "账号已存在！";
                map.put("msg", msg);
                return map;
            }
            //密码加密
            String password = sysUsers.getPassword();
            BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
            String hashStr = encode.encode(password);
            sysUsers.setPassword(hashStr);

            //sysUsers.setId(MyTool.getUUID());
            int n = sysUsersService.insertSelective(sysUsers);
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
            parameterMap.put("account", sysUsers.getAccount());
            parameterMap.put("equalLikeFlag", "equal");

            PageInfo<SysUsers> usersList = sysUsersService.listSysUsers(0,Integer.MAX_VALUE,parameterMap);

            if (usersList.getSize() > 1) {
                msg = "账号已存在！";
                map.put("msg", msg);
                return map;
            } else if (usersList.getSize() == 1) {
                if (!id.equals(usersList.getList().get(0).getId())) {
                    msg = "账号已存在！";
                    map.put("msg", msg);
                    return map;
                }
            }
            //密码非空，修改密码  wjy 2019.6.29
            String password = sysUsers.getPassword();
            if (StringUtils.isNotEmpty(password)) {
                BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
                String hashStr = encode.encode(password);
                sysUsers.setPassword(hashStr);
            }

            int n = sysUsersService.updateByPrimaryKeySelective(sysUsers);
            msg = "修改成功！";
            map.put("msg", msg);
            map.put("code", 200);
        }
        log.info(msg);
        return map;
    }

    /**
     * 删除
     * @param ids
     * @return
     */
    @Transactional
    @RequestMapping("/sysUsersDelete")
    public Map<String, Object> sysUsersDelete(String[] ids) {
        int n = 0;
        for (String id : ids) {
            n += sysUsersService.deleteByPrimaryKey(id);
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
     * @return
     */
    @RequestMapping("/getUsers")
    public Map<String, Object> getUsers(String id,String account) {
        Map<String, Object> map = new HashMap<>();
        String msg = "";
        SysUsers sysUsers =null;
        if(StringUtils.isNotEmpty(id)){
            sysUsers = sysUsersService.selectByPrimaryKey(id);
        }
        else if(StringUtils.isNotEmpty(account)){
            Map<String, Object> parameterMap = new HashMap<String, Object>();
            parameterMap.put("account",account);
            parameterMap.put("equalLikeFlag","equal");

            PageInfo<SysUsers> usersList = sysUsersService.listSysUsers(0,Integer.MAX_VALUE,parameterMap);
            if(usersList.getSize()==1){
                sysUsers = usersList.getList().get(0);
            }
        }
        if (null != sysUsers) {
            map.put("code", 200);
            map.put("sysUsers", sysUsers);
            log.info("查询用户成功!");
        } else {
            msg = "查询用户失败！";
            map.put("msg", msg);
            log.info(msg);
        }
        return map;
    }
    /**
     * 修改密码
     * wjy 2019.7.4
     * @return
     */
    @Transactional
    @RequestMapping("/updatePassword")
    public Map<String, Object> updatePassword(String oldPassword,String newPassword,String account) {
        Map<String, Object> map = new HashMap<>();
        String msg = "";
        SysUsers sysUsers =null;
        if(StringUtils.isNotEmpty(account)){
            Map<String, Object> parameterMap = new HashMap<String, Object>();
            parameterMap.put("account",account);
            parameterMap.put("equalLikeFlag","equal");

            PageInfo<SysUsers> usersList = sysUsersService.listSysUsers(0,Integer.MAX_VALUE,parameterMap);
            if(usersList.getSize()==1){
                sysUsers = usersList.getList().get(0);
            }
            if (usersList.getSize() == 1) {
                sysUsers = usersList.getList().get(0);
                String password = sysUsers.getPassword();
                //校验原密码
                BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
                if (encode.matches(oldPassword, password)) {
                    sysUsers.setPassword(encode.encode(newPassword));
                    sysUsersService.updateByPrimaryKeySelective(sysUsers);
                    msg = "修改密码成功！";
                    map.put("code", 200);
                    map.put("msg", msg);
                    log.info(msg);
                }
                else{
                    msg = "原密码不正确！";
                    map.put("msg", msg);
                    log.info(msg);
                }
            }
            else {
                msg = "账号查询异常！";
                map.put("msg", msg);
                log.info(msg);
            }
        }
        else {
            msg = "账号为空！";
            map.put("msg", msg);
            log.info(msg);
        }
        return map;
    }

//    @RequestMapping("/loadDepartmentsTree")
//    public List<MyTreeNode> LoadDepartmentsTree(Department department){
//        List<MyTreeNode> myTreeNodes = restTemplate.getForObject(mdmUrl+"department/loadDepartmentsTree", List.class);
//        return myTreeNodes;
//    }
//
//
//    @RequestMapping("/loadEmployeeByDepart")
//    public JSONArray loadEmployeeByDepartment(Employee employee){
//        String employees = restTemplate.postForObject(mdmUrl+"employee/selectSelective",employee,String.class);
//        JSONArray jsonArray = JSON.parseArray(employees);
//
//        return jsonArray;
//    }
//    @RequestMapping("/selectEmpNameAndDepartName")
//    public Map<String,String> selectEmpNameAndDepartName(String userId){
//        Map<String,String> res = new HashMap<>();
//        ResponseEntity<Employee> employee = restTemplate.getForEntity(mdmUrl+"employee/" + userId, Employee.class);
//        res.put("name",employee.getBody().getName());
//        res.put("userId",employee.getBody().getUserId());
//
//        String departmentId = employee.getBody().getDepartmentId();
//        //一个人可能又多个部门
//        String[] departmentIdArr = departmentId.split(",");
//        StringBuffer departmentName = new StringBuffer("");
//        for(int i = 0; i < departmentIdArr.length; i++) {
//        	ResponseEntity<Department> department = restTemplate.getForEntity(mdmUrl+"department/" + departmentIdArr[i], Department.class);
//            if(i == 0) {
//            	departmentName.append(department.getBody().getName());
//            }else {
//            	departmentName.append(",").append(department.getBody().getName());
//            }
//        }
//        res.put("departmentName",departmentName.toString());
//        res.put("departmentId",departmentId);
//        return res;
//    }
}
