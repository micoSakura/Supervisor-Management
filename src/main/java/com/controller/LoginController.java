package com.controller;

import com.pojo.Admin;
import com.pojo.Supervisor;
import com.service.AdminService;
import com.service.SupervisorService;
import com.utils.IVerifyCodeGen;
import com.utils.SimpleCharVerifyCodeGenImpl;
import com.utils.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private SupervisorService supervisorService;

    @GetMapping("/login")
    public String login() {
        return "/login";
    }

    @RequestMapping("/verifyCode")
    public void verifyCode(HttpServletRequest request, HttpServletResponse response) {
        IVerifyCodeGen iVerifyCodeGen = new SimpleCharVerifyCodeGenImpl();
        try {
            //设置长宽
            VerifyCode verifyCode = iVerifyCodeGen.generate(80, 28);
            String code = verifyCode.getCode();
            //将VerifyCode绑定session
            request.getSession().setAttribute("VerifyCode", code);
            //设置响应头
            response.setHeader("Pragma", "no-cache");
            //设置响应头
            response.setHeader("Cache-Control", "no-cache");
            //在代理服务器端防止缓冲
            response.setDateHeader("Expires", 0);
            //设置响应内容类型
            response.setContentType("image/jpeg");
            response.getOutputStream().write(verifyCode.getImgBytes());
            response.getOutputStream().flush();
        } catch (IOException e) {
            System.out.println("异常处理");
        }
    }

    @RequestMapping("/loginIn")
    public String loginIn(HttpServletRequest request, Model model) {
        String loginName = request.getParameter("loginName");
        String password = request.getParameter("password");
        String code = request.getParameter("captcha");
        String type = request.getParameter("type");

        //判断验证码是否正确（验证码已经放入session）
        HttpSession session = request.getSession();
        String realCode = (String) session.getAttribute("VerifyCode");
        if (!realCode.equalsIgnoreCase(code)) {
            model.addAttribute("msg", "验证码不正确");
            return "/login";
        } else {
            //验证码正确则判断用户名和密码
            if (type.equals("1")) {
                //用户名和密码是否正确
                Admin admin = adminService.queryAdminByLoginNameAndPassword(loginName, password);
                if (admin == null) {//该用户不存在
                    model.addAttribute("msg", "用户名或密码错误");
                    return "/login";
                }
                session.setAttribute("admin", admin);
                session.setAttribute("type", "admin");
            } else {
                Supervisor supervisor = supervisorService.querySupervisorByLoginNameAndPassword(loginName, password);
                if (supervisor == null) {
                    model.addAttribute("msg", "用户名或密码错误");
                    return "/login";
                }
                session.setAttribute("supervisor", supervisor);
                session.setAttribute("type", "supervisor");
            }
            return "/index";
        }
    }


    @GetMapping("loginOut")
    public String loginOut(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();//注销
        return "/login";
    }
}
