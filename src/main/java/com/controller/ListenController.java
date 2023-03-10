package com.controller;

import com.alibaba.excel.EasyExcel;
import com.github.pagehelper.PageInfo;
import com.pojo.Listen;
import com.pojo.Supervisor;
import com.service.ListenService;
import com.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
public class ListenController {

    @Resource
    private ListenService listenService;

    /**
     * 后台功能
     */
    @GetMapping("/listenList")
    public String listenList(Listen listen, Model model) {
        model.addAttribute("info", listen);
        return "listen/listenList";
    }

    @RequestMapping("/queryListenList")
    @ResponseBody
    public DataInfo queryListenList(Listen listen
            , @RequestParam(defaultValue = "1") Integer page
            , @RequestParam(defaultValue = "15") Integer limit) {
        PageInfo<Listen> pageInfo = listenService.queryListenAll(listen, page, limit);
        return DataInfo.ok("成功", pageInfo.getTotal(), pageInfo.getList());
    }

    @GetMapping("/listenAdd")
    public String listenAdd() {
        return "listen/listenAdd";
    }

    @RequestMapping("/addListen")
    @ResponseBody
    public DataInfo addListen(String supNum, String courseNum) {
        String[] supNumList = supNum.split(",");
        String[] courseList = courseNum.split(",");
        List<String> sList = Arrays.asList(supNum.split(","));
        List<String> cList = Arrays.asList(courseNum.split(","));
        List<Listen> listenList = listenService.queryListenAllWithSame(sList, cList);

        System.out.println(listenList.size());
        if (listenList.size() == 0) {
            if (supNumList.length == 1 && courseList.length > 0) {
                for (String course : courseList) {
                    Listen listen = new Listen();
                    listen.setSupNum(Integer.valueOf(supNum));
                    listen.setCourseNum(Integer.valueOf(course));
                    listen.setVerifyState("0");
                    listen.setListenState("0");
                    listenService.addListen(listen);
                }
            } else if (courseList.length == 1 && supNumList.length > 0) {
                for (String supervisor : supNumList) {
                    Listen listen = new Listen();
                    listen.setSupNum(Integer.valueOf(supervisor));
                    listen.setCourseNum(Integer.valueOf(courseNum));
                    listen.setVerifyState("0");
                    listen.setListenState("0");
                    listenService.addListen(listen);
                }
            } else {
                return DataInfo.fail("请勿同时选择多个督导和多个课程");
            }
        } else {
            return DataInfo.fail("有已报名课程");
        }
        return DataInfo.ok();
    }

    @GetMapping("/queryListenByListenNum")
    public String queryListenByListenNum(Integer listenNum, Model model) {
        Listen listen = listenService.queryListenByListenNum(listenNum);
        model.addAttribute("info", listen);
        return "listen/listenUpdate";
    }

    @RequestMapping("/updateListen")
    @ResponseBody
    public DataInfo updateListen(@RequestBody Listen listen) {
        listenService.updateListen(listen);
        return DataInfo.ok();
    }

    @RequestMapping("/deleteListenByListenNum")
    @ResponseBody
    public DataInfo deleteListenByListenNum(String listenNum) {
        List<String> list = Arrays.asList(listenNum.split(","));
        listenService.deleteListenByListenNum(list);
        return DataInfo.ok();
    }

    @RequestMapping("/deleteListenBySupNumAndCourseNum")
    @ResponseBody
    public DataInfo deleteListenBySupNumAndCourseNum(String supNum, String courseNum) {
        String[] supNumList = supNum.split(",");
        String[] courseList = courseNum.split(",");
        List<String> sList = Arrays.asList(supNum.split(","));
        List<String> cList = Arrays.asList(courseNum.split(","));
        List<Listen> listenList = listenService.queryListenAllWithSame(sList, cList);

        if (listenList.size() != 0) {
            if (!Objects.equals(listenList.get(0).getVerifyState(), "1")) {
                if (supNumList.length == 1 && courseList.length > 0) {
                    listenService.deleteListenBySupNumAndCourseNum(Integer.valueOf(supNum), cList);
                } else {
                    return DataInfo.fail("课程取消报名失败，请联系督导秘书");
                }
            } else {
                return DataInfo.fail("该课程已通过审核");
            }
        } else {
            return DataInfo.fail("未报名课程");
        }
        return DataInfo.ok();
    }

    @RequestMapping("/updateSuccess")
    @ResponseBody
    public DataInfo updateSuccess(Integer listenNum) {
        listenService.updateSuccess(listenNum);
        return DataInfo.ok();
    }

