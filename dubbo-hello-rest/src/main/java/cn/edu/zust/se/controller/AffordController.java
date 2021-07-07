package cn.edu.zust.se.controller;

import cn.edu.zust.se.dto.Afford;
import cn.edu.zust.se.dto.UserDto;
import cn.edu.zust.se.service.AffordService;
import cn.edu.zust.se.service.GoodsService;
import cn.edu.zust.se.service.StoreService;
import cn.edu.zust.se.service.UserService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class AffordController {
    @Reference(version = "${hello.service.version}")
    private UserService userService;
    @Reference(version = "${hello.service.version}")
    private AffordService affordService;
    @Reference(version = "${hello.service.version}")
    private GoodsService goodsService;
    @Reference(version = "${hello.service.version}")
    private StoreService storeService;

    @RequestMapping(value = "afford/addorder/{cartid}")
    public String addorder(@PathVariable("cartid") int cartid,
                           HttpServletResponse httpServletResponse){
        httpServletResponse.setContentType("text/html;charset=utf-8");
        affordService.addAfford(cartid);
        PrintWriter out = null;
        try {
            out = httpServletResponse.getWriter();
            out.print("<script>alert('下单成功！');window.location.href='/cart/usercart';</script>");
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "usercart";
    }

    @RequestMapping(value = "/userdetail")
    public String godetail(HttpServletRequest request,
                           HttpServletResponse httpServletResponse){
        UserDto userDto = logincheck(httpServletResponse,request);
        List<Afford> affordList=affordService.findAffordByUserid(userDto.getId());
        for (int i=0 ;i<affordList.size();i++){
            affordList.get(i).setUser_id(userDto);
            affordList.get(i).setGoods_id(goodsService.findgoodsbyid(affordList.get(i).getGoodsid()));
            int storeid = affordList.get(i).getGoods_id().getStoreid();
            affordList.get(i).getGoods_id().setStored(storeService.findstorebyid(storeid));
        }
        request.setAttribute("user",userDto);
        request.setAttribute("affordlist",affordList);
        return "userdetail";
    }

    private UserDto logincheck(HttpServletResponse httpServletResponse, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        UserDto userDto=(UserDto) session.getAttribute("user");
        httpServletResponse.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        if(userDto==null){
            try {
                out = httpServletResponse.getWriter();
                out.print("<script>alert('请在登录后操作！');history.go(-1);</script>");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return userDto;
    }
}
