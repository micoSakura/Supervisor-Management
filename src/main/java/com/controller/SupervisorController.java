package com.controller;

import com.alibaba.excel.EasyExcel;
import com.github.pagehelper.PageInfo;
import com.listener.CourseListener;
import com.listener.SupervisorListener;
import com.pojo.Course;
import com.pojo.Supervisor;
import com.service.SupervisorService;
import com.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@Controller
public class SupervisorController {

    @Resource
    private SupervisorService supervisorService;

    @GetMapping("/supervisorList")
    public String supervisorList() {
        return "supervisor/supervisorList";
    }

    @RequestMapping("/querySupervisorList")
    @ResponseBody
    public DataInfo querySupervisorList(Supervisor supervisor
            , @RequestParam(defaultValue = "1") Integer page
            , @RequestParam(defaultValue = "15") Integer limit) {
        PageInfo<Supervisor> pageInfo = supervisorService.querySupervisorAll(supervisor, page, limit);
        return DataInfo.ok("成功", pageInfo.getTotal(), pageInfo.getList());
    }


    @GetMapping("/supervisorAdd")
    public String supervisorAdd() {
        return "supervisor/supervisorAdd";
    }

    @RequestMapping("/addSupervisor")
    @ResponseBody
    public DataInfo addSupervisor(Supervisor supervisor) {
        supervisorService.addSupervisor(supervisor);
        return DataInfo.ok();
    }

    @GetMapping("/querySupervisorBySupNum")
    public String querySupervisorBySupNum(Integer supNum, Model model) {
        Supervisor supervisor = supervisorService.querySupervisorBySupNum(supNum);
        model.addAttribute("info", supervisor);
        return "supervisor/supervisorUpdate";
    }

    @RequestMapping("/updateSupervisor")
    @ResponseBody
    public DataInfo updateSupervisor(@RequestBody Supervisor supervisor,
                                     HttpServletRequest request) {
        DataInfo dataInfo = new DataInfo();
        dataInfo.setMsg("/login");
        HttpSession session = request.getSession();
        Supervisor supervisors = supervisorService.querySupervisorBySupNum(supervisor.getSupNum());
        if (!Objects.equals(supervisors.getLoginName(), supervisor.getLoginName())){
            supervisorService.updateSupervisor(supervisor);
            session.invalidate();
            return dataInfo;
        } else if (!Objects.equals(supervisors.getPassword(), supervisor.getPassword())){
            supervisorService.updateSupervisor(supervisor);
            session.invalidate();
            return dataInfo;
        } else {
            supervisorService.updateSupervisor(supervisor);
        }
        return DataInfo.ok();
    }

    @RequestMapping("/deleteSupervisorBySupNum")
    @ResponseBody
    public DataInfo deleteSupervisorBySupNum(String supNum) {
        List<String> list = Arrays.asList(supNum.split(","));
        supervisorService.deleteSupervisorBySupNum(list);
        return DataInfo.ok();
    }

    @PostMapping("supervisorUpload")
    @ResponseBody
    public DataInfo supervisorUpload(MultipartFile file) throws IOException {
        EasyExcel.read(file.getInputStream(), Supervisor.class, new SupervisorListener(supervisorService)).sheet().doRead();
        return DataInfo.ok();
    }

    /**
     * 前台功能
     */
    @GetMapping("/supervisorInfo")
    public String supervisorInfo(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Supervisor supervisor = (Supervisor) session.getAttribute("supervisor");
        System.out.println("你获取的supervisor是: " + supervisor);
        String loginName = supervisor.getLoginName();
        String password = supervisor.getPassword();
        Supervisor supervisorInfo = supervisorService.querySupervisorByLoginNameAndPassword(loginName, password);
        model.addAttribute("info", supervisorInfo);
        return "supervisor/supervisorInfo";
    }

    @GetMapping("/supervisorUpdate")
    public String supervisorUpdate() {
        return "supervisor/supervisorUpdate";
    }
}
