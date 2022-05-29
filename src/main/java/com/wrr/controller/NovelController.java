package com.wrr.controller;

import com.wrr.entity.Book;
import com.wrr.entity.Cartoon;
import com.wrr.entity.Novel;
import com.wrr.service.ICartoonService;
import com.wrr.service.INovelService;
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
public class NovelController {
    @Autowired
    private INovelService iNovelService;
    @Autowired
    private Novel novel;
    @Autowired
    private ICartoonService iCartoonService;


    @RequestMapping(value = "toShowAllNovels",method = RequestMethod.POST)
    @ResponseBody
    public List<Novel> showAllNovels(HttpServletRequest request){
        List<Novel> novels = iNovelService.showAllNovels();
        return novels;
    }


    /**
     * 添加一本小说
     */
    @RequestMapping(value = "toAddOneNovel",method = RequestMethod.POST)
    @ResponseBody
    public boolean addOneNovel(@RequestParam(value = "addNovelName") String addNovelName,
                               @RequestParam(value = "addNovelAuthor") String addNovelAuthor,
                               @RequestParam(value = "addNovelSynopsis") String addNovelSynopsis,
                               @RequestParam(value = "addNovelCover") String addNovelCover,
                               @RequestParam(value = "addNovelClassOfStory") String addNovelClassOfStory,
                               @RequestParam(value = "addNovelClassOfSex") String addNovelClassOfSex){
        novel.setNovelName(addNovelName);
        novel.setNovelAuthor(addNovelAuthor);
        novel.setNovelSynopsis(addNovelSynopsis);
        novel.setNovelCover(addNovelCover);
        novel.setNovelClassOfStory(addNovelClassOfStory);
        novel.setNovelClassOfSex(addNovelClassOfSex);

        iNovelService.insertOneNovel(novel);
        return true;

    }


    /**
     * 更新小说信息
     */
    @RequestMapping(value = "toUpdateOneNovel",method = RequestMethod.POST)
    @ResponseBody
    public boolean updateOneNovel(@RequestParam(value = "oldNovelName") String oldNovelName,
                                   @RequestParam(value = "updateNovelName") String updateNovelName,
                                   @RequestParam(value = "updateNovelAuthor") String updateNovelAuthor,
                                   @RequestParam(value = "updateNovelSynopsis") String updateNovelSynopsis,
                                   @RequestParam(value = "updateNovelCover") String updateNovelCover,
                                   @RequestParam(value = "updateNovelClassOfStory") String updateNovelClassOfStory,
                                   @RequestParam(value = "updateNovelClassOfSex") String updateNovelClassOfSex){
        iNovelService.updateOneNovel(
                oldNovelName,
                updateNovelName,
                updateNovelAuthor,
                updateNovelSynopsis,
                updateNovelCover,
                updateNovelClassOfStory,
                updateNovelClassOfSex
                );
        return true;
    }


