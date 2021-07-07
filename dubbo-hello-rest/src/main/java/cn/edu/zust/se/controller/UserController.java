package cn.edu.zust.se.controller;

import cn.edu.zust.se.dto.Afford;
import cn.edu.zust.se.dto.Store;
import cn.edu.zust.se.dto.User;
import cn.edu.zust.se.dto.UserDto;
import cn.edu.zust.se.service.AffordService;
import cn.edu.zust.se.service.StoreService;
import cn.edu.zust.se.service.UserService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Reference(version = "${hello.service.version}")
    private UserService userService;

    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }
    @RequestMapping(value = "/regist")
    public String zhuce(){
        return "regist";
    }
    @RequestMapping(value = "/userpage")
    public String gouser(){
        return "user";
    }
//    修改密码
    @RequestMapping(value = "/updateuser")
    public String updateuser(@RequestParam("id")String userid,
                             @RequestParam(value = "password",required = false)String password,
                             @RequestParam(value = "repassword",required = false)String repassword,
                             HttpServletResponse httpServletResponse){
        httpServletResponse.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        if(password==null||password.length()==0){
            try {
                out = httpServletResponse.getWriter();
                out.print("<script>alert('密码不能为空');history.go(-1);</script>");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(!password.equals(repassword)){
            try {
                out = httpServletResponse.getWriter();
                out.print("<script>alert('两次输入密码不相同！');history.go(-1);</script>");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        int id = Integer.parseInt(userid);
        userService.updateuser(password,id);
        try {
            out = httpServletResponse.getWriter();
            out.print("<script>alert('修改成功！');history.go(-1);</script>");
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "user";
    }

    //    修改地址
    @RequestMapping(value = "/updateaddress")
    public String updateaddress(@RequestParam("id")String userid,
                             @RequestParam(value = "address",required = false)String address,
                             HttpServletResponse httpServletResponse){
        httpServletResponse.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        int id = Integer.parseInt(userid);
        userService.updateaddress(address,id);
        try {
            out = httpServletResponse.getWriter();
            out.print("<script>alert('修改成功！');history.go(-1);</script>");
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "user";
    }

    //    注销
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession(true);
        session.removeAttribute("user");
        return "redirect:/user/login";
    }
    //    注册
    @RequestMapping(value = "/registsubmit")
    public String adduser(@RequestParam("username")String username,
                          @RequestParam("password")String password,
                          @RequestParam("repassword")String repassword,
                          HttpServletResponse httpServletResponse){
        httpServletResponse.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        if(username==null||username.length()==0||password==null||password.length()==0){
            try {
                out = httpServletResponse.getWriter();
                out.print("<script>alert('用户名和密码不能为空');history.go(-1);</script>");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(!password.equals(repassword)){
            try {
                out = httpServletResponse.getWriter();
                out.print("<script>alert('两次输入密码不相同！');history.go(-1);</script>");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setType("1");
        userService.adduser(user);
        try {
            out = httpServletResponse.getWriter();
            out.print("<script>alert('注册成功！');location.href='login';</script>");
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "login";
    }

    //    登录
    @RequestMapping(value = "/gologin")
    public String gologin(@RequestParam(value = "username",required = false)String username,
                          @RequestParam(value = "password",required = false)String password,
                          @RequestParam(value = "usercode",required = false)String usercode,
                          @RequestParam(value = "code")String code,
                          HttpServletRequest request,
                          HttpServletResponse httpServletResponse){
        httpServletResponse.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        HttpSession session = request.getSession(true);
        if(!usercode.equals(code)){
            try {
                out = httpServletResponse.getWriter();
                out.print("<script>alert('验证码错误');history.go(-1);</script>");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(username==null||username.length()==0||password==null||password.length()==0){
            try {
                out = httpServletResponse.getWriter();
                out.print("<script>alert('用户名和密码不能为空');history.go(-1);</script>");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        UserDto userDto = userService.login(username,password);
        if(userDto==null){
            try {
                out = httpServletResponse.getWriter();
                out.print("<script>alert('用户名或密码错误');history.go(-1);</script>");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(userDto!=null){
            session.setAttribute("user",userDto);
        }
        if (userDto.getType().equals("0")){

            return "redirect:/manager_operation";
        }
//        try {
//            httpServletResponse.sendRedirect("home");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        return "redirect:/home";
    }

}
