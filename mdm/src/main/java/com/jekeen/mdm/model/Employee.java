package com.jekeen.mdm.model;

import lombok.Data;

@Data
public class Employee {
    /**
     * 主键
     */
    private String userId;
    /**
     * 员工编号
     */
    private String staffNumber;
    /**
     * 名称
     */
    private String name;

    /**
     * 部门编号
     */
    private String departmentId;

    /**
     * 岗位编码
     */
    private String jobId;

    /**
     * 部门
     */
    private Department department;
    /**
     * 离职状态 0,在职；1，离职；
     */
    private String status;

    /**
     * ERP中的内码ID
     */
    private String FId;
    /**
     * 入职日期
     */
    private String hiredDate;

    /**
     * 主管部门
     */
    private String leaderDepts;

    /**
     * ERP中变更前的组织机构编码
     */
    private String olddepartmentId;
}
