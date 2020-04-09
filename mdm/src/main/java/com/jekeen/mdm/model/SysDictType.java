package com.jekeen.mdm.model;

import lombok.Data;

@Data
public class SysDictType {
    /**
     * 主键Id
     */
    private Integer id;

    /**
     * 上级类型Id
     */
    private String parentId;

    /**
     * 对照码
     */
    private String code;

    /**
     * 对照值
     */
    private String value;

    /**
     * 名称
     */
    private String name;

}