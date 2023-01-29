package com.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.ListenMapper;
import com.pojo.Listen;
import com.service.ListenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ListenServiceImpl implements ListenService {

    @Autowired
    private ListenMapper listenMapper;

    @Override
    public PageInfo<Listen> queryListenAll(Listen listen, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Listen> listenList = listenMapper.queryListenInfoAll(listen);
        return new PageInfo<>(listenList);
    }

    @Override
    public List<Listen> queryListenAllWithSame(List<String> supNums, List<String> courseNums) {
        List<Listen> listenList;
        List<Listen> list = new ArrayList<>();
        if (supNums.size() == 1 && courseNums.size() > 0) {
            for (String supNum : supNums) {
                for (String courseNum : courseNums) {
                    listenList = listenMapper.queryListenAllWithSame(Integer.parseInt(supNum), Integer.parseInt(courseNum));
                    list.addAll(listenList);
                }
            }
        }
        if (supNums.size() > 0 && courseNums.size() == 1) {
            for (String courseNum : courseNums) {
                for (String supNum : supNums) {
                    listenList = listenMapper.queryListenAllWithSame(Integer.parseInt(supNum), Integer.parseInt(courseNum));
                    list.addAll(listenList);
                }
            }
        }
        return list;
    }

    @Override
    public void addListen(Listen listen) {
        listenMapper.insert(listen);
    }

    @Override
    public Listen queryListenByListenNum(Integer listenNum) {
        return listenMapper.selectByPrimaryKey(listenNum);
    }

    @Override
    public void updateListen(Listen listen) {
        listenMapper.updateByPrimaryKey(listen);
    }

    @Override
    public void updateListenView(Listen listen) {
        listenMapper.updateListenView(listen);
    }

    @Override
    public void deleteListenByListenNum(List<String> listenNums) {
        for (String listenNum : listenNums) {
            listenMapper.deleteByPrimaryKey(Integer.parseInt(listenNum));
        }
    }

    @Override
    public void deleteListenBySupNumAndCourseNum(Integer supNum, List<String> courseNums) {
        for (String courseNum : courseNums) {
            listenMapper.deleteListenBySupNumAndCourseNum(supNum, Integer.parseInt(courseNum));
        }
    }

    @Override
    public void updateSuccess(Integer listenNum) {
        listenMapper.updateSuccess(listenNum);
    }

    @Override
    public void updateFail(Integer listenNum) {
        listenMapper.updateFail(listenNum);
    }

    @Override
    public void updateDone(List<String> listenNums) {
        for (String listenNum : listenNums) {
            listenMapper.updateDone(Integer.parseInt(listenNum));
        }
    }

    @Override
    public void updateUndone(Integer listenNum) {
        listenMapper.updateUndone(listenNum);
    }
}
