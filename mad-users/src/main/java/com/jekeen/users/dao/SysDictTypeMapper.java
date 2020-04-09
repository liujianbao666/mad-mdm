package com.jekeen.users.dao;


import com.jekeen.users.model.SysDictType;

import java.util.List;
import java.util.Map;

public interface SysDictTypeMapper {
    int deleteByPrimaryKey(String id);

    int insertSelective(SysDictType sysDictType);

    SysDictType selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysDictType sysDictType);

    List<SysDictType> listSysDictTypes(Map<String, Object> parameterMap);

    List<SysDictType> getDictByParams(Map<String, Object> params);
}
