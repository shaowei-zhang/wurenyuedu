package com.wrr.dao;

import com.wrr.entity.Novel;
import com.wrr.entity.Novelshelf;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NovelshelfDao {
    public List<Novelshelf> showNovels();
    public Novelshelf selectOneBook(String bookName);//根据书名查询(bookName是惟一的)
    public Novel selectOneNovel(String novelName);//根据姓名查询(novelName是惟一的)


    public boolean deleteOneBook(int bookId); //根据bookId删除
//    批量删除
    public boolean deleteSomeBooks(@Param("bookId") int bookId);
    public boolean insertOneBook(Novelshelf book);
    public boolean updateOneBook(Novelshelf book, String bookName);//根据bookName找到Book进行修改

    //根据读者的姓名进行查询他所有的书籍
    public List<Novelshelf> SelectBookByName(@Param("readName") String readName);

    public Novelshelf selectOneBookByReadName(@Param("bookName") String bookName,@Param("readName") String readName);//根据书名查询(bookName是惟一的)

}
