package com.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Supervisor implements Serializable {
    private Integer supNum;
    private String supName;
    private String loginName;
    private String password;
    private String sex;
    private String title;
    private String phone;
}