    @RequestMapping("/updateFail")
    @ResponseBody
    public DataInfo updateFail(Integer listenNum) {
        listenService.updateFail(listenNum);
        return DataInfo.ok();
    }

    /**
     * 前台功能
     */
    @GetMapping("/listenView")
    public String listenView() {
        return "listen/listenView";
    }

    @RequestMapping("/updateDone")
    @ResponseBody
    public DataInfo updateDone(String listenNum) {
        List<String> list = Arrays.asList(listenNum.split(","));
        listenService.updateDone(list);
        return DataInfo.ok();
    }

    @RequestMapping("/updateUndone")
    @ResponseBody
    public DataInfo updateUndone(Integer listenNum) {
        listenService.updateUndone(listenNum);
        return DataInfo.ok();
    }

    @GetMapping("/queryListenByListenNumView")
    public String queryListenByListenNumView(Integer listenNum, Model model) {
        Listen listen = listenService.queryListenByListenNum(listenNum);
        model.addAttribute("info", listen);
        return "listen/listenUpdateView";
    }

    @RequestMapping("/updateListenView")
    @ResponseBody
    public DataInfo updateListenView(@RequestBody Listen listen) {
        listenService.updateListenView(listen);
        return DataInfo.ok();
    }

    @GetMapping("/listenEvaluation")
    public String listenEvaluation() {
        return "listen/listenEvaluation";
    }

    @GetMapping("/downloadByListenNumWithListenList")
    public void downloadByListenNumWithListenList(Integer[] listenNum,
                                                HttpServletResponse response) throws IOException {
        List<Listen> listenList;
        if (listenNum.length > 0) {
            //查询要写入的集合对象
            listenList = listenService.queryListenByListenNums(listenNum);
        } else {
            listenList = listenService.queryListen();
        }
        System.out.println(listenList);
        //写入Excel
        System.out.println("系统时间: " + System.currentTimeMillis());
        //获取当前时间
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        //以下载的方式写入Excel
        String fileName = URLEncoder.encode("已选课程", "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-disposition",
                "attachment;filename*=utf-8''" + fileName + "-" + time + ".xlsx");
        //注意写入的对象是：outputStream
        EasyExcel.write(response.getOutputStream(), Listen.class).sheet("听课列表").doWrite(listenList);
    }

    @GetMapping("/downloadByListenNumWithListenView")
    public void downloadByListenNumWithListView(Integer[] listenNum,
                                    HttpServletResponse response,
                                    HttpServletRequest request) throws IOException {
        List<Listen> listenList;
        HttpSession session = request.getSession();
        Supervisor supervisor = (Supervisor) session.getAttribute("supervisor");
        if (listenNum.length > 0) {
            //查询要写入的集合对象
            listenList = listenService.queryListenByListenNums(listenNum);
        } else {
            listenList = listenService.queryListenBySupNumWithListenView(supervisor.getSupNum());
        }
        System.out.println(listenList);
        //写入Excel
        System.out.println("系统时间: " + System.currentTimeMillis());
        //获取当前时间
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        //以下载的方式写入Excel
        String fileName = URLEncoder.encode("已选课程", "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-disposition",
                "attachment;filename*=utf-8''" + fileName + "-" + time + ".xlsx");
        //注意写入的对象是：outputStream
        EasyExcel.write(response.getOutputStream(), Listen.class).sheet("听课列表").doWrite(listenList);
    }

    @GetMapping("/downloadByListenNumWithListenEvaluation")
    public void downloadByListenNumWithListenEvaluation(Integer[] listenNum,
                                    HttpServletResponse response,
                                    HttpServletRequest request) throws IOException {
        List<Listen> listenList;
        HttpSession session = request.getSession();
        Supervisor supervisor = (Supervisor) session.getAttribute("supervisor");
        if (listenNum.length > 0) {
            //查询要写入的集合对象
            listenList = listenService.queryListenByListenNums(listenNum);
        } else {
            listenList = listenService.queryListenBySupNumWithListenEvaluation(supervisor.getSupNum());
        }
        System.out.println(listenList);
        //写入Excel
        System.out.println("系统时间: " + System.currentTimeMillis());
        //获取当前时间
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        //以下载的方式写入Excel
        String fileName = URLEncoder.encode("已选课程", "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-disposition",
                "attachment;filename*=utf-8''" + fileName + "-" + time + ".xlsx");
        //注意写入的对象是：outputStream
        EasyExcel.write(response.getOutputStream(), Listen.class).sheet("听课列表").doWrite(listenList);
    }
}
