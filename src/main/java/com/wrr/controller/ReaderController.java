package com.wrr.controller;

import com.wrr.entity.Reader;
import com.wrr.service.IReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class ReaderController {
    @Autowired
    private IReaderService iReaderService;
    @Autowired
    private Reader reader;


    /**
     * 展示所有读者信息
     * @return
     */
    @RequestMapping(value = "toShowAllReaders",method = RequestMethod.POST)
    @ResponseBody //返回的数据不是html标签的页面,而是其他某种格式的数据时(如json、xml等)
    public List<Reader> ShowAllReaders(){
        List<Reader> readers = iReaderService.showAll();
        return readers;
    }


//    /**
//     * 输入框自动补全查询
//     * @return
//     */
//    @RequestMapping(value = "toSelectOneReader",method = RequestMethod.POST)
//    @ResponseBody
//    public List<String> selectOneReader(){
//
//        List<String> readerNames = new ArrayList<>();
//        List<Reader> readers = iReaderService.showAll();
//        for(Reader reader:readers){
//            readerNames.add(reader.getReaderName());
//        }
//        return readerNames;
//    }


    /**
     * 添加一个读者
     * @param addReaderName
     * @param addReaderPassword
     * @return
     */
    @RequestMapping(value = "toAddOneReader",method = RequestMethod.POST)
    @ResponseBody
    public String addOneReader(@RequestParam(value = "addReaderName") String addReaderName,
                               @RequestParam(value = "addReaderPassword") String addReaderPassword){

        //获取当前时间传给页面
        Date newDateDemo = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String newDateString = sdf.format(newDateDemo);

        reader.setReaderName(addReaderName);
        reader.setReaderPassword(addReaderPassword);

        iReaderService.insertOneReader(reader);
        return newDateString;
    }


    /**
     * 更新读者信息
     * @param newReaderName
     * @param newReaderPassword
     * @param oldReaderName
     * @return
     */
    @RequestMapping(value = "toUpdateOneReader",method = RequestMethod.POST)
    @ResponseBody
    public boolean updateOneReader(@RequestParam(value = "newReaderName") String newReaderName,
                                   @RequestParam(value = "newReaderPassword") String newReaderPassword,
                                   @RequestParam(value = "oldReaderName") String oldReaderName){
        boolean isOk = false;
        isOk = iReaderService.updateOneReader(newReaderName,newReaderPassword,oldReaderName);

        return isOk;
    }


    /**
     * 注销读者
     * @param deleteReaderName
     * @return
     */
    @RequestMapping(value = "toDeleteOneReader",method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteOneReader(@RequestParam(value = "deleteReaderName") String deleteReaderName){
        boolean isOk = false;

        reader.setReaderName(deleteReaderName);
        isOk = iReaderService.deleteOneReader(reader);

        return isOk;
    }
}
