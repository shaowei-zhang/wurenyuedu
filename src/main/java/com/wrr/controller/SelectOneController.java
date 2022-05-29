package com.wrr.controller;


import com.wrr.entity.Cartoon;
import com.wrr.entity.Novel;
import com.wrr.service.ICartoonService;
import com.wrr.service.INovelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

;

//下拉框姓名和作者
@Controller
public class SelectOneController {
    @Autowired
    INovelService iNovelService;

    @Autowired
    ICartoonService iCartoonService;

    @RequestMapping(value = "SelectOneNovel",method = RequestMethod.POST)
    @ResponseBody

 public List<String> selectOneNovel(HttpServletRequest request){

        List<Novel>  novels=iNovelService.showAllNovels();
     List<String> msg=new ArrayList<>();
     for(Novel n:novels){
         //可添加
         msg.add(n.getNovelName());
        msg.add(n.getNovelAuthor());
     }

     return msg;

 }
 @RequestMapping(value = "selectOneCartoon",method = RequestMethod.POST)
 @ResponseBody
 public  List<String> selectOneCartoon(HttpServletRequest request){
     List<Cartoon> cartoons=iCartoonService.showAllCartoons();
     List<String> msg=new ArrayList<>();
     for (Cartoon c:cartoons){
         msg.add(c.getCartoonName());
         msg.add(c.getCartoonAuthor());
     }
     return msg;
 }

    @RequestMapping(value = "selectOneMen",method = RequestMethod.POST)
    @ResponseBody
    public  List<String> selectOneMen(HttpServletRequest request){
        List<Novel> novels = iNovelService.showSexOfNovels("男");
        List<Cartoon> cartoons = iCartoonService.showSexOfCartoons("男");
        List<String> msg=new ArrayList<>();
        for (Cartoon c:cartoons){
            msg.add(c.getCartoonName());
            msg.add(c.getCartoonAuthor());
        }
        for(Novel n:novels){
            //可添加
            msg.add(n.getNovelName());
            msg.add(n.getNovelAuthor());
        }
        return msg;
    }

    @RequestMapping(value = "selectOneWomen",method = RequestMethod.POST)
    @ResponseBody
    public  List<String> selectOneWomen(HttpServletRequest request){

        List<Novel> novels = iNovelService.showSexOfNovels("女");
        List<Cartoon> cartoons = iCartoonService.showSexOfCartoons("女");

        List<String> msg=new ArrayList<>();
        for (Cartoon c:cartoons){
            msg.add(c.getCartoonName());
            msg.add(c.getCartoonAuthor());
        }
        for(Novel n:novels){
            //可添加
            msg.add(n.getNovelName());
            msg.add(n.getNovelAuthor());
        }
        return msg;
    }



    }

