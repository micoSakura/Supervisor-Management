package com.service;

import com.github.pagehelper.PageInfo;
import com.pojo.Record;

import java.util.List;

public interface RecordService {

    PageInfo<Record> queryRecordAll(Record record, Integer page, Integer limit);

    void addRecord(Record record);

    Record queryRecordByRecordNum(Integer recordNum);

    void updateRecord(Record record);

    void deleteRecordByRecordNum(List<String> recordNums);

    List<Record> queryRecordAllWithSame(Integer supNum, List<String> listenNums);

    List<Record> queryRecordByRecordNums(Integer[] recordNum);

    List<Record> queryRecordBySupNum(Integer supNum);

    List<Record> queryRecord();
}
