package com.wrr.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 读者  实体类
 */
@Component
@Data
public class Reader {

    private int readerId;
    private String readerName;     //读者名
    private String readerPassword; //读者密码

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date registerDate;      //注册日期
    private int borrowNovel;        //借阅小说次数
    private int borrowCartoon;      //借阅漫画次数
    private int notYetNovel;        //未还小说本数
    private int notYetCartoon;      //未还漫画本数
    public Reader() {
    }

}
