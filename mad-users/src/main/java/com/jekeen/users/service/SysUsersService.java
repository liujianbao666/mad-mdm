package com.jekeen.users.service;


import com.github.pagehelper.PageInfo;
import com.jekeen.users.model.SysUsers;

import java.util.Map;

public interface SysUsersService {
    int deleteByPrimaryKey(String id);

    int insertSelective(SysUsers sysUsers);

    SysUsers selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysUsers sysUsers);
    /**
     * 分页查询
     * @param start 当前页起始值
     * @param length 每页显示数量
     * @param parameterMap 查询参数
     * @return  当前页List
     */
    PageInfo<SysUsers> listSysUsers(int start, int length,Map<String, Object> parameterMap);
}
