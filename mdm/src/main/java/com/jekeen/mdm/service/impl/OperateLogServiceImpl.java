package com.jekeen.mdm.service.impl;

import com.jekeen.mdm.dao.OperateLogMapper;
import com.jekeen.mdm.model.OperateLog;
import com.jekeen.mdm.service.OperateLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName OperateLogServiceImpl
 * @Description: TODO
 * @Author liujianbao
 * @Date 2019/10/26
 * @Version V1.0
 **/
@Service
public class OperateLogServiceImpl implements OperateLogService {
    @Autowired
    private OperateLogMapper operateLogMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return operateLogMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(OperateLog record) {
        return operateLogMapper.insertSelective(record);
    }

    @Override
    public OperateLog selectByPrimaryKey(Integer id) {
        return operateLogMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<OperateLog> selectSelective(OperateLog record) {
        return operateLogMapper.selectSelective(record);
    }

    @Override
    public int updateByPrimaryKeySelective(OperateLog record) {
        return operateLogMapper.updateByPrimaryKeySelective(record);
    }
}
