package com.wrr.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * 书架  实体类
 */
@Component
@Data
public class Bookshelf {

    private int bookId;
    private String bookName;   //书名
    private String bookType;   //书籍类型(小说或者漫画)
    private String bookCover;  //书籍封面
    private String bookAuthor; //书籍作者

    public Bookshelf() {
    }
}
