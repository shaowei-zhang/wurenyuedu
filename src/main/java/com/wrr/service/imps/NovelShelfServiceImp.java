package com.wrr.service.imps;


import com.wrr.dao.NovelshelfDao;
import com.wrr.entity.Novelshelf;
import com.wrr.service.INovelShelfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class NovelShelfServiceImp implements INovelShelfService{
        @Autowired
    private NovelshelfDao novelshelfDao;
    @Override
    public List<Novelshelf> showBooks(String bookType) {
        return novelshelfDao.showNovels();
    }

    @Override
    public Novelshelf selectOneBook(String bookName) {
        return novelshelfDao.selectOneBook(bookName);
    }

    @Override
    public boolean deleteOneBook(int bookId) {
        return false;
    }

    @Override
    public boolean deleteSomeBooks(int bookId) {
        return novelshelfDao.deleteSomeBooks(bookId);
    }

    @Override
    public boolean insertOneBook(Novelshelf book) {
        return novelshelfDao.insertOneBook(book);
    }

    @Override
    public List<Novelshelf> SelectBookByName(String readName) {
        return novelshelfDao.SelectBookByName(readName);
    }


    @Override
    public boolean updateOneBook(Novelshelf book, String bookName) {
        return false;
    }

    @Override
    public Novelshelf selectOneBookByReadName(String bookName, String readName) {
        return novelshelfDao.selectOneBookByReadName(bookName,readName);
    }

}
