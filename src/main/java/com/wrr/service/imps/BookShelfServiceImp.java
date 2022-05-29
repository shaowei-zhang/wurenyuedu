package com.wrr.service.imps;

import com.wrr.dao.BookshelfDao;
import com.wrr.entity.Bookshelf;
import com.wrr.service.IBookShelfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BookShelfServiceImp implements IBookShelfService {

    @Autowired
    private BookshelfDao BookshelfDao;

    @Override
    public List<Bookshelf> showBooks(String bookType) {


        List<Bookshelf> books = null;
        if(bookType.equals("小说类")){
            System.out.println(bookType);
            books = BookshelfDao.showNovels();
        }else if(bookType.equals("漫画类")){
            books = BookshelfDao.showCartoons();
        }

        return books;
    }

    @Override
    public Bookshelf selectOneBook(String bookName) {
        return null;
    }

    @Override
    public boolean deleteOneBook(int bookId) {
        return false;
    }

    @Override
    public boolean insertOneBook(Bookshelf book) {
        return false;
    }

    @Override
    public boolean updateOneBook(Bookshelf book, String bookName) {
        return false;
    }
}
