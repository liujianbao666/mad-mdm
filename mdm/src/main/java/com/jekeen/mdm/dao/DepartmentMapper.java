package com.jekeen.mdm.dao;

import com.jekeen.mdm.model.Department;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface DepartmentMapper {
    int deleteByPrimaryKey(String departmentId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(String id);

    List<Department> getDepartmentsSelective(Department record);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}
