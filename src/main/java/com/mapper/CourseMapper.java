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

    List<Course> queryCourseInfoAll(Course course);

    List<Course> queryCourseByCourseNum(Integer[] courseNum);

    void save(List<Course> courseList);
}