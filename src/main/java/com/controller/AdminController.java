package com.controller;

import com.github.pagehelper.PageInfo;
import com.pojo.Admin;
import com.service.AdminService;
import com.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/adminList")
    public String adminList() {
        return "admin/adminList";
    }

    @RequestMapping("/queryAdminList")
    @ResponseBody
    public DataInfo queryAdminList(Admin admin
            , @RequestParam(defaultValue = "1") Integer page
            , @RequestParam(defaultValue = "15") Integer limit) {
        PageInfo<Admin> pageInfo = adminService.queryAdminAll(admin, page, limit);
        return DataInfo.ok("成功", pageInfo.getTotal(), pageInfo.getList());
    }


    @GetMapping("/adminAdd")
    public String adminAdd() {
        return "admin/adminAdd";
    }

    @RequestMapping("/addAdmin")
    @ResponseBody
    public DataInfo addAdmin(Admin admin) {
        adminService.addAdmin(admin);
        return DataInfo.ok();
    }

    @GetMapping("/queryAdminById")
    public String queryAdminById(Integer id, Model model) {
        Admin admin = adminService.queryAdminById(id);
        model.addAttribute("info", admin);
        return "admin/adminUpdate";
    }

    @RequestMapping("/updateAdmin")
    @ResponseBody
    public DataInfo updateAdmin(@RequestBody Admin admin) {
        adminService.updateAdmin(admin);
        return DataInfo.ok();
    }

    @RequestMapping("/deleteAdminById")
    @ResponseBody
    public DataInfo deleteAdminById(String id) {
        List<String> list = Arrays.asList(id.split(","));
        adminService.deleteAdminByIds(list);
        return DataInfo.ok();
    }

    @GetMapping("/adminInfo")
    public String adminInfo() {
        return "admin/adminInfo";
    }
}
