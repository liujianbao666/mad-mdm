package com.jekeen.mdm.service.impl;

import com.jekeen.mdm.dao.JobMapper;
import com.jekeen.mdm.model.Job;
import com.jekeen.mdm.service.JobService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class JobServiceImpl implements JobService {
    @Autowired
    JobMapper jobMapper;

    @Override
    public List<Job> getJobsSelective(Job record) {
        return jobMapper.getJobsSelective(record);
    }

    @Override
    public int insertSelective(Job record) {
        return jobMapper.insertSelective(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return jobMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Job record) {
        return jobMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public PageInfo<Job> getJobsPageSelective(Integer start, Integer length, Job job) {
        PageHelper.offsetPage(start,length);
        List<Job> jobSelective = jobMapper.getJobsSelective(job);
        PageInfo<Job> jobPageInfo = new PageInfo<Job>(jobSelective);
        return jobPageInfo;
    }

    @Override
    public Job selectByPrimaryKey(Integer id) {
        return jobMapper.selectByPrimaryKey(id);
    }
}
