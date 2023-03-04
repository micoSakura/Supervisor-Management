package com.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.CourseMapper;
import com.mapper.ListenMapper;
import com.mapper.RecordMapper;
import com.mapper.SupervisorMapper;
import com.pojo.Course;
import com.pojo.Listen;
import com.pojo.Record;
import com.pojo.Supervisor;
import com.service.RecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class RecordServiceImpl implements RecordService {

    @Resource
    private RecordMapper recordMapper;

    @Resource
    private ListenMapper listenMapper;

    @Resource
    private CourseMapper courseMapper;

    @Resource
    private SupervisorMapper supervisorMapper;

    @Override
    public PageInfo<Record> queryRecordAll(Record record, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Record> recordList = recordMapper.queryRecordInfoAll(record);
        return new PageInfo<>(recordList);
    }

    @Override
    public void addRecord(Record record) {
        recordMapper.insert(record);
        listenMapper.updateListenState(record.getListenNum());
    }

    @Override
    public Record queryRecordByRecordNum(Integer recordNum) {
        return recordMapper.selectByPrimaryKey(recordNum);
    }

    @Override
    public void updateRecord(Record record) {
        recordMapper.updateByPrimaryKey(record);
    }

    @Override
    public void deleteRecordByRecordNum(List<String> recordNums) {
        for (String recordNum : recordNums) {
            recordMapper.deleteByPrimaryKey(Integer.parseInt(recordNum));
        }
    }

    @Override
    public List<Record> queryRecordAllWithSame(Integer supNum, List<String> listenNums) {
        List<Record> recordList;
        List<Record> list = new ArrayList<>();
        for (String listenNum : listenNums) {
            recordList = recordMapper.queryRecordAllWithSame(supNum, Integer.parseInt(listenNum));
            list.addAll(recordList);
        }
        return list;
    }

    @Override
    public List<Record> queryRecordByRecordNums(Integer[] recordNum) {
        List<Record> recordList = recordMapper.queryRecordByRecordNums(recordNum);
        for (Record record : recordList) {
            List<Listen> listenList = listenMapper.queryListenNumByOne(record.getListenNum());
            for (Listen listen : listenList) {
                Course course = courseMapper.selectByPrimaryKey(listen.getCourseNum());
                Supervisor supervisor = supervisorMapper.selectByPrimaryKey(listen.getSupNum());
                record.setCourseName(course.getCourseName());
                record.setTeacherName(course.getTeacherName());
                record.setSupName(supervisor.getSupName());
                record.setPhone(supervisor.getPhone());
                record.setCourseTime(course.getCourseTime());
                record.setCourseAddress(course.getCourseAddress());
                if (Objects.equals(listen.getVerifyState(), "0")) {
                    record.setVerifyState("待审核");
                } else if (Objects.equals(listen.getVerifyState(), "1")) {
                    record.setVerifyState("通过");
                } else if (Objects.equals(listen.getVerifyState(), "2")) {
                    record.setVerifyState("未通过");
                }
                if (Objects.equals(listen.getListenState(), "0")) {
                    record.setListenState("待听课");
                } else if (Objects.equals(listen.getListenState(), "1")) {
                    record.setListenState("已听课");
                } else if (Objects.equals(listen.getListenState(), "2")) {
                    record.setListenState("未听课");
                } else if (Objects.equals(listen.getListenState(), "3")) {
                    record.setListenState("已评教");
                }
            }
        }
        return recordList;
    }
}
