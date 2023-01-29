package com.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.AdminMapper;
import com.pojo.Admin;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public PageInfo<Admin> queryAdminAll(Admin admin, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Admin> adminList = adminMapper.queryAdminInfoAll(admin);
        return new PageInfo<>(adminList);
    }

    @Override
    public void addAdmin(Admin admin) {
        adminMapper.insert(admin);
    }

    @Override
    public Admin queryAdminById(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateAdmin(Admin admin) {
        adminMapper.updateByPrimaryKey(admin);
    }

    @Override
    public void deleteAdminByIds(List<String> ids) {
        for (String id : ids) {
            adminMapper.deleteByPrimaryKey(Integer.parseInt(id));
        }
    }

    @Override
    public Admin queryAdminByLoginNameAndPassword(String loginName, String password) {
        return adminMapper.queryAdminByLoginNameAndPassword(loginName, password);
    }
}
