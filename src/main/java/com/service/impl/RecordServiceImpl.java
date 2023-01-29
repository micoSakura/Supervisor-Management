package com.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.RecordMapper;
import com.pojo.Listen;
import com.pojo.Record;
import com.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RecordServiceImpl implements RecordService {

    @Autowired
    private RecordMapper recordMapper;

    @Override
    public PageInfo<Record> queryRecordAll(Record record, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Record> recordList = recordMapper.queryRecordInfoAll(record);
        return new PageInfo<>(recordList);
    }

    @Override
    public void addRecord(Record record) {
        recordMapper.insert(record);
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
}
