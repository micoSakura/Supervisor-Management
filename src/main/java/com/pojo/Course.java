package com.pojo;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Course implements Serializable {
    @ExcelIgnore
    private Integer courseNum;

    @ExcelProperty("课程名称")
    private String courseName;

    @ExcelProperty("教师姓名")
    private String teacherName;

    @ExcelProperty("起始周")
    private Integer startWeek;

    @ExcelProperty("结束周")
    private Integer endWeek;

    @ExcelProperty("上课星期")
    private String courseWeek;

    @ExcelProperty("上课时间")
    @DateTimeFormat("HH:mm:ss")
    private Date courseTime;

    @ExcelProperty("上课地点")
    private String courseAddress;
}