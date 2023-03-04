package com.service;

import com.github.pagehelper.PageInfo;
import com.pojo.Course;

import java.util.List;

public interface CourseService {

    PageInfo<Course> queryCourseAll(Course course, Integer page, Integer limit);

    void addCourse(Course course);

    Course queryCourseByCourseNum(Integer courseNum);

    void updateCourse(Course course);

    void deleteCourseByCourseNum(List<String> courseNums);

    List<Course> queryCourseByCourseNum(Integer[] courseNum);

    void save(List<Course> courseList);
}
