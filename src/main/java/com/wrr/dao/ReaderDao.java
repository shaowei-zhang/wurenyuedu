package com.wrr.dao;

import com.wrr.entity.Novel;
import com.wrr.entity.Reader;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 读者reader dao层映射接口
 */
@Repository
public interface ReaderDao {
    public List<Reader> showAllReaders();
    public Reader selectOneReader(@Param("readerName")String readerName);//根据姓名查询(readerName是惟一的)
    public int deleteOneReader(Reader reader); //根据readerId删除
    public int insertOneReader(Reader reader);
    public int updateOneReader(@Param("newReaderName") String newReaderName,
                               @Param("newPassword") String newPassword,
                               @Param("oldReaderName") String oldReaderName);//根据ReaderName找到Reader进行修改
}