    /**
     * 移除小说
     * @param deleteNovelName
     * @return
     */
    @RequestMapping(value = "toDeleteOneNovel",method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteOneNovel(@RequestParam(value = "deleteNovelName") String deleteNovelName){
        boolean isOk = false;

        novel.setNovelName(deleteNovelName);
        isOk = iNovelService.deleteOneNovel(novel);

        return isOk;
    }


    /**
     * 根据小说性别分类,并判断跳转到男生OR女生页面
     * @param request
     * @return
     */
    @RequestMapping("toSelectNovelsOfSex")
    public String selectNovelsOfSex(HttpServletRequest request){

        String pageName = request.getParameter("pageName");

        List<Novel> novels = null;
        String toPage = "";

        if(pageName.equals("boy")){
            novels = iNovelService.showSexOfNovels("男");
            toPage = "jsp/device/3-1.jsp?man=nc";
        }
        else if(pageName.equals("girl")){
            novels = iNovelService.showSexOfNovels("女");
            toPage = "jsp/device/4-1.jsp?women=nc";
        }
        request.setAttribute("novels",novels);
        return toPage;
    }

    /**
     * 根据novel内容查询
     * @param request
     * @return
     */
    @RequestMapping("toSelectNovelsOfStory")
    public String selectNovelsOfStory(HttpServletRequest request){

        String classOfStory = request.getParameter("Novel");
        List<Novel> novels2 = iNovelService.showStoryOfNovels(classOfStory);
        request.setAttribute("novels2",novels2);

        return  "jsp/device/1-1.jsp?Novel="+classOfStory;
    }


    //    模糊查询
    @RequestMapping("/toSelectNovelsName")
    public String selectOneNovel(String novelName, Model model){
        Novel novel= iNovelService.selectOneNovel(novelName);
        List<Novel> list= new ArrayList<>();
        list.add(novel);
        if (novel==null){
            list=iNovelService.showAllNovels();
        }
        model.addAttribute("novels2",list);
        return "jsp/device/select.jsp";
    }
    //根据传来的书名可以查询整本书的信息，————>Novel.jsp
    @RequestMapping("toNovelName")
    public String toNovelName(HttpServletRequest request){
        String title= request.getParameter("title");
        System.out.println(title);
        Novel novel= iNovelService.selectOneNovel(title);
        List<Novel> list= new ArrayList<>();
        list.add(novel);
        request.setAttribute("List",list);
        return "jsp/novel/Novel.jsp";
    }


    //根据点击的章节来接受书名，id和章节号，并且查询这本书的信息
    @RequestMapping("toNovelChapter")
    public String  toNovelChapter(HttpServletRequest request){
        String NovelName= request.getParameter("NovelName");
        String id= request.getParameter("id");
        System.out.println(NovelName);
        System.out.println(id);
        Novel novel= iNovelService.selectOneNovel(NovelName);
        List<Novel> list= new ArrayList<>();
        list.add(novel);
        request.setAttribute("List",list);
        String chapterName= request.getParameter("chapter");
        System.out.println(chapterName);
        return "jsp/novel/content.jsp?id="+id;
//        return "jsp/novel/content.jsp?chapter="+chapterName+"&id="+id;
    }

    //这是跳转到上一章
    @RequestMapping("toPreviousChapter")
    public String PreviousChapter(HttpServletRequest request){
        System.out.println("跳转到toPreviousChapter");
        String  id1=request.getParameter("id");
        int id2 = Integer.parseInt(id1);
        System.out.println("这是"+id2);
        int id= id2-1;
        int Pid=0;
        if (id!=0){
            Pid=id;
        }
        String NovelName= request.getParameter("NovelName");
        Novel novel= iNovelService.selectOneNovel(NovelName);
        List<Novel> list= new ArrayList<>();
        list.add(novel);
        request.setAttribute("List",list);
        return "jsp/novel/content.jsp?id="+Pid;
    }

    //这是跳转到下一章
    @RequestMapping("toNextChapter")
    public String NextChapter(HttpServletRequest request){
        System.out.println("跳转到toNextChapter");
        String  id1=request.getParameter("id");
        int id2 = Integer.parseInt(id1);
        System.out.println("这是"+id2);
        int id= id2+1;
        int Pid=0;
        if (id<=12){
            Pid=id;
        }
        String NovelName= request.getParameter("NovelName");
        Novel novel= iNovelService.selectOneNovel(NovelName);
        List<Novel> list= new ArrayList<>();
        list.add(novel);
        request.setAttribute("List",list);
        return "jsp/novel/content.jsp?id="+Pid;
    }

    //查询出来前五名的书籍信息，做成排行榜
    @RequestMapping("toShowNovelReadingVolume")
    public String toShowNovelReadingVolume(HttpServletRequest request){
        String chart=request.getParameter("RS");
        List<Novel> novels=iNovelService.novelReadingVolume();
        request.setAttribute("Novels",novels);
        List<Cartoon> cartoons=iCartoonService.cartoonReadingVolume();
        request.setAttribute("Cartoons",cartoons);
        return  "jsp/device/6-1.jsp?RS"+chart;
    }

    //这是Echarts的图表显示
    @RequestMapping("toEcharts")
    public String toEcharts(HttpServletRequest request){
        String figure=request.getParameter("RS");
        List<Novel> list=iNovelService.novelReadingVolume();
        //列出前五名的小说
        String NovelName1=list.get(0).getNovelName();
        String NovelName2=list.get(1).getNovelName();
        String NovelName3=list.get(2).getNovelName();
        String NovelName4=list.get(3).getNovelName();
        String NovelName5=list.get(4).getNovelName();
        //列出前五名小说的的点击数
        int Volume1=list.get(0).getNovelReadingVolume();
        int Volume2=list.get(1).getNovelReadingVolume();
        int Volume3=list.get(2).getNovelReadingVolume();
        int Volume4=list.get(3).getNovelReadingVolume();
        int Volume5=list.get(4).getNovelReadingVolume();

        List<Cartoon> cartoons=iCartoonService.cartoonReadingVolume();
        //列出前五名的漫画
        String Cartoon1=cartoons.get(0).getCartoonName();
        String Cartoon2=cartoons.get(1).getCartoonName();
        String Cartoon3=cartoons.get(2).getCartoonName();
        String Cartoon4=cartoons.get(3).getCartoonName();
        String Cartoon5=cartoons.get(4).getCartoonName();
        //列出前五名漫画的的点击数
        int VolumeCartoon1=list.get(0).getNovelReadingVolume();
        int VolumeCartoon2=list.get(1).getNovelReadingVolume();
        int VolumeCartoon3=list.get(2).getNovelReadingVolume();
        int VolumeCartoon4=list.get(3).getNovelReadingVolume();
        int VolumeCartoon5=list.get(4).getNovelReadingVolume();

        return "jsp/device/6-1.jsp?RS="+figure+
                //    这里是小说前五名的分析图
                "&NovelName1="+NovelName1
                +"&NovelName2="+NovelName2
                +"&NovelName3="+NovelName3
                +"&NovelName4="+NovelName4
                +"&NovelName5="+NovelName5
                +"&Volume1="+Volume1
                +"&Volume2="+Volume2
                +"&Volume3="+Volume3
                +"&Volume4="+Volume4
                +"&Volume5="+Volume5
//    这里是漫画前五名的分析图
                + "&Cartoon1="+Cartoon1
                +"&Cartoon2="+Cartoon2
                +"&Cartoon3="+Cartoon3
                +"&Cartoon4="+Cartoon4
                +"&Cartoon5="+Cartoon5
                +"&VolumeCartoon1="+VolumeCartoon1
                +"&VolumeCartoon2="+VolumeCartoon2
                +"&VolumeCartoon4="+VolumeCartoon3
                +"&VolumeCartoon4="+VolumeCartoon4
                +"&VolumeCartoon4="+VolumeCartoon5

                ;
    }

    /**
     * 管理员小说分析
     * @return
     */
    @RequestMapping(value = "toNovelReadingState",method = RequestMethod.POST)
    @ResponseBody
    public List<Book> novelReadingState(){
        List<Book> books = iNovelService.selectNovel();
        return books;
    }

}
