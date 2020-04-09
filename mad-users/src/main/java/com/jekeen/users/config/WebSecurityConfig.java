package com.jekeen.users.config;

import com.github.pagehelper.PageInfo;
import com.jekeen.users.model.SysDictType;
import com.jekeen.users.service.SysDictTypeService;
import com.jekeen.users.support.MyAuthenticationFailHandler;
import com.jekeen.users.support.MyAuthenticationSuccessHandler;
import com.jekeen.users.support.MyUserDetailsService;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private MyUserDetailsService myUserDetailsService;
    @Autowired
    private MyAuthenticationSuccessHandler authenticationSuccessHandler;
    @Autowired
    private MyAuthenticationFailHandler authenticationFailHandler;
    @Autowired
    SysDictTypeService sysDictTypeService;
    /**
     * 设置不拦截规则
     */
    private static final String[] AUTH_WHITELIST = {
            "/",
            "/adminlte/**",
            "/jqgrid/**",
            "/blueindustry/**",
            "/sweetalert2/**",
            "/jstree-3.3.7/**",
            "/js/**",
            "/jquery-validation-1.19.0/**",
            "/department/**",
            "/employee/**"
    };

    @Autowired
    public void globalUserDetails(AuthenticationManagerBuilder auth) throws Exception {
        //字典获取，管理员信息
        List<SysDictType> sysDictTypes = getSysDictTypes("ADMIN");
        String username ="root";
        String password ="root";
        if(sysDictTypes.size()==2){
            for (SysDictType sysDictType : sysDictTypes) {
                if("username".equals(sysDictType.getValue())){
                    username = sysDictType.getName();
                }
                if("password".equals(sysDictType.getValue())){
                    password = sysDictType.getName();
                }
            }
        }

        auth.inMemoryAuthentication().passwordEncoder(new BCryptPasswordEncoder()).withUser(username)
                .password(new BCryptPasswordEncoder().encode(encode(password))).roles("ADMIN");

        auth.userDetailsService(myUserDetailsService).passwordEncoder(new BCryptPasswordEncoder() {
            @Override
            public boolean matches(CharSequence rawPassword, String encodedPassword) {
                String rawPasswordStr = (String) rawPassword;
                //base64解密
                rawPasswordStr = new String(decode(rawPasswordStr));
                Boolean b = new BCryptPasswordEncoder().matches(rawPasswordStr, encodedPassword);
                return b;
            }
        });
    }

    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers(AUTH_WHITELIST).permitAll()
                .anyRequest().authenticated();

        http.
                formLogin().loginPage("/").loginProcessingUrl("/myLogin").permitAll()
                .successHandler(authenticationSuccessHandler)
                .failureHandler(authenticationFailHandler)

                .and()
                .logout()//配置注销
                .logoutUrl("/logout").permitAll()
                .and()
                .csrf().disable();

        //以下这句就可以控制单个用户只能创建一个session，也就只能在服务器登录一次
        http.sessionManagement().maximumSessions(1).expiredUrl("/?login_username_login_anothor_addr=true");
        //解决iframe与安全器兼容性问题
        http.headers().frameOptions().disable();
    }

    /**
     * Base64解码
     */
    public static byte[] decode(String base64String) {
        try {
            return Base64.decodeBase64(base64String.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }

    /**
     * Base64编码
     * wjy 2019.7.2
     */
    public static String encode(String text) {
        try {
            return Base64.encodeBase64String(text.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }
    /**
     * 根据code 获取字典
     *
     * @param code
     * @return 字典List
     */
    private List<SysDictType> getSysDictTypes(String code) {
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("code", code);
        PageInfo<SysDictType> sysDictTypeList = sysDictTypeService.listSysDictTypes(0, Integer.MAX_VALUE, parameterMap);
        return sysDictTypeList.getList();
    }
}
