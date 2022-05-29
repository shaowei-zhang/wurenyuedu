package com.wrr.service;

import com.wrr.entity.Reader;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 读者reader service接口
 */
public interface IReaderService {
    public List<Reader> showAll();
    public boolean deleteOneReader(Reader reader); //根据readerId删除
    public boolean insertOneReader(Reader reader);
    public boolean updateOneReader(String newReaderName, String newPassword, String oldReaderName);//根据ReaderName找到Reader进行修改

    public Reader selectOneReader(@Param("readerName")String readerName);//根据姓名查询(readerName是惟一的)


}
