package com.mapper;

import com.pojo.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    // 管理员查询
    List<Admin> queryAdminInfoAll(Admin admin);

    // 管理员登录
    Admin queryAdminByLoginNameAndPassword(@Param("loginName") String loginName, @Param("password") String password);
}