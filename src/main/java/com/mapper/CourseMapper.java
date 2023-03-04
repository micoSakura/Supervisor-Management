package com.mapper;

import com.pojo.Course;

import java.util.List;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer courseNum);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer courseNum);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

    /**
     * 查询课程全部信息
     *
     * @param course
     * @return course
     */
    List<Course> queryCourseInfoAll(Course course);

    /**
     * 通过课程编号查询
     *
     * @param courseNum
     * @return courseNum
     */
    List<Course> queryCourseByCourseNum(Integer[] courseNum);

    /**
     * 保存课程导入集合到数据库中的方法
     *
     * @param courseList
     */
    void save(List<Course> courseList);
}
