package com.pojo;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.alibaba.excel.annotation.write.style.*;
import com.alibaba.excel.enums.poi.HorizontalAlignmentEnum;
import com.alibaba.excel.enums.poi.VerticalAlignmentEnum;
import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@ColumnWidth(20)
@ContentFontStyle(fontName = "等线", fontHeightInPoints = 14)
@ContentRowHeight(50)
@ContentStyle(horizontalAlignment = HorizontalAlignmentEnum.CENTER, verticalAlignment = VerticalAlignmentEnum.CENTER)
@HeadStyle(horizontalAlignment = HorizontalAlignmentEnum.CENTER, verticalAlignment = VerticalAlignmentEnum.CENTER)
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
    @JSONField(format="HH:mm:ss")
    private Date courseTime;

    @ExcelProperty("上课地点")
    private String courseAddress;

    @ExcelIgnore
    private String msg;
}
