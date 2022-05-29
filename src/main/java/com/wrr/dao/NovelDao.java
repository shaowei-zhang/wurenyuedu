package com.wrr.dao;

import com.wrr.entity.Book;
import com.wrr.entity.Novel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 小说novel dao层映射接口
 */
@Repository
public interface NovelDao {
    public List<Novel> showAllNovels();
    public List<Novel> showSexOfNovels(@Param("typeOfSex") String typeOfSex);
    public List<Novel> showStoryOfNovels(@Param("novelClass") String novelClass);

    public int deleteOneNovel(Novel novel); //根据novelId删除
    public int insertOneNovel(Novel novel);
    public int updateOneNovel(@Param("oldNovelName") String oldNovelName,
                              @Param("updateNovelName") String updateNovelName,
                              @Param("updateNovelAuthor") String updateNovelAuthor,
                              @Param("updateNovelSynopsis") String updateNovelSynopsis,
                              @Param("updateNovelCover") String updateNovelCover,
                              @Param("updateNovelClassOfStory") String updateNovelClassOfStory,
                              @Param("updateNovelClassOfSex") String updateNovelClassOfSex);//根据novelName找到Novel进行修改
    //    根据小说的解读次数来选出排行榜前十名
    public List<Novel> novelReadingVolume();
    //更新小说的点击量，每次被加入书架都会增加一次点击量
    public boolean updateVolume(@Param("novelName") String novelName);
    //根据书名进行模糊查询
    public Novel selectOneNovel(@Param("novelName")String novelName);//根据姓名查询(novelName是惟一的)
    public List<Book> selectNovel();
}
