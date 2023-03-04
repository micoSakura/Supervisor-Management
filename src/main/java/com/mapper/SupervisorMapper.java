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

    /**
     * 查询督导信息
     *
     * @param supervisor
     * @return supervisor
     */
    List<Supervisor> querySupervisorInfoAll(Supervisor supervisor);

    /**
     * 督导登录
     *
     * @param loginName
     * @param password
     * @return loginName, password
     */
    Supervisor querySupervisorByLoginNameAndPassword(@Param("loginName") String loginName, @Param("password") String password);
}
