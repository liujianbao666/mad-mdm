package com.jekeen.mdm.service.impl;

import com.jekeen.mdm.dao.TableManageMapper;
import com.jekeen.mdm.model.TableManage;
import com.jekeen.mdm.service.TableManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TableManagerServiceImpl implements TableManagerService {
    @Autowired
    TableManageMapper tableManageMapper;
    @Override
    public int insertSelective(TableManage record) {
        return tableManageMapper.insertSelective(record);
    }

    @Override
    public List<TableManage> getTableManagerSelective(TableManage record){
        return tableManageMapper.getTableManagerSelective(record);
    }
}
