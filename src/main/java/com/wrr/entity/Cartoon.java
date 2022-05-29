package com.wrr.entity;

import lombok.Data;
import lombok.NonNull;
import org.springframework.stereotype.Component;

/**
 * 漫画  实体类
 */
@Component
@Data
public class Cartoon {

    @NonNull
    private int cartoonId;
    @NonNull
    private String cartoonName;
    @NonNull
    private String cartoonAuthor;     //漫画作者
    @NonNull
    private String cartoonSynopsis;   //漫画简介
    @NonNull
    private String cartoonCover;      //漫画封面

    private String cartoonClassOfSex;   //以男女分类
    private String cartoonClassOfContent; //以内容分类
    private String cartoonClassOfStory; //以故事情节分类

    @NonNull
    private int cartoonReadingVolume; //漫画阅读量

    public Cartoon() {
    }
}
