package com.wrr.service.imps;

import com.wrr.dao.NovelDao;
import com.wrr.entity.Book;
import com.wrr.entity.Cartoon;
import com.wrr.entity.Novel;
import com.wrr.entity.Novelshelf;
import com.wrr.service.INovelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NovelServiceImp implements INovelService {

    @Autowired
    private NovelDao novelDao;

    @Override
    public List<Novel> showAllNovels() {
        List<Novel> novels = novelDao.showAllNovels();
        return novels;
    }

    @Override
    public List<Novel> showSexOfNovels(String typeOfSex) {
        List<Novel> novels = novelDao.showSexOfNovels(typeOfSex);
        return novels;
    }

    @Override
    public List<Novel> showStoryOfNovels(String cartoonType) {
        List<Novel> novels = novelDao.showStoryOfNovels(cartoonType);
        return novels;
    }

    @Override
    public Novel selectOneNovel(String novelName) {
        return novelDao.selectOneNovel(novelName);
    }

    @Override
    public boolean deleteOneNovel(Novel novel) {
        int line = novelDao.deleteOneNovel(novel);
        boolean isOk = false;

        if(line > 0){
            isOk = true;
        }
        return isOk;
    }

    @Override
    public boolean insertOneNovel(Novel novel) {
       int line = novelDao.insertOneNovel(novel);
       boolean isOk = false;

       if (line > 0){
           isOk = true;
       }
        return isOk;
    }

    @Override
    public boolean updateOneNovel(String oldNovelName,
                                  String updateNovelName,
                                  String updateNovelAuthor,
                                  String updateNovelSynopsis,
                                  String updateNovelCover,
                                  String updateNovelClassOfStory,
                                  String updateNovelClassOfSex) {
        boolean isOk = false;

        int line = novelDao.updateOneNovel(oldNovelName, updateNovelName, updateNovelAuthor, updateNovelSynopsis, updateNovelCover, updateNovelClassOfStory, updateNovelClassOfSex);
        if (line > 0){
            isOk = true;
        }
        return isOk;
    }


    @Override
    public List<Novel> novelReadingVolume() {
        return novelDao.novelReadingVolume();
    }

    //更新小说的点击量，每次被加入书架都会增加一次点击量
    @Override
    public boolean updateVolume(String novelName) {
        return novelDao.updateVolume(novelName);
    }


    @Override
    public List<Book> selectNovel() {

        List<Book> books = novelDao.selectNovel();
        return books;
    }



}
