package com.wrr.entity;

import lombok.Data;
import lombok.NonNull;
import org.springframework.stereotype.Component;

/**
 * 小说  实体类
 */
@Component
@Data
public class Novel {

    @NonNull
    private int novelId;
    @NonNull
    private String novelName;
    @NonNull
    private String novelAuthor;     //小说作者
    @NonNull
    private String novelSynopsis;   //小说简介
    @NonNull
    private String novelCover;      //小说封面

    private String novelClassOfSex;   //以男女分类
    private String novelClassOfContent; //以内容分类
    private String novelClassOfStory; //以故事情节分类

    @NonNull
    private int novelReadingVolume; //小说阅读量

    public Novel() {
    }
}
