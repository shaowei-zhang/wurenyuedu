package com.wrr.controller;

import com.wrr.entity.Cartoon;
import com.wrr.entity.Cartoonshelf;
import com.wrr.entity.Novel;
import com.wrr.entity.Novelshelf;
import com.wrr.service.ICartoonService;
import com.wrr.service.ICartoonShelfService;
import com.wrr.service.INovelService;
import com.wrr.service.INovelShelfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BookShelfController extends HttpServlet {
    @Autowired
    private INovelShelfService iNovelShelfService;
    @Autowired
    private INovelService iNovelService;

    @Autowired
    private ICartoonShelfService iCartoonShelfService;
    @Autowired
    private ICartoonService iCartoonService;


    /**
     * 查询书架的漫画
     * @param request
     * @return
     */
    @RequestMapping("toShowCartoons")
    public String showCartoons(HttpServletRequest request){
        //获取全局共享的username
        System.out.println("这里是书架，展示书架漫画的位置");
        String name= (String) request.getSession().getAttribute("username");
        System.out.println(name);
        //通过用户名来查询搜收藏的漫画
        List<Cartoonshelf> cartoons = iCartoonShelfService.SelectCartoonByName(name);
        request.setAttribute("Cartoons",cartoons);
        return "jsp/device/5-1.jsp?bookshelf=cc";
    }

//    加入漫画书架
    @RequestMapping("toAddCartoonShelf")
    public String toAddCartoonShelf(HttpServletRequest request) {
        String CartoonName=request.getParameter("CartoonName");
        String name= (String) request.getSession().getAttribute("username");
        String toPage="";
        //1,首先要验证这本书是否已经存在书架
        Cartoonshelf Cartoonshelf1=iCartoonShelfService.selectOneCartoonByReadName(CartoonName,name);
        if (Cartoonshelf1==null){
            //根据书名查询整本书的信息，然后将信息插入到书架中去
            Cartoon novel=iCartoonService.selectOneCartoon(CartoonName);
            System.out.println(novel.getCartoonName());
            System.out.println("跳转到了加入书架页面");
            String bookName=novel.getCartoonName();
            String bookType=novel.getCartoonClassOfStory();
            String bookAuthor=novel.getCartoonAuthor();
            String bookCover=novel.getCartoonCover();
            Cartoonshelf Cartoonshelf=new Cartoonshelf(bookName,bookType,bookCover,bookAuthor,name);
            // 插入书架
            iCartoonShelfService.insertOneCartoon(Cartoonshelf);
            //在插入书架的同时，更新Cartoon表中的功能，是点击量+1；
            toPage="jsp/device/5-1.jsp";
        }else{
            toPage="jsp/device/error.jsp";
        }
        return toPage;
    }


    /**
     * 查询书架小说
     * @param request
     * @return
     */
    @RequestMapping("toShowNovels")
    public String showNovels(HttpServletRequest request)  {
        //获取全局共享的username
        String username= (String) request.getSession().getAttribute("username");
        System.out.println(username);
        //通过用户名来查询搜收藏的书籍
        List<Novelshelf> books =iNovelShelfService.SelectBookByName(username);
        request.setAttribute("books",books);
        return "jsp/device/5-1.jsp?bookshelf=nc";
    }
//加入小说书架
    @RequestMapping("toAddNovelShelf")
    public String toAddNovelShelf(HttpServletRequest request) {
        String NovelName=request.getParameter("NovelName");
        String name= (String) request.getSession().getAttribute("username");
        String toPage="";
        //1,首先要验证这本书是否已经存在
        Novelshelf novelshelf1=iNovelShelfService.selectOneBookByReadName(NovelName,name);
        if (novelshelf1==null){
            //根据书名查询整本书的信息，然后将信息插入到书架中去
            Novel novel=iNovelService.selectOneNovel(NovelName);
            System.out.println(novel.getNovelName());
            System.out.println("跳转到了加入书架页面");
            String bookName=novel.getNovelName();
            String bookType=novel.getNovelClassOfStory();
            String bookAuthor=novel.getNovelAuthor();
            String bookCover=novel.getNovelCover();
            Novelshelf novelshelf=new Novelshelf(bookName,bookType,bookCover,bookAuthor,name);
            // 插入书架
            iNovelShelfService.insertOneBook(novelshelf);
            //在插入书架的同时，更新Cartoon表中的功能，是点击量+1；
            iNovelService.updateVolume(bookName);
            toPage="jsp/device/5-1.jsp";
        }else{
            toPage="jsp/device/error.jsp";
        }
        return toPage;
    }
//批量删除小说
    @RequestMapping("deleteSomeBooks")
    public  String deleteSomeBooks(HttpServletRequest request){
        String[] userId = request.getParameterValues("check");
        for (int i = 0; i < userId.length ; i++) {
            int  id=Integer.parseInt(userId[i]);
            iNovelShelfService.deleteSomeBooks(id);
        }
        return "jsp/device/success.jsp";
    }
    //批量删除漫画
    @RequestMapping("deleteSomeCartoons")
    public  String deleteSomeCartoons(HttpServletRequest request){
        String[] userId = request.getParameterValues("check");
        for (int i = 0; i < userId.length ; i++) {
            int  id=Integer.parseInt(userId[i]);
          iCartoonShelfService.deleteSomeCartoons(id);
        }
        return "jsp/device/success.jsp";
    }


    }
