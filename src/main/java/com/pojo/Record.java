package com.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Record implements Serializable {
    private Integer recordNum;
    private Integer listenNum;
    private Integer selection;
    private Integer attendance;
    private Float evaluation;
    private String suggestion;
    private String courseContent;

    // 外部属性
    private List<Listen> listenList;
    private List<Course> courseList;
    private List<Supervisor> supervisorList;

    // 需要查询的外部属性
    private Integer supNum;
    private String supName;
    private String phone;
    private Integer courseNum;
    private String courseName;
    private String teacherName;
}