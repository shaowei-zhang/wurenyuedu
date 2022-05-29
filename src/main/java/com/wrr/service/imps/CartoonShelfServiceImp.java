package com.wrr.service.imps;

import com.wrr.dao.CartoonshelfDao;
import com.wrr.entity.Cartoonshelf;
import com.wrr.service.ICartoonShelfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartoonShelfServiceImp implements ICartoonShelfService {
    @Autowired
    private CartoonshelfDao cartoonshelfDao;
    @Override
    public List<Cartoonshelf> showCartoon(String cartoonType) {
        return cartoonshelfDao.showCartoon();
    }

    @Override
    public Cartoonshelf selectOneCartoon(String cartoonName) {
        return cartoonshelfDao.selectOneCartoon(cartoonName);
    }

    @Override
    public boolean deleteOneCartoon(int cartoonId) {
        return false;
    }

    @Override
    public boolean deleteSomeCartoons(int cartoonId) {
        return cartoonshelfDao.deleteSomeCartoons(cartoonId);
    }

    @Override
    public boolean insertOneCartoon(Cartoonshelf cartoon) {
        return cartoonshelfDao.insertOneCartoon(cartoon);
    }

    @Override
    public boolean updateOneCartoon(Cartoonshelf cartoon, String cartoonName) {
        return false;
    }

    @Override
    public List<Cartoonshelf> SelectCartoonByName(String readName) {
        return cartoonshelfDao.SelectCartoonByName(readName);
    }

    @Override
    public Cartoonshelf selectOneCartoonByReadName(String cartoonName, String readName) {
        return cartoonshelfDao.selectOneCartoonByReadName(cartoonName,readName);
    }
}
