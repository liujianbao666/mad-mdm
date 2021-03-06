package com.jekeen.mdm.service;

import com.jekeen.mdm.model.WorkCalendar;
import com.github.pagehelper.PageInfo;

import java.util.Date;
import java.util.List;

public interface WorkCalendarService {
    /**
     * 根据字段查询列表
     * @param record
     * @return
     */
    List<WorkCalendar> getWorkCalendarsSelective(WorkCalendar record);

    /**
     * 添加,code与名称不能为空
     * @param record
     * @return
     */
    int insertSelective(WorkCalendar record);

    /**
     * 根据id删除
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 根据id更新公司属性
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(WorkCalendar record);

    /**
     * 按主键查询
     * @param id
     * @return
     */
    WorkCalendar selectByPrimaryKey(Integer id);

    /**
     * 按日期查询
     * @param date
     * @return
     */
    List<WorkCalendar> selectByDate(Date date);

    /**
     * 分页查询
     * @param start
     * @param length
     * @param workCalendar
     * @return
     */
    PageInfo<WorkCalendar> getWorkCalendarPageSelective(Integer start, Integer length, WorkCalendar workCalendar);
}
