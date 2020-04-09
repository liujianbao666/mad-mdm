package com.jekeen.mdm.dao;

import com.jekeen.mdm.model.TableManage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TableManageMapper {
    int insert(TableManage record);

    int insertSelective(TableManage record);

    List<TableManage> getTableManagerSelective(TableManage record);
}