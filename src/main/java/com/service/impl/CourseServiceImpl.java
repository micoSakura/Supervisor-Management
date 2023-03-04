package com.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.CourseMapper;
import com.pojo.Course;
import com.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public PageInfo<Course> queryCourseAll(Course course, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<Course> courseList = courseMapper.queryCourseInfoAll(course);
        return new PageInfo<>(courseList);
    }

    @Override
    public void addCourse(Course course) {
        courseMapper.insert(course);
    }

    @Override
    public Course queryCourseByCourseNum(Integer courseNum) {
        return courseMapper.selectByPrimaryKey(courseNum);
    }

    @Override
    public void updateCourse(Course course) {
        courseMapper.updateByPrimaryKey(course);
    }

    @Override
    public void deleteCourseByCourseNum(List<String> courseNums) {
        for (String courseNum : courseNums) {
            courseMapper.deleteByPrimaryKey(Integer.parseInt(courseNum));
        }
    }

    @Override
    public List<Course> queryCourseByCourseNum(Integer[] courseNum) {
        return courseMapper.queryCourseByCourseNum(courseNum);
    }

    @Override
    public void save(List<Course> courseList) {
        courseMapper.save(courseList);
    }
}
