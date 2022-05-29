package com.wrr.dao;

import com.wrr.entity.Cartoonshelf;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartoonshelfDao {
    public List<Cartoonshelf> showCartoon();
    public Cartoonshelf selectOneCartoon(String cartoonName);//根据书名查询(bookName是惟一的)
    public boolean deleteOneCartoon(int cartoonId); //根据bookId删除
    //    批量删除
    public boolean deleteSomeCartoons(@Param("cartoonId") int cartoonId);
    public boolean insertOneCartoon(Cartoonshelf cartoon);
    public boolean updateOneCartoon(Cartoonshelf cartoon, String cartoonName);//根据bookName找到Book进行修改

    //根据读者的姓名进行查询他所有的书籍
    public List<Cartoonshelf> SelectCartoonByName(@Param("readName") String readName);

    public Cartoonshelf selectOneCartoonByReadName(@Param("cartoonName") String cartoonName,@Param("readName") String readName);//根据书名查询(bookName是惟一的)



}
