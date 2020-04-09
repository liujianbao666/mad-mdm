package com.jekeen.mdm.service.impl;

import com.jekeen.mdm.dao.RolesMapper;
import com.jekeen.mdm.model.Roles;
import com.jekeen.mdm.service.RolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class RolesServiceImpl implements RolesService {
    @Autowired
    private RolesMapper rolesMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return rolesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int deleteSelective(Roles record) {
        return rolesMapper.deleteSelective(record);
    }

    @Override
    public int insert(Roles record) {
        return rolesMapper.insert(record);
    }

    @Override
    public int insertSelective(Roles record) {
        return rolesMapper.insertSelective(record);
    }

    @Override
    public Roles selectByPrimaryKey(Integer id) {
        return rolesMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Roles record) {
        return rolesMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Roles record) {
        return rolesMapper.updateByPrimaryKey(record);
    }


    @Override
    public List<Roles> selectSelective(Roles record) {
        List<Roles> roles = rolesMapper.selectSelective(record);
        return roles;
    }

    @Override
    public int saveOrUpdateRoleInfo(Roles record) {
        Roles rolesTmp = new Roles();
        rolesTmp.setRoleId(record.getRoleId());
        List<Roles> roles = this.selectSelective(rolesTmp);
        if(!roles.isEmpty()&&roles.size() > 0){
            record.setRoleId(roles.get(0).getId());
            return this.updateByPrimaryKeySelective(record);
        }else{
            return this.insert(record);
        }

    }
}
