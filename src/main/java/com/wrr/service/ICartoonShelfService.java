package com.wrr.service;


import com.wrr.entity.Cartoonshelf;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICartoonShelfService {
   public List<Cartoonshelf> showCartoon(String cartoonType);
    public Cartoonshelf selectOneCartoon(String cartoonName);//根据书名查询(bookName是惟一的)
    public boolean deleteOneCartoon(int cartoonId); //根据bookId删除
    public boolean deleteSomeCartoons(int cartoonId);
    public boolean insertOneCartoon(Cartoonshelf cartoon);
    public boolean updateOneCartoon(Cartoonshelf cartoon, String cartoonName);//根据bookName找到Book进行修改
    //根据读者的姓名进行查询他所有的书籍
    public List<Cartoonshelf> SelectCartoonByName(@Param("readName") String readName);
 public Cartoonshelf selectOneCartoonByReadName(String cartoonName,String readName);//根据书名查询(bookName是惟一的)

}
