package com.jekeen.mdm.dao;

import com.jekeen.mdm.model.OperateLog;

import java.util.List;

public interface OperateLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OperateLog record);

    int insertSelective(OperateLog record);

    OperateLog selectByPrimaryKey(Integer id);

    List<OperateLog> selectSelective(OperateLog record);

    int updateByPrimaryKeySelective(OperateLog record);

    int updateByPrimaryKey(OperateLog record);
}
