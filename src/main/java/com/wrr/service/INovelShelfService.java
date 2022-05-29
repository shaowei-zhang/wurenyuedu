package com.wrr.service;


import com.wrr.entity.Novelshelf;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface INovelShelfService {

    public List<Novelshelf> showBooks(String bookType);
    public Novelshelf selectOneBook(String bookName);//根据姓名查询(bookName是惟一的)
    public boolean deleteOneBook(int bookId); //根据bookId删除
    //    批量删除
    public boolean deleteSomeBooks(int bookId);
    public boolean insertOneBook(Novelshelf book);
    public List<Novelshelf> SelectBookByName(String readName);
    public boolean updateOneBook(Novelshelf book, String bookName);//根据bookName找到Book进行修改

    public Novelshelf selectOneBookByReadName(String bookName,String readName);//根据书名查询(bookName是惟一的)

}
