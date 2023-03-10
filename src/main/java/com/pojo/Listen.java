package com.pojo;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.alibaba.excel.annotation.write.style.*;
import com.alibaba.excel.enums.poi.HorizontalAlignmentEnum;
import com.alibaba.excel.enums.poi.VerticalAlignmentEnum;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@ColumnWidth(20)
@ContentFontStyle(fontName = "等线", fontHeightInPoints = 14)
@ContentRowHeight(45)
@ContentStyle(horizontalAlignment = HorizontalAlignmentEnum.CENTER, verticalAlignment = VerticalAlignmentEnum.CENTER)
@HeadStyle(horizontalAlignment = HorizontalAlignmentEnum.CENTER, verticalAlignment = VerticalAlignmentEnum.CENTER)
public class Listen implements Serializable {
    @ExcelIgnore
    private Integer listenNum;
    @ExcelIgnore
    private Integer courseNum;
    @ExcelIgnore
    private Integer supNum;

    // 外部属性
    @ExcelIgnore
    private List<Course> courseList;
    @ExcelIgnore
    private List<Supervisor> supervisorList;

    // 需要查询的外部属性
    @ExcelProperty("课程名称")
    private String courseName;
    @ExcelProperty("教师姓名")
    private String teacherName;
    @ExcelProperty("报名督导")
    private String supName;
    @ExcelProperty("督导电话")
    private String phone;
    @ExcelProperty("上课时间")
    @DateTimeFormat("HH:mm:ss")
    private Date courseTime;
    @ExcelProperty("上课地点")
    private String courseAddress;

    // 内部属性
    @ExcelProperty("审核状态")
    private String verifyState;
    @ExcelProperty("听课状态")
    private String listenState;
}
