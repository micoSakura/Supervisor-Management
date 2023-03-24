package com.pojo;

import com.alibaba.excel.annotation.ExcelIgnore;
import lombok.Data;

import java.io.Serializable;

@Data
public class Supervisor implements Serializable {
    @ExcelIgnore
    private Integer supNum;
    private String supName;
    private String loginName;
    private String password;
    private String sex;
    private String title;
    private String phone;
}
