package com.wrr.service;

import com.wrr.entity.Bookshelf;

import java.util.List;

/**
 * 书架bookshelf service接口
 */
public interface IBookShelfService {

    public List<Bookshelf> showBooks(String bookType);
    public Bookshelf selectOneBook(String bookName);//根据姓名查询(bookName是惟一的)
    public boolean deleteOneBook(int bookId); //根据bookId删除
    public boolean insertOneBook(Bookshelf book);
    public boolean updateOneBook(Bookshelf book, String bookName);//根据bookName找到Book进行修改
}
