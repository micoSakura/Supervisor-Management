package com.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.SupervisorMapper;
import com.pojo.Supervisor;
import com.service.SupervisorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SupervisorServiceImpl implements SupervisorService {

    @Resource
    private SupervisorMapper supervisorMapper;

    @Override
    public PageInfo<Supervisor> querySupervisorAll(Supervisor supervisor, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Supervisor> supervisorList = supervisorMapper.querySupervisorInfoAll(supervisor);
        return new PageInfo<>(supervisorList);
    }

    @Override
    public void addSupervisor(Supervisor supervisor) {
        supervisorMapper.insert(supervisor);
    }

    @Override
    public Supervisor querySupervisorBySupNum(Integer supNum) {
        return supervisorMapper.selectByPrimaryKey(supNum);
    }

    @Override
    public void updateSupervisor(Supervisor supervisor) {
        supervisorMapper.updateByPrimaryKey(supervisor);
    }

    @Override
    public void deleteSupervisorBySupNum(List<String> supNums) {
        for (String supNum : supNums) {
            supervisorMapper.deleteByPrimaryKey(Integer.parseInt(supNum));
        }
    }

    @Override
    public Supervisor querySupervisorByLoginNameAndPassword(String loginName, String password) {
        return supervisorMapper.querySupervisorByLoginNameAndPassword(loginName, password);
    }

    @Override
    public void save(List<Supervisor> supervisorList) {
        supervisorMapper.save(supervisorList);
    }
}
