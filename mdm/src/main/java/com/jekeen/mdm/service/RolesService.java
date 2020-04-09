package com.jekeen.mdm.service;

import com.jekeen.mdm.model.Roles;

import java.util.List;

public interface RolesService {
    /**
     * 根据id删除
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 删除
     * @param record
     * @return
     */
    int deleteSelective(Roles record);
    /**
     * 插入
     * @param record
     * @return
     */
    int insert(Roles record);

    /**
     * 插入
     * @param record
     * @return
     */
    int insertSelective(Roles record);

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    Roles selectByPrimaryKey(Integer id);

    /**
     * 根据主键更新
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Roles record);

    /**
     * 根据主键更新
     * @param record
     * @return
     */
    int updateByPrimaryKey(Roles record);

    /**
     * 保存或修改
     * @param record
     * @return
     */
    int saveOrUpdateRoleInfo(Roles record);

    /**
     * 根据角色属性查询
     * @param record
     * @return
     */
    List<Roles> selectSelective(Roles record);
}
