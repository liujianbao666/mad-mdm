package com.jekeen.mdm.service;

import com.jekeen.mdm.model.TableManage;

import java.util.List;

public interface TableManagerService {
    /**
     *保存实体类
     * @param record
     * @return
     */
    int insertSelective(TableManage record);

    /**
     *查询实体列表
     * @param record
     * @return
     */
    List<TableManage> getTableManagerSelective(TableManage record);
}
