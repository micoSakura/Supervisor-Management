package com.mapper;

import com.pojo.Listen;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ListenMapper {
    int deleteByPrimaryKey(Integer listenNum);

    int insert(Listen listen);

    int insertSelective(Listen listen);

    Listen selectByPrimaryKey(Integer listenNum);

    int updateByPrimaryKeySelective(Listen listen);

    int updateByPrimaryKey(Listen listen);

    void updateListenView(Listen listen);

    List<Listen> queryListenInfoAll(Listen listen);

    List<Listen> queryListenAllWithSame(@Param("supNum") Integer supNum, @Param("courseNum") Integer courseNum);

    void deleteListenBySupNumAndCourseNum(@Param("supNum") Integer supNum, @Param("courseNum") Integer courseNum);



    void updateSuccess(Integer listenNum);

    void updateFail(Integer listenNum);

    void updateDone(Integer listenNum);

    void updateUndone(Integer listenNum);
}