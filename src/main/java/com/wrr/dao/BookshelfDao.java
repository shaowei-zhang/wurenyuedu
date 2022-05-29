package com.wrr.dao;

import com.wrr.entity.Bookshelf;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 书架bookshelf dao层映射接口
 */
@Repository
public interface BookshelfDao {

    public List<Bookshelf> showCartoons();
    public List<Bookshelf> showNovels();
    public Bookshelf selectOneBook(String bookName);//根据姓名查询(bookName是惟一的)
    public int deleteOneBook(int bookId); //根据bookId删除
    public int insertOneBook(Bookshelf book);
    public int updateOneBook(Bookshelf book, String bookName);//根据bookName找到Book进行修改
}
