package com.wrr.controller;

import com.wrr.entity.Cartoon;
import com.wrr.entity.Novel;
import com.wrr.entity.Reader;
import com.wrr.service.ICartoonService;
import com.wrr.service.INovelService;
import com.wrr.service.IReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class LoginController{

    @Autowired
    private ICartoonService iCartoonService;
    @Autowired
    private INovelService iNovelService;
    @Autowired
    private IReaderService iReaderService;
    /**
     * 登录
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("toLogin")
    public String toApplicationMain(HttpServletRequest request){
        //用户输入的用户名和密码
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        System.out.println(username);
        System.out.println(password);
//        将username全局共享
        request.getSession().setAttribute("username",username);
        //根据用户名查询该用户，
        Reader reader=iReaderService.selectOneReader(username);
        //提取出来密码，如果密码相同的话，则成功登录
        String toPage = "";
        if(reader==null){
            return "login2.jsp";
        }else{
            String pwd=reader.getReaderPassword();
            System.out.println(pwd);
            //取值
            List<Cartoon> cartoons=iCartoonService.showAllCartoons();
            List<Novel> novels=iNovelService.showAllNovels();
            request.getSession().setAttribute("cartoons",cartoons);
            request.getSession().setAttribute("novels",novels);
            //进行判断密码是否正确
            if (password.equals(pwd)){
                toPage = "applicationMain.jsp";
            }else {
                toPage= "login2.jsp";
            }
        }
        return toPage;
    }

    /**
     * 注册
     * @param request
     * @return
     */
    @RequestMapping("toRegister")
    public String registerOneReader(HttpServletRequest request,Reader reader){
        System.out.println(reader.getReaderName());
        System.out.println(reader.getReaderPassword());
        //验证用户名是否已经存在
        String username=reader.getReaderName();
        Reader  reader1=iReaderService.selectOneReader(username);
        if (reader1!=null){
             //这里应该返回提示信息
             return  "login2.jsp";
         }else {
             iReaderService.insertOneReader(reader);
         }
        return "login2.jsp";
    }


    /**
     * 注销
     * @param request
     * @return
     */
    @RequestMapping("toLogout")
    public String loginOneReader(HttpServletRequest request){
        return null;
    }

    @RequestMapping("administrators")
    public String administrators(HttpServletRequest request){
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        System.out.println("跳转管理员页面成功");
        String[] administratorsName={"zsw","ch","xu"};
        String[] administratorsPwd={"123","123","123"};
        String toPage="";
        for (int i = 0; i <administratorsName.length ; i++) {
            if (username.equals(administratorsName[i])&&password.equals(administratorsPwd[i])){
                toPage="jsp/manager/manegePlatform.jsp";
            }else{
                toPage="jsp/manager/manegePlatform.jsp";
            }
        }
        return  toPage;
    }

}
