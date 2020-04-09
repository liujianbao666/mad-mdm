package com.jekeen.mdm.model;

public class OperateLog {
    /**
     * 
     */
    private Integer id;

    /**
     * 操作类型(1员工变更2部门变更3岗位变更)
     */
    private String operateType;

    /**
     * 变更时间
     */
    private String operateTime;

    /**
     * 备注
     */
    private String remark;

    /**
     * 级别
     */
    private String level;

    /**
     * 
     */
    private Integer userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOperateType() {
        return operateType;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType == null ? null : operateType.trim();
    }

    public String getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(String operateTime) {
        this.operateTime = operateTime == null ? null : operateTime.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}