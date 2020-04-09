package com.jekeen.mdm.dao;

import com.jekeen.mdm.model.Employee;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmployeeMapper {

    Employee selectByPrimaryKey(String code);

    String selectMaxStaffNumber();

    List<Employee> getEmployeesSelective(Employee record);

    int deleteByPrimaryKey(String code);

    int insert(Employee record);

    int insertSelective(Employee record);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}
