package com.wrr.service;


import com.wrr.entity.Book;
import com.wrr.entity.Cartoon;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 漫画cartoon service接口
 */
public interface ICartoonService {
    public List<Cartoon> showAllCartoons();
    public List<Cartoon> showSexOfCartoons(String typeOfSex);
    public List<Cartoon> showStoryOfCartoons(String cartoonType);
    public List<Cartoon> selectCartoon();//根据姓名查询(cartoonName是惟一的)
    public boolean deleteOneCartoon(Cartoon cartoon); //根据cartoonId删除
    public boolean insertOneCartoon(Cartoon cartoon);
    public boolean updateOneCartoon(String oldCartoonName,
                                    String updateCartoonName,
                                    String updateCartoonAuthor,
                                    String updateCartoonSynopsis,
                                    String updateCartoonCover,
                                    String updateCartoonClassOfStory,
                                    String updateCartoonClassOfSex);//根据cartoonName找到Cartoon进行修改


    //根据漫画名进行模糊查询
    public Cartoon selectOneCartoon(String cartoonName);//根据姓名查询(cartoonName是惟一的)
    //    根据小说的解读次数来选出排行榜前十名
    public List<Cartoon> cartoonReadingVolume();
    //更新小说的点击量，每次被加入书架都会增加一次点击量
    public boolean updateVolume(@Param("cartoonName") String cartoonName);
    public List<Book> selectStoryOfCartoon();
}
