package com.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Admin implements Serializable {
    private Integer id;
    private String loginName;
    private String password;
    private String realName;
    private String sex;
    private String phone;
}