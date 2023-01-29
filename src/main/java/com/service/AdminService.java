package com.service;

import com.github.pagehelper.PageInfo;
import com.pojo.Admin;

import java.util.List;

public interface AdminService {

    PageInfo<Admin> queryAdminAll(Admin admin,Integer page,Integer limit);

    void addAdmin(Admin admin);

    Admin queryAdminById(Integer id);

    void  updateAdmin(Admin admin);

    void deleteAdminByIds(List<String> ids);

    Admin queryAdminByLoginNameAndPassword(String loginName,String password);
}
