package com.jekeen.mdm.service;

import com.jekeen.mdm.model.OperateLog;

import java.util.List;

public interface OperateLogService {

    int deleteByPrimaryKey(Integer id);

    int insertSelective(OperateLog record);

    OperateLog selectByPrimaryKey(Integer id);

    List<OperateLog> selectSelective(OperateLog record);

    int updateByPrimaryKeySelective(OperateLog record);

}
