package com.wrr.service.imps;

import com.wrr.dao.CartoonDao;
import com.wrr.entity.Book;
import com.wrr.entity.Cartoon;
import com.wrr.service.ICartoonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CartoonServiceImp implements ICartoonService {

    @Autowired
    private CartoonDao cartoonDao;

    @Override
    public List<Cartoon> showAllCartoons() {

        List<Cartoon> cartoons = cartoonDao.showAllCartoons();

        return cartoons;
    }

    @Override
    public List<Cartoon> showSexOfCartoons(String typeOfSex) {

        List<Cartoon> cartoons = cartoonDao.showSexOfCartoons(typeOfSex);

        return cartoons;
    }

    @Override
    public List<Cartoon> showStoryOfCartoons(String cartoonType) {

        List<Cartoon> cartoons2 = cartoonDao.showStoryOfCartoons(cartoonType);

        return cartoons2;
    }

    @Override
    public List<Cartoon> selectCartoon() {
        return null;
    }

    @Override
    public boolean deleteOneCartoon(Cartoon cartoon) {
        int line = cartoonDao.deleteOneCartoon(cartoon);
        boolean isOk = false;

        if(line > 0){
            isOk = true;
        }
        return isOk;
    }

    @Override
    public boolean insertOneCartoon(Cartoon cartoon) {
        int line = cartoonDao.insertOneCartoon(cartoon);
        boolean isOk = false;

        if (line > 0){
            isOk = true;
        }
        return isOk;
    }

    @Override
    public boolean updateOneCartoon(String oldCartoonName,
                                    String updateCartoonName,
                                    String updateCartoonAuthor,
                                    String updateCartoonSynopsis,
                                    String updateCartoonCover,
                                    String updateCartoonClassOfStory,
                                    String updateCartoonClassOfSex) {
        boolean isOk = false;

        int line = cartoonDao.updateOneCartoon(oldCartoonName, updateCartoonName, updateCartoonAuthor, updateCartoonSynopsis, updateCartoonCover, updateCartoonClassOfStory, updateCartoonClassOfSex);
        if (line > 0){
            isOk = true;
        }
        return isOk;
    }

    @Override
    public List<Cartoon> cartoonReadingVolume() {
        return cartoonDao.cartoonReadingVolume();
    }

    @Override
    public boolean updateVolume(String cartoonName) {
        return cartoonDao.updateVolume(cartoonName);
    }

    @Override
    public List<Book> selectStoryOfCartoon() {
        List<Book> books= cartoonDao.selectStoryOfCartoon();
        return books;
    }


    @Override
    public Cartoon selectOneCartoon(String cartoonName) {
        return cartoonDao.selectOneCartoon(cartoonName);
    }


}
