package com.wrr.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class Book {
    private String classOfStory;
    private int volumeSum;

    public Book() {
    }
}
