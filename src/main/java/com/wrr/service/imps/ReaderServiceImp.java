package com.wrr.service.imps;

import com.wrr.dao.ReaderDao;
import com.wrr.entity.Reader;
import com.wrr.service.IReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ReaderServiceImp implements IReaderService {

    @Autowired
    private ReaderDao readerDao;

    @Override
    public List<Reader> showAll() {

        List<Reader> readers = readerDao.showAllReaders();
        return readers;
    }


    @Override
    public boolean deleteOneReader(Reader reader) {

        int line = readerDao.deleteOneReader(reader);
        boolean isOk = false;

        if(line > 0){
            isOk = true;
        }
        return isOk;
    }

    @Override
    public boolean insertOneReader(Reader reader) {
        int line = readerDao.insertOneReader(reader);
        boolean isOk = false;
        if(line > 0){
            isOk = true;
        }
        return isOk;
    }

    @Override
    public boolean updateOneReader(String newReaderName,String newPassword,String oldReaderName) {

        int line = 0;
        line = readerDao.updateOneReader(newReaderName,newPassword,oldReaderName);
        boolean isOk=false;

        if (line > 0){
            isOk=true;
        }

        return isOk;
    }

    @Override
    public Reader selectOneReader(String readerName) {
        return readerDao.selectOneReader(readerName);
    }
}
