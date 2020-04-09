package com.jekeen.mdm.model;

import lombok.Data;

@Data
public class Supplier {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 编码
     */
    private String code;

    /**
     * 名称
     */
    private String name;

    /**
     * 供应商类型见数据字典
     */
    private String supplierType;

}
