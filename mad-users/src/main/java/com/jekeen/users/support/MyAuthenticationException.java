package com.jekeen.users.support;
import org.springframework.security.core.AuthenticationException;

/**
 * 自定义授权异常
 * @author wjy
 * @time    2019年5月14日
 */
public class MyAuthenticationException extends AuthenticationException {

    private static final long serialVersionUID = 1L;

    public MyAuthenticationException(String msg) {
        super(msg);
    }

    public MyAuthenticationException(String msg, Throwable t) {
        super(msg, t);
    }
}
