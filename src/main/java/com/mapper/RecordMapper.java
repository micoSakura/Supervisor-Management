package com.mapper;

import com.pojo.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecordMapper {
    int deleteByPrimaryKey(Integer recordNum);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(Integer recordNum);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);

    List<Record> queryRecordInfoAll(Record record);

    List<Record> queryRecordAllWithSame(@Param("supNum") Integer supNum, @Param("listenNum") Integer listenNum);
}