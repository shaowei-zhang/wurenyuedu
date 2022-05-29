package com.wrr.service;


import com.wrr.entity.Book;
import com.wrr.entity.Novel;
import com.wrr.entity.Novelshelf;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 小说novel service接口
 */
public interface INovelService {
    public List<Novel> showAllNovels();
    public List<Novel> showSexOfNovels(String typeOfSex);
    public List<Novel> showStoryOfNovels(String cartoonType);

    public boolean deleteOneNovel(Novel novel); //根据novelId删除
    public boolean insertOneNovel(Novel novel);
    public boolean updateOneNovel(String oldNovelName,
                                  String updateNovelName,
                                  String updateNovelAuthor,
                                  String updateNovelSynopsis,
                                  String updateNovelCover,
                                  String updateNovelClassOfStory,
                                  String updateNovelClassOfSex);//根据novelName找到Novel进行修改



    //    根据小说的解读次数来选出排行榜前十名
    public List<Novel> novelReadingVolume();
    //更新小说的点击量，每次被加入书架都会增加一次点击量
    public boolean updateVolume(String novelName);

    public Novel selectOneNovel(String novelName);//根据姓名查询(novelName是惟一的)
    public List<Book> selectNovel();

}
