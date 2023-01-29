package com.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.github.pagehelper.PageInfo;
import com.listener.CourseListener;
import com.mapper.CourseMapper;
import com.pojo.Course;
import com.service.CourseService;
import com.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private CourseMapper courseMapper;

    @GetMapping("/courseList")
    public String courseList() {
        return "course/courseList";
    }

    @RequestMapping("/queryCourseList")
    @ResponseBody
    public DataInfo queryCourseList(Course course
            , @RequestParam(defaultValue = "1") Integer page
            , @RequestParam(defaultValue = "15") Integer limit) {
        PageInfo<Course> pageInfo = courseService.queryCourseAll(course, page, limit);
        return DataInfo.ok("成功", pageInfo.getTotal(), pageInfo.getList());
    }

    @GetMapping("/courseAdd")
    public String courseAdd() {
        return "course/courseAdd";
    }

    @RequestMapping("/addCourse")
    @ResponseBody
    public DataInfo addCourse(Course course) {
        courseService.addCourse(course);
        return DataInfo.ok();
    }

    @GetMapping("/queryCourseByCourseNum")
    public String queryCourseByCourseNum(Integer courseNum, Model model) {
        Course course = courseService.queryCourseByCourseNum(courseNum);
        model.addAttribute("info", course);
        return "course/courseUpdate";
    }

    @RequestMapping("/updateCourse")
    @ResponseBody
    public DataInfo updateCourse(@RequestBody Course course) {
        courseService.updateCourse(course);
        return DataInfo.ok();
    }

    @RequestMapping("/deleteCourseByCourseNum")
    @ResponseBody
    public DataInfo deleteCourseByCourseNum(String courseNum) {
        List<String> list = Arrays.asList(courseNum.split(","));
        courseService.deleteCourseByCourseNum(list);
        return DataInfo.ok();
    }

    /**
     * 前台
     */
    @GetMapping("/courseView")
    public String courseView() {
        return "course/courseView";
    }

    /**
     * 前台
     */
    @PostMapping("upload")
    @ResponseBody
    public String upload(MultipartFile file) throws IOException {
        EasyExcel.read(file.getInputStream(), Course.class, new CourseListener(courseMapper)).sheet().doRead();
        return "success";
    }

    @GetMapping("download")
    public void download(Integer[] courseNum, HttpServletResponse response) throws IOException {
        if (courseNum.length > 0) {
            //查询要写入的集合对象
            List<Course> courseList = courseService.queryCourseByCourseNum(courseNum);
            System.out.println(courseList);
            //写入Excel
            System.out.println("系统时间：" + System.currentTimeMillis());
            //获取当前时间
            String time = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            //以下载的方式写入Excel
            String fileName = "course-" + time + ".xlsx";
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            //通过流写入
            ServletOutputStream outputStream = response.getOutputStream();
            //注意写入的对象是：outputStream
            EasyExcel.write(outputStream, Course.class).sheet("课程列表").doWrite(courseList);
        }
    }
}
