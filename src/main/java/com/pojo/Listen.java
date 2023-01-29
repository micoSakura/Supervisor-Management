package com.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Listen implements Serializable {
    private Integer listenNum;
    private Integer courseNum;
    private Integer supNum;
    private String verifyState;
    private String listenState;

    // 外部属性
    private List<Course> courseList;
    private List<Supervisor> supervisorList;

    // 需要查询的外部属性
    private String supName;
    private String phone;
    private String courseName;
    private String teacherName;
}