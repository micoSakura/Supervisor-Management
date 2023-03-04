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

    /**
     * 查询督导秘书信息
     *
     * @param admin
     * @return admin
     */
    List<Admin> queryAdminInfoAll(Admin admin);

    /**
     * 督导秘书登录
     *
     * @param loginName
     * @param password
     * @return loginName, password
     */
    Admin queryAdminByLoginNameAndPassword(@Param("loginName") String loginName, @Param("password") String password);
}
