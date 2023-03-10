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

    /**
     * 查询教学记录信息
     *
     * @param record
     * @return record
     */
    List<Record> queryRecordInfoAll(Record record);

    /**
     * 通过听课编号和督导编号查询教学记录信息
     *
     * @param supNum
     * @param listenNum
     * @return supNum，listenNum
     */
    List<Record> queryRecordAllWithSame(@Param("supNum") Integer supNum, @Param("listenNum") Integer listenNum);

    /**
     * 评教记录导出功能
     *
     * @param recordNum
     * @return
     */
    List<Record> queryRecordByRecordNums(Integer[] recordNum);

    /**
     * 评教记录导出功能
     *
     * @param supNum
     * @return
     */
    List<Record> queryRecordBySupNum(@Param("supNum") Integer supNum);

    /**
     * 评教记录导出功能
     *
     */
    List<Record> queryRecord();
}
