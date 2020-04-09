package com.jekeen.users.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jekeen.users.dao.SysUsersMapper;
import com.jekeen.users.model.SysUsers;
import com.jekeen.users.service.SysUsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class SysUsersServiceImpl implements SysUsersService {

    @Autowired
    SysUsersMapper sysUsersMapper;


    @Override
    public int deleteByPrimaryKey(String id) {
        return sysUsersMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(SysUsers sysUsers) {
        return sysUsersMapper.insertSelective(sysUsers);
    }

    @Override
    public SysUsers selectByPrimaryKey(String id) {
        return sysUsersMapper.selectByPrimaryKey(id);
    }
    @Override
    public int updateByPrimaryKeySelective(SysUsers sysUsers) {
        return sysUsersMapper.updateByPrimaryKeySelective(sysUsers);
    }
    @Override
    public PageInfo<SysUsers> listSysUsers(int start, int length,Map<String, Object> parameterMap) {
        PageHelper.offsetPage(start,length);
        List<SysUsers> listSysUsers = sysUsersMapper.listSysUsers(parameterMap);
        PageInfo<SysUsers> listSysUsersPageInfo = new PageInfo<>(listSysUsers);
        return listSysUsersPageInfo;
    }
}
