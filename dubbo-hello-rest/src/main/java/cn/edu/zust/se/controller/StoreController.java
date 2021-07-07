package cn.edu.zust.se.controller;

import cn.edu.zust.se.dto.Goods;
import cn.edu.zust.se.dto.Store;
import cn.edu.zust.se.service.GoodsService;
import cn.edu.zust.se.service.StoreService;
import cn.edu.zust.se.service.UserService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StoreController {
    @Reference(version = "${hello.service.version}")
    private UserService userService;
    @Reference(version = "${hello.service.version}")
    private StoreService storeService;
    @Reference(version = "${hello.service.version}")
    private GoodsService goodsService;

    @RequestMapping(value = "/store")
    public String store(){
        return "store";
    }
    @RequestMapping(value = "/storepage")
    public String storepage(HttpServletRequest request){
        List<Store>storeList=storeService.allstore();
        request.setAttribute("storelist",storeList);
        return "storepage";
    }

    @RequestMapping(value = "/storedetail/{storeid}/{spage}")
    public String storedetailpage(HttpServletRequest request,
                                        @PathVariable("storeid") int storeid,
                                        @PathVariable(value = "spage",required = false) Integer spage){
        List<Goods>goods=goodsService.findGoodsByStoreid(storeid);
        Store store=storeService.findstorebyid(storeid);
        if (spage==null){
            spage = 1;
        }
        int totalpage = goods.size()/9+1;
        int startflag = (spage-1)*9;
        int endflag = spage*9;
        request.setAttribute("store",store);
        request.setAttribute("startflag",startflag);
        request.setAttribute("endflag",endflag);
        request.setAttribute("totalpage",totalpage);
        request.setAttribute("count",spage);
        request.setAttribute("goodslist",goods);
        return "storedetail";
    }
    @RequestMapping(value = "/storedetail/{storeid}")
    public String storedetailpage(HttpServletRequest request,
                                  @PathVariable("storeid") int storeid){
        List<Goods>goods=goodsService.findGoodsByStoreid(storeid);
        Store store=storeService.findstorebyid(storeid);
        int spage = 1;
        int totalpage = goods.size()/9+1;
        int startflag = (spage-1)*9;
        int endflag = spage*9;
        request.setAttribute("store",store);
        request.setAttribute("startflag",startflag);
        request.setAttribute("endflag",endflag);
        request.setAttribute("totalpage",totalpage);
        request.setAttribute("count",spage);
        request.setAttribute("goodslist",goods);
        return "storedetail";
    }
}
