package com.controller;

import com.alibaba.excel.EasyExcel;
import com.github.pagehelper.PageInfo;
import com.pojo.Listen;
import com.pojo.Record;
import com.pojo.Supervisor;
import com.service.ListenService;
import com.service.RecordService;
import com.utils.DataInfo;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
public class RecordController {

    @Resource
    private RecordService recordService;

    @Resource
    private ListenService listenService;

    /**
     * 后台功能
     */
    @GetMapping("/recordList")
    public String recordList() {
        return "record/recordList";
    }

    @RequestMapping("/queryRecordList")
    @ResponseBody
    public DataInfo queryRecordList(Record record
            , @RequestParam(defaultValue = "1") Integer page
            , @RequestParam(defaultValue = "15") Integer limit) {
        PageInfo<Record> pageInfo = recordService.queryRecordAll(record, page, limit);
        return DataInfo.ok("成功", pageInfo.getTotal(), pageInfo.getList());
    }

    @GetMapping("/recordAdd")
    public String recordAdd() {
        return "record/recordAdd";
    }

    @RequestMapping("/addRecord")
    @ResponseBody
    public DataInfo addRecord(Record record) {
        recordService.addRecord(record);
        return DataInfo.ok();
    }

    @GetMapping("/queryRecordByRecordNum")
    public String queryRecordByRecordNum(Integer recordNum, Model model) {
        Record record = recordService.queryRecordByRecordNum(recordNum);
        model.addAttribute("info", record);
        return "record/recordUpdate";
    }

    @RequestMapping("/updateRecord")
    @ResponseBody
    public DataInfo updateRecord(@RequestBody Record record) {
        recordService.updateRecord(record);
        return DataInfo.ok();
    }

    @RequestMapping("/deleteRecordByRecordNum")
    @ResponseBody
    public DataInfo deleteRecordByRecordNum(String recordNum) {
        List<String> list = Arrays.asList(recordNum.split(","));
        recordService.deleteRecordByRecordNum(list);
        return DataInfo.ok();
    }

    /**
     * 前台功能
     */
    @GetMapping("recordView")
    public String recordView() {
        return "record/recordView";
    }

    @RequestMapping("/queryRecordAllWithSame")
    @ResponseBody
    public DataInfo queryRecordAllWithSame(String supNum, String listenNum) {
        List<String> cList = Arrays.asList(listenNum.split(","));
        List<Record> recordList = recordService.queryRecordAllWithSame(Integer.valueOf(supNum), cList);
        if (recordList.size() >= 1) {
            return DataInfo.fail("你已评教此课程");
        } else {
            return DataInfo.ok();
        }
    }

    @GetMapping("/recordAddView")
    public String recordAddView(Integer listenNum, Model model) {
        Listen listen = listenService.queryListenByListenNum(listenNum);
        model.addAttribute("info", listen);
        return "record/recordAddView";
    }

    @GetMapping("/downloadByRecordView")
    public void downloadByRecordView(Integer[] recordNum,
                                     HttpServletResponse response,
                                     HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        Supervisor supervisor = (Supervisor) session.getAttribute("supervisor");
        List<Record> recordList;
        if (recordNum.length > 0) {
            recordList = recordService.queryRecordByRecordNums(recordNum);
        } else {
            recordList = recordService.queryRecordBySupNum(supervisor.getSupNum());
        }
        // 查询要写入的集合对象
        // 写入Excel
        System.out.println("系统时间: " + System.currentTimeMillis());
        // 获取当前时间
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        // 以下载的方式写入Excel
        String fileName = URLEncoder.encode("评教记录", "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-disposition",
                "attachment;filename*=utf-8''" + fileName + "-" + time + ".xlsx");
        // 注意写入的对象是：outputStream
        EasyExcel.write(response.getOutputStream(), Record.class).sheet("评教列表").doWrite(recordList);
    }

    @GetMapping("/downloadByRecordList")
    public void downloadByRecordList(Integer[] recordNum, HttpServletResponse response) throws IOException {
        List<Record> recordList;
        if (recordNum.length > 0) {
            // 查询要写入的集合对象
            recordList = recordService.queryRecordByRecordNums(recordNum);
        } else {
            recordList = recordService.queryRecord();
        }
        System.out.println(recordList);
        // 写入Excel
        System.out.println("系统时间: " + System.currentTimeMillis());
        // 获取当前时间
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        // 以下载的方式写入Excel
        String fileName = URLEncoder.encode("评教记录", "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-disposition",
                "attachment;filename*=utf-8''" + fileName + "-" + time + ".xlsx");
        // 注意写入的对象是：outputStream
        EasyExcel.write(response.getOutputStream(), Record.class).sheet("评教列表").doWrite(recordList);
    }
}
