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

    /**
     * 查询听课信息
     *
     * @param listen
     * @return listen
     */
    List<Listen> queryListenInfoAll(Listen listen);

    /**
     * 通过督导编号和课程编号查询听课信息
     *
     * @param supNum
     * @param courseNum
     * @return supNum, courseNum
     */
    List<Listen> queryListenAllWithSame(@Param("supNum") Integer supNum, @Param("courseNum") Integer courseNum);

    /**
     * 通过督导编号和课程编号删除听课信息
     *
     * @param supNum
     * @param courseNum
     */
    void deleteListenBySupNumAndCourseNum(@Param("supNum") Integer supNum, @Param("courseNum") Integer courseNum);

    /**
     * 通过审核
     *
     * @param listenNum
     */
    void updateSuccess(Integer listenNum);

    /**
     * 不通过审核
     *
     * @param listenNum
     */
    void updateFail(Integer listenNum);

    /**
     * 已完成听课
     *
     * @param listenNum
     */
    void updateDone(Integer listenNum);

    /**
     * 未完成听课
     *
     * @param listenNum
     */
    void updateUndone(Integer listenNum);

    /**
     * 听课信息更新
     *
     * @param listen
     */
    void updateListenView(Listen listen);

    /**
     * 已完成评教
     *
     * @param listenNum
     */
    void updateListenState(Integer listenNum);

    /**
     * 选课导出功能
     *
     * @param listenNum
     * @return
     */
    List<Listen> queryListenByListenNums(Integer[] listenNum);

    /**
     * 报名审核导出功能
     *
     */
    List<Listen> queryListen();

    /**
     * 已选课程导出功能
     * @param supNum
     */
    List<Listen> queryListenBySupNumWithListenView(@Param("supNum") Integer supNum);

    /**
     * 已听课程导出功能
     * @param supNum
     */
    List<Listen> queryListenBySupNumWithListenEvaluation(@Param("supNum") Integer supNum);

    /**
     * 查询听课表数据
     *
     * @param listenNum
     * @return
     */
    List<Listen> queryListenNumByOne(Integer listenNum);
}
