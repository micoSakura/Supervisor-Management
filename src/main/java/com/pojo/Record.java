package com.pojo;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.alibaba.excel.annotation.write.style.*;
import com.alibaba.excel.enums.poi.HorizontalAlignmentEnum;
import com.alibaba.excel.enums.poi.VerticalAlignmentEnum;
import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@ColumnWidth(20)
@ContentFontStyle(fontName = "等线", fontHeightInPoints = 14)
@ContentRowHeight(90)
@ContentStyle(horizontalAlignment = HorizontalAlignmentEnum.CENTER, verticalAlignment = VerticalAlignmentEnum.CENTER)
@HeadStyle(horizontalAlignment = HorizontalAlignmentEnum.CENTER, verticalAlignment = VerticalAlignmentEnum.CENTER)
public class Record implements Serializable {
    @ExcelIgnore
    private Integer recordNum;
    @ExcelIgnore
    private Integer listenNum;

    // 外部属性
    @ExcelIgnore
    private List<Listen> listenList;
    @ExcelIgnore
    private List<Course> courseList;
    @ExcelIgnore
    private List<Supervisor> supervisorList;

    // 需要查询的外部属性
    @ExcelIgnore
    private Integer courseNum;
    @ExcelProperty("课程名称")
    private String courseName;
    @ExcelProperty("教师姓名")
    private String teacherName;
    @ExcelIgnore
    private Integer supNum;
    @ExcelProperty("报名督导")
    private String supName;
    @ExcelProperty("督导电话")
    private String phone;
    @ExcelProperty("上课时间")
    @DateTimeFormat("HH:mm:ss")
    @JSONField(format="HH:mm:ss")
    private Date courseTime;
    @ExcelProperty("上课地点")
    private String courseAddress;
    @ExcelProperty("审核状态")
    private String verifyState;
    @ExcelProperty("听课状态")
    private String listenState;

    // 内部属性
    @ExcelProperty("选课人数")
    private Integer selection;
    @ExcelProperty("出勤人数")
    private Integer attendance;
    @ExcelProperty("督导评分")
    private Float evaluation;
    @ExcelProperty("授课内容")
    private String courseContent;
    @ExcelProperty("督导意见")
    private String suggestion;
}
