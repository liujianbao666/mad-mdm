package com.jekeen.users.controller;

import com.github.pagehelper.PageInfo;
import com.jekeen.common.util.MyTool;
import com.jekeen.users.model.SysUsers;
import com.jekeen.users.service.SysUsersService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
/**
 * 用户登录，后台控制器
 */
@Controller
@RequestMapping("/")
@Log4j2
public class LoginController {
    @Autowired
    private SysUsersService sysUsersService;

    @RequestMapping(value = "/")
    public String login(Model model){
        log.info("登陆请求/：" + new Date());
        return "login";
    }
    /**
     * 登录界面
     * @return
     */
    @RequestMapping("/success")
    public String success(HttpServletRequest request){
        Principal principal = request.getUserPrincipal();
        String account= principal.getName();
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("account",account);
        parameterMap.put("equalLikeFlag","equal");

        PageInfo<SysUsers> listSysUsers = sysUsersService.listSysUsers(0,Integer.MAX_VALUE,parameterMap);
        if(listSysUsers.getSize()==1){
            SysUsers sysUser = listSysUsers.getList().get(0);
            sysUser.setLastLoginIp(request.getRemoteAddr());
            sysUser.setLastLoginTime(MyTool.getStandardTime());
            sysUser.setOnlineFlag(true);
            sysUsersService.updateByPrimaryKeySelective(sysUser);
        }
        log.info("登录成功：" + account);
        return "redirect:/department/tree";
        //return "index";
    }
}
