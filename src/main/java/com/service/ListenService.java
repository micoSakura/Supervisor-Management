package com.service;

import com.github.pagehelper.PageInfo;
import com.pojo.Listen;

import java.util.List;

public interface ListenService {

    PageInfo<Listen> queryListenAll(Listen listen, Integer page, Integer limit);

    List<Listen> queryListenAllWithSame(List<String> supNum, List<String> courseNum);

    void addListen(Listen listen);

    Listen queryListenByListenNum(Integer listenNum);

    void updateListen(Listen listen);

    void updateListenView(Listen listen);

    void deleteListenByListenNum(List<String> listenNums);

    void deleteListenBySupNumAndCourseNum(Integer supNum, List<String> courseNums);

    void updateSuccess(Integer listenNum);

    void updateFail(Integer listenNum);

    void updateDone(List<String> listenNum);

    void updateUndone(Integer listenNum);

    List<Listen> queryListenByListenNums(Integer[] listenNum);
}
