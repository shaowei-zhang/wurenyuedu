package com.wrr.dao;

import com.wrr.entity.Book;
import com.wrr.entity.Cartoon;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 漫画cartoon dao层映射接口
 */
@Repository
public interface CartoonDao {
    public List<Cartoon> showAllCartoons();
    public List<Cartoon> showSexOfCartoons(@Param("typeOfSex") String typeOfSex);
    public List<Cartoon> showStoryOfCartoons(@Param("cartoonClass") String cartoonClass);
    public int deleteOneCartoon(Cartoon cartoon); //根据cartoonId删除
    public int insertOneCartoon(Cartoon cartoon);
    public int updateOneCartoon(@Param("oldCartoonName") String oldCartoonName,
                                    @Param("updateCartoonName") String updateCartoonName,
                                    @Param("updateCartoonAuthor") String updateCartoonAuthor,
                                    @Param("updateCartoonSynopsis") String updateCartoonSynopsis,
                                    @Param("updateCartoonCover") String updateCartoonCover,
                                    @Param("updateCartoonClassOfStory") String updateCartoonClassOfStory,
                                    @Param("updateCartoonClassOfSex") String updateCartoonClassOfSex);//根据cartoonName找到Cartoon进行修改
    //    根据小说的解读次数来选出排行榜前十名
    public List<Cartoon> cartoonReadingVolume();
    //更新小说的点击量，每次被加入书架都会增加一次点击量
    public boolean updateVolume(@Param("cartoonName") String cartoonName);
    public Cartoon selectOneCartoon(@Param("cartoonName")String cartoonName);//根据姓名查询(cartoonName是惟一的)
    public List<Book> selectStoryOfCartoon();

}
