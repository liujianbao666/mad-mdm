package com.jekeen.users.support;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;

@Component
@Slf4j
public class MyAuthenticationFailHandler implements AuthenticationFailureHandler {

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String exceptionMes = exception.getMessage();
        String url = "/?login_fail_error=true";
        if("Bad credentials".equals(exceptionMes)){
//            exceptionMes ="login_password_error";
            url = "/?login_password_error=true";
        }
        else if("login_username_not_found".equals(exceptionMes)){
            url = "/?login_username_not_found=true";
        }
        else if("login_username_locked".equals(exceptionMes)){
            url = "/?login_username_locked=true";
        }
        else if("login_forbid_authorization".equals(exceptionMes)){
            url = "/?login_forbid_authorization=true";
        }
        else if("login_fail_error".equals(exceptionMes)){
            url = "/?login_fail_error=true";
        }

//        Locale locale = LocaleContextHolder.getLocale();
//        log.info("登录失败:" + locale.getLanguage());
        Locale locale = LocaleContextHolder.getLocale();
        log.info("登录失败url:" + url);
        log.info("exceptionMes:" + exceptionMes);
        redirectStrategy.sendRedirect(request, response, url);
        return;
    }
}
