package com.wrr.controller;

import com.wrr.entity.Book;
import com.wrr.entity.Cartoon;
import com.wrr.service.ICartoonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CartoonController {

    @Autowired
    private ICartoonService iCartoonService;
    @Autowired
    private Cartoon cartoon;

    @RequestMapping(value = "toShowAllCartoons",method = RequestMethod.POST)
    @ResponseBody
    public List<Cartoon> showAllCartoons(HttpServletRequest request){
        List<Cartoon> cartoons = iCartoonService.showAllCartoons();
        return cartoons;
    }

    /**
     * 添加一本漫画
     */
    @RequestMapping(value = "toAddOneCartoon",method = RequestMethod.POST)
    @ResponseBody
    public boolean addOneCartoon(@RequestParam(value = "addCartoonName") String addCartoonName,
                                 @RequestParam(value = "addCartoonAuthor") String addCartoonAuthor,
                                 @RequestParam(value = "addCartoonSynopsis") String addCartoonSynopsis,
                                 @RequestParam(value = "addCartoonCover") String addCartoonCover,
                                 @RequestParam(value = "addCartoonClassOfStory") String addCartoonClassOfStory,
                                 @RequestParam(value = "addCartoonClassOfSex") String addCartoonClassOfSex){
        cartoon.setCartoonName(addCartoonName);
        cartoon.setCartoonAuthor(addCartoonAuthor);
        cartoon.setCartoonSynopsis(addCartoonSynopsis);
        cartoon.setCartoonCover(addCartoonCover);
        cartoon.setCartoonClassOfStory(addCartoonClassOfStory);
        cartoon.setCartoonClassOfSex(addCartoonClassOfSex);

        iCartoonService.insertOneCartoon(cartoon);
        return true;

    }


    /**
     * 更新漫画信息
     */
    @RequestMapping(value = "toUpdateOneCartoon",method = RequestMethod.POST)
    @ResponseBody
    public boolean updateOneCartoon(@RequestParam(value = "oldCartoonName") String oldCartoonName,
                                  @RequestParam(value = "updateCartoonName") String updateCartoonName,
                                  @RequestParam(value = "updateCartoonAuthor") String updateCartoonAuthor,
                                  @RequestParam(value = "updateCartoonSynopsis") String updateCartoonSynopsis,
                                  @RequestParam(value = "updateCartoonCover") String updateCartoonCover,
                                  @RequestParam(value = "updateCartoonClassOfStory") String updateCartoonClassOfStory,
                                  @RequestParam(value = "updateCartoonClassOfSex") String updateCartoonClassOfSex){
        iCartoonService.updateOneCartoon(
                oldCartoonName,
                updateCartoonName,
                updateCartoonAuthor,
                updateCartoonSynopsis,
                updateCartoonCover,
                updateCartoonClassOfStory,
                updateCartoonClassOfSex
        );
        return true;
    }


    /**
     * 移除漫画
     * @param deleteCartoonName
     * @return
     */
    @RequestMapping(value = "toDeleteOneCartoon",method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteOneCartoon(@RequestParam(value = "deleteCartoonName") String deleteCartoonName){
        boolean isOk = false;

        System.out.println(deleteCartoonName);
        cartoon.setCartoonName(deleteCartoonName);
        isOk = iCartoonService.deleteOneCartoon(cartoon);

        return isOk;
    }



    /**
     * 根据漫画性别分类,并判断跳转到男生OR女生页面
     * @param request
     * @return
     */
    @RequestMapping("toSelectCartoonsOfSex")
    public String selectCartoonsOfSex(HttpServletRequest request){

        String pageName = request.getParameter("pageName");

        List<Cartoon> cartoons = null;
        String toPage = "";

        if(pageName.equals("boy")){

            cartoons = iCartoonService.showSexOfCartoons("男");
            toPage = "jsp/device/3-1.jsp?man=cc";
        }
        else if(pageName.equals("girl")){
            cartoons = iCartoonService.showSexOfCartoons("女");
            toPage = "jsp/device/4-1.jsp?women=cc";
        }
        request.setAttribute("cartoons",cartoons);
        return toPage;
    }


    /**
     * 根据cartoon内容查询
     * @param request
     * @return
     */
    @RequestMapping("toSelectCartoonsOfStory")
    public String selectCartoonsOfStory(HttpServletRequest request){

        String classOfStory = request.getParameter("Cartoon");
        List<Cartoon> cartoons2 = iCartoonService.showStoryOfCartoons(classOfStory);
        request.setAttribute("cartoons2",cartoons2);

        return  "jsp/device/2-1.jsp?Cartoon="+classOfStory;
    }

    //    模糊查询
    @RequestMapping("/toSelectCartoonsName")
    public String selectOneCartoon(String cartoonName, Model model){
        Cartoon cartoon= iCartoonService.selectOneCartoon(cartoonName);
        List<Cartoon> list= new ArrayList<>();
        list.add(cartoon);
        if (cartoon==null){
            list=iCartoonService.showAllCartoons();
        }
        model.addAttribute("cartoons2",list);

        return "jsp/device/select.jsp";
    }


    //根据名字查询漫画
    @RequestMapping("toCartoonName")
    public String toCartoonName(HttpServletRequest request){
        String Name= request.getParameter("Name");
        System.out.println(Name);
        Cartoon  cartoon=iCartoonService.selectOneCartoon(Name);
        List<Cartoon> list= new ArrayList<>();
        list.add(cartoon);
        request.setAttribute("List",list);
        return "jsp/cartoon/Cartoon.jsp?";
    }

    @RequestMapping("toCartoonChapter")
    public String toCartoonChapter(HttpServletRequest request) {
        String cartoonName= request.getParameter("cartoonName");
        String id= request.getParameter("id");
        System.out.println(cartoonName);
        System.out.println(id);
        Cartoon cartoon=iCartoonService.selectOneCartoon(cartoonName);
        List<Cartoon> list= new ArrayList<>();
        list.add(cartoon);
        request.setAttribute("List",list);
        String chapterName= request.getParameter("chapter");
        System.out.println(chapterName);
        return "jsp/cartoon/content.jsp?chapter="+chapterName+"&id="+id;
    }
    //上一章
    @RequestMapping("toPreviousChapter2")
    public String toPreviousChapter(HttpServletRequest request) {
        System.out.println("跳转到toPreviousChapter2");
        String id1 = request.getParameter("id");
        int id2 = Integer.parseInt(id1);
        System.out.println("这是" + id2);
        int id = id2 - 1;
        int Pid1 = 0;
        if (id != 0) {
            Pid1 = id;
        }
        String CartoonName1= request.getParameter("CartoonName");
        Cartoon cartoon = iCartoonService.selectOneCartoon(CartoonName1);
        List<Cartoon> list1= new ArrayList<>();
        list1.add(cartoon);
        request.setAttribute("List", list1);
        System.out.println(Pid1);
        return "jsp/cartoon/content.jsp?id="+Pid1;
    }
    //下一章
    @RequestMapping("toNextChapter2")
    public String toNextChapter(HttpServletRequest request){
        System.out.println("跳转到toNextChapter2");
        String  id1=request.getParameter("id");
        int id2 = Integer.parseInt(id1);
        System.out.println("这是"+id2);
        int id= id2+1;
        int Pid=0;
        if (id<=12){
            Pid=id;
        }
        String CartoonName= request.getParameter("CartoonName");
        Cartoon cartoon= iCartoonService.selectOneCartoon(CartoonName);
        List<Cartoon> list= new ArrayList<>();
        list.add(cartoon);
        request.setAttribute("List",list);
        return "jsp/cartoon/content.jsp?id="+Pid;
    }

    /**
     * 管理员漫画分析
     * @return
     */
    @RequestMapping(value = "toCartoonReadingState",method = RequestMethod.POST)
    @ResponseBody
    public List<Book> cartoonReadingState(){
        List<Book> books = iCartoonService.selectStoryOfCartoon();

        return books;
    }


}
