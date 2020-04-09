package com.jekeen.users.dao;


import com.jekeen.users.model.SysUsers;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
@Mapper
public interface SysUsersMapper {
    int deleteByPrimaryKey(String id);

    int insertSelective(SysUsers sysUsers);

    SysUsers selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysUsers sysUsers);

    int countAllSysUsers(Map<String, Object> parameterMap);

    List<SysUsers> listSysUsers(Map<String, Object> parameterMap);
}
