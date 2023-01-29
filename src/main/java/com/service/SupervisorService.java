package com.service;


import com.github.pagehelper.PageInfo;
import com.pojo.Supervisor;

import java.util.List;

public interface SupervisorService {
    PageInfo<Supervisor> querySupervisorAll(Supervisor supervisor, Integer page, Integer limit);

    void addSupervisor(Supervisor supervisor);

    Supervisor querySupervisorBySupNum(Integer supNum);

    void updateSupervisor(Supervisor supervisor);

    void deleteSupervisorBySupNum(List<String> supNums);

    Supervisor querySupervisorByLoginNameAndPassword(String loginName, String password);
}
