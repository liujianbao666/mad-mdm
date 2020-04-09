package com.jekeen.users.support;

import com.github.pagehelper.PageInfo;
import com.jekeen.users.model.SysUsers;
import com.jekeen.users.service.SysUsersService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private SysUsersService sysUsersService;

    /**
     * 授权的时候是对角色授权，而认证的时候应该基于资源，而不是角色，因为资源是不变的，而用户的角色是会变的
     */
    @Override
    public UserDetails loadUserByUsername(String username){
        SysUsers sysUser = null;
        //ROLE_USER  角色用户登录
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("account",username);
        parameterMap.put("equalLikeFlag","equal");

        PageInfo<SysUsers> usersList = sysUsersService.listSysUsers(0, Integer.MAX_VALUE, parameterMap);
        if(usersList.getSize() ==0){
            throw new MyAuthenticationException("login_username_not_found");
        }
       else{
            sysUser = usersList.getList().get(0);
        }

        if( null != sysUser.getLockFlag() && sysUser.getLockFlag()){
            throw new LockedException("login_username_locked");
        }
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();

        //ROLE_USER :  普通用户
        //ROLE_ADMIN :  管理员
        authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        User user = new User(sysUser.getAccount(), sysUser.getPassword(), authorities);

        return user;
    }
}
