package com.controller;

import com.github.pagehelper.PageInfo;
import com.pojo.Listen;
import com.service.ListenService;
import com.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@Controller
public class ListenController {

    @Autowired
    private ListenService listenService;

    /*
    后台
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
                    listen.setVerifyState("2");
                    listen.setListenState("1");
                    listenService.addListen(listen);
                }
            } else if (courseList.length == 1 && supNumList.length > 0) {
                for (String supervisor : supNumList) {
                    Listen listen = new Listen();
                    listen.setSupNum(Integer.valueOf(supervisor));
                    listen.setCourseNum(Integer.valueOf(courseNum));
                    listen.setVerifyState("2");
                    listen.setListenState("1");
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
            if (supNumList.length == 1 && courseList.length > 0) {
                listenService.deleteListenBySupNumAndCourseNum(Integer.valueOf(supNum), cList);
            } else {
                return DataInfo.fail("课程取消报名失败，请联系督导秘书");
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

    /*
    前台
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
}
