package com.mapper;

import com.pojo.Supervisor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SupervisorMapper {
    int deleteByPrimaryKey(Integer supNum);

    int insert(Supervisor record);

    int insertSelective(Supervisor record);

    Supervisor selectByPrimaryKey(Integer supNum);

    int updateByPrimaryKeySelective(Supervisor record);

    int updateByPrimaryKey(Supervisor record);

    List<Supervisor> querySupervisorInfoAll(Supervisor supervisor);

    Supervisor querySupervisorByLoginNameAndPassword(@Param("loginName") String loginName, @Param("password") String password);
}