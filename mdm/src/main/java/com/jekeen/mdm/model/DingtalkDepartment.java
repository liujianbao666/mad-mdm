package com.jekeen.mdm.model;

import lombok.Data;

@Data
public class DingtalkDepartment {
    /**
     * 部门id
     */
    private String id;

    /**
     * 部门名称
     */
    private String name;

    /**
     * 父部门id，根部门为1
     */
    private String parentid;

    /**
     * 当前部门在父部门下的所有子部门中的排序值
     */
    private String orders;

    /**
     * 是否同步创建一个关联此部门的企业群，true表示是，false表示不是
     */
    private String createdeptgroup;

    /**
     * 当部门群已经创建后，是否有新人加入部门会自动加入该群，true表示是，false表示不是
     */
    private String autoadduser;

    /**
     * 是否隐藏部门，true表示隐藏，false表示显示
     */
    private String depthiding;

    /**
     * 可以查看指定隐藏部门的其他部门列表，如果部门隐藏，则此值生效，取值为其他的部门id组成的的字符串，使用“|”符号进行分割
     */
    private String deptpermits;

    /**
     * 可以查看指定隐藏部门的其他人员列表，如果部门隐藏，则此值生效，取值为其他的人员userid组成的的字符串，使用“|”符号进行分割
     */
    private String userpermits;

    /**
     * 是否本部门的员工仅可见员工自己，为true时，本部门员工默认只能看到员工自己
     */
    private String outerdept;

    /**
     * 本部门的员工仅可见员工自己为true时，可以配置额外可见部门，值为部门id组成的的字符串，使用“|”符号进行分割
     */
    private String outerpermitdepts;

    /**
     * 本部门的员工仅可见员工自己为true时，可以配置额外可见人员，值为userid组成的的字符串，使用“|”符号进行分割
     */
    private String outerpermitusers;

    /**
     * 企业群群主
     */
    private String orgdeptowner;

    /**
     * 部门的主管列表，取值为由主管的userid组成的字符串，不同的userid使用“|”符号进行分割
     */
    private String deptmanageruseridlist;

    /**
     * 部门标识字段，开发者可用该字段来唯一标识一个部门，并与钉钉外部通讯录里的部门做映射
     */
    private String sourceidentifier;

    /**
     * 部门群是否包含子部门
     */
    private String groupcontainsubdept;

}
