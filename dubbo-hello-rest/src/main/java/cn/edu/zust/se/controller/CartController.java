package cn.edu.zust.se.controller;

import cn.edu.zust.se.dto.Cart;
import cn.edu.zust.se.dto.UserDto;
import cn.edu.zust.se.service.CartService;
import cn.edu.zust.se.service.GoodsService;
import cn.edu.zust.se.service.UserService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@RequestMapping(value = "/cart")
@Controller
public class CartController {
    @Reference(version = "${hello.service.version}")
    private UserService userService;
    @Reference(version = "${hello.service.version}")
    private CartService cartService;
    @Reference(version = "${hello.service.version}")
    private GoodsService goodsService;


    @RequestMapping(value = "/mycart")
    public String cart(){
        return "cart";
    }

    @RequestMapping(value = "/usercart")
    public String usercart(HttpServletRequest request,
                           HttpServletResponse httpServletResponse){
        UserDto userDto=logincheck(httpServletResponse, request);
        List<Cart> cartList=cartService.findcartbyuserID(userDto.getId());
        for (int i=0 ;i<cartList.size();i++){
            cartList.get(i).setUser_id(userDto);
            cartList.get(i).setGoods_id(goodsService.findgoodsbyid(cartList.get(i).getGoodsid()));
        }
        request.setAttribute("cartlist",cartList);
        return "usercart";
    }

    @RequestMapping(value = "/addcart")
    public String addcart(@RequestParam("goods_id")String sgoods_id,
                          @RequestParam("amount")String samount,
                          HttpServletRequest request,
                          HttpServletResponse httpServletResponse){
        UserDto userDto = logincheck(httpServletResponse, request);
        PrintWriter out = null;
        int user_id=userDto.getId();
        int goods_id=Integer.parseInt(sgoods_id);
        int amount=Integer.parseInt(samount);
        cartService.addcart(user_id,goods_id,amount);
        try {
            out = httpServletResponse.getWriter();
            out.print("<script>alert('加入购物车成功！');history.go(-1);</script>");
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/goods/1";
    }
    @RequestMapping(value = "updatecart")
    public String updatecart(@RequestParam("ucartid")int cartid,
                             @RequestParam(value = "camount",required = false)String samount,
                             HttpServletResponse httpServletResponse){
        httpServletResponse.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        int amount = Integer.parseInt(samount);
        if(amount<=0){
            try {
                out = httpServletResponse.getWriter();
                out.print("<script>alert('数量必须为0以上的整数！');history.go(-1);</script>");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        cartService.updateCartAmount(cartid,amount);
        try {
            out = httpServletResponse.getWriter();
            out.print("<script>alert('修改成功！');history.go(-1);</script>");
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "usercart";
    }

    @RequestMapping(value = "delcart/{cartid}")
    public String delcart(@PathVariable("cartid") int cartid,
                          HttpServletResponse httpServletResponse){
        httpServletResponse.setContentType("text/html;charset=utf-8");
        cartService.delCartbyId(cartid);
        PrintWriter out = null;
        try {
            out = httpServletResponse.getWriter();
            out.print("<script>alert('删除成功！');window.location.href='/cart/usercart';</script>");
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "usercart";
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
