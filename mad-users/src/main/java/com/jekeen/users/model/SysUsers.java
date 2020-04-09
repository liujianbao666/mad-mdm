package com.jekeen.users.model;

import lombok.Data;

@Data
public class SysUsers {
    /**
     * 主键
     */
    private String id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 账号
     */
    private String account;

    /**
     * 密码
     */
    private String password;

    /**
     * teamId
     */
    private String teamId;

    /**
     * teamName
     */
    private String teamName;

    /**
     * 电话
     */
    private String tel;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 最后登录时间
     */
    private String lastLoginTime;

    /**
     * 最后登录ip
     */
    private String lastLoginIp;

    /**
     * 在线标志
     */
    private Boolean onlineFlag;

    /**
     * 锁定标志
     */
    private Boolean lockFlag;

    /**
     * 微信昵称
     */
    private String wechatNickname;

    /**
     * 微信唯一识别号
     */
    private String wechatUnionid;

    /**
     * 备注
     */
    private String remark;

}
