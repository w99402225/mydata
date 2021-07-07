package cn.edu.zust.se.controller;

import cn.edu.zust.se.dto.Goods;
import cn.edu.zust.se.dto.UserDto;
import cn.edu.zust.se.service.GoodsService;
import cn.edu.zust.se.service.StoreService;
import cn.edu.zust.se.service.UserService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class GoodsController {
    @Reference(version = "${hello.service.version}")
    private UserService userService;
    @Reference(version = "${hello.service.version}")
    private GoodsService goodsService;
    @Reference(version = "${hello.service.version}")
    private StoreService storeService;

    @RequestMapping(value = "/home")
    public String home(){
        return "home";
    }
    @RequestMapping(value = "/product")
    public String product(){
        return "product";
    }
    @RequestMapping(value = "/goods/{page}")
    public String goods(HttpServletRequest request,
                        @PathVariable(value = "page",required = false) Integer spage){
        List<Goods>goods=goodsService.allgoods();
        for (int i=0 ;i<goods.size();i++){
            goods.get(i).setStored(storeService.findstorebyid(goods.get(i).getStoreid()));
        }
        if (spage==null){
            spage = 1;
        }
        int totalpage = goods.size()/9+1;
        HttpSession session = request.getSession(true);
        UserDto userDto = (UserDto) session.getAttribute("user");
        if(userDto == null){
            request.setAttribute("logincheck",0);
            userDto = new UserDto();
            userDto.setUsername("null");
        }else {
            request.setAttribute("logincheck",1);
        }
        int startflag = (spage-1)*9;
        int endflag = spage*9;
        request.setAttribute("startflag",startflag);
        request.setAttribute("endflag",endflag);
        request.setAttribute("totalpage",totalpage);
        request.setAttribute("count",spage);
        request.setAttribute("user",userDto);
        request.setAttribute("goodslist",goods);
        return "goods";
    }


}
