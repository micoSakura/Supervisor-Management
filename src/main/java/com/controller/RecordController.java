package com.controller;

import com.github.pagehelper.PageInfo;
import com.mapper.ListenMapper;
import com.pojo.Listen;
import com.pojo.Record;
import com.service.RecordService;
import com.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@Controller
public class RecordController {

    @Autowired
    private RecordService recordService;

    @Autowired
    private ListenMapper listenMapper;

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

    /*
    前台
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
        Listen listen = listenMapper.selectByPrimaryKey(listenNum);
        model.addAttribute("info", listen);
        return "record/recordAddView";
    }
}
