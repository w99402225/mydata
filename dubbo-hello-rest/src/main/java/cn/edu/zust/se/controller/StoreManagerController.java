package cn.edu.zust.se.controller;

import cn.edu.zust.se.dto.Afford;
import cn.edu.zust.se.dto.Goods;
import cn.edu.zust.se.dto.Store;
import cn.edu.zust.se.dto.UserDto;
import cn.edu.zust.se.service.AffordService;
import cn.edu.zust.se.service.GoodsService;
import cn.edu.zust.se.service.StoreService;
import cn.edu.zust.se.service.UserService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class StoreManagerController {
    @Reference(version = "${hello.service.version}")
    private UserService userService;
    @Reference(version = "${hello.service.version}")
    private AffordService affordService;
    @Reference(version = "${hello.service.version}")
    private GoodsService goodsService;
    @Reference(version = "${hello.service.version}")
    private StoreService storeService;

    @RequestMapping("/storelogin")
    public String storegologin(){
        return "storelogin";
    }

    @RequestMapping(value = "storem/gologin")
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
        if (!userDto.getType().equals("2")){
            try {
                out = httpServletResponse.getWriter();
                out.print("<script>alert('用户类型错误');history.go(-1);</script>");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(userDto!=null){
            Store store = storeService.findstorebyuserid(userDto.getId());
            session.setAttribute("store",store);
            session.setAttribute("user",userDto);
        }

        return "redirect:/store_operation";
    }

    @RequestMapping("/store_operation")
    public String storeoperation(){
        return "store_operation";
    }

//    商家发货
    @RequestMapping(value = "/storemanage/send/{affordid}")
    public String storesend(@PathVariable("affordid") int affordid,
                           HttpServletResponse httpServletResponse){
        httpServletResponse.setContentType("text/html;charset=utf-8");
        affordService.updatestate(1,affordid);
        PrintWriter out = null;
        try {
            out = httpServletResponse.getWriter();
            out.print("<script>alert('发货成功！');window.location.href='/store_afford';</script>");
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "/store_afford";
    }

    @RequestMapping(value = "/store_afford")
    public String storeafford(HttpServletRequest request,
                           HttpServletResponse httpServletResponse){
        HttpSession session = request.getSession(true);
        Store store = (Store)session.getAttribute("store");
        List<Goods>goodslist =goodsService.findgoodsByStoreidall(store.getId());
        List<Afford> affordList=affordService.findByStoreidAndState(store.getId(),0);
        for (int i=0 ;i<affordList.size();i++){
            affordList.get(i).setUser_id(userService.finduserbyid(affordList.get(i).getUserid()));
            affordList.get(i).setGoods_id(goodsService.findgoodsbyid(affordList.get(i).getGoodsid()));
        }
        request.setAttribute("goodslist",goodslist);
        request.setAttribute("affordlist",affordList);
        return "store_afford";
    }

    @RequestMapping(value = "/store_goods_update")
    public String store_goods_update(@RequestParam(value = "goods_name")String goods_name,
                                     @RequestParam(value = "goods_gdesc")String goods_gdesc,
                                     @RequestParam(value = "goods_id")int goods_id,
                                     @RequestParam(value = "goods_price")Double goods_price
                                     ){
        goodsService.updategoods(goods_name,goods_gdesc,goods_price,goods_id);
        return "redirect:/store_afford";
    }

    @RequestMapping(value = "/store_goods_updatestate/{goodsid}")
    public String store_goods_updatestate(@PathVariable("goodsid")int goodsid){
        Goods goods = goodsService.findgoodsbyid(goodsid);
        if (goods.getState()==0){
            goodsService.updategoodsstate(1,goodsid);
        }else {
            goodsService.updategoodsstate(0,goodsid);
        }
        return "redirect:/store_afford";
    }
}
