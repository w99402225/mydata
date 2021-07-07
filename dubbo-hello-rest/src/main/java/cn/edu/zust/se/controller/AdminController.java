package cn.edu.zust.se.controller;

import cn.edu.zust.se.dto.Afford;
import cn.edu.zust.se.dto.UserDto;
import cn.edu.zust.se.service.*;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController {
    @Reference(version = "${hello.service.version}")
    private AdminService adminService;
    @Reference(version = "${hello.service.version}")
    private AffordService affordService;
    @Reference(version = "${hello.service.version}")
    private UserService userService;
    @Reference(version = "${hello.service.version}")
    private GoodsService goodsService;
    @Reference(version = "${hello.service.version}")
    private StoreService storeService;

    @RequestMapping("/manager_operation")
    public String adminoperation(){
        return "manager_operation";
    }


    @RequestMapping("/manager")
    public String manager(HttpServletRequest request){
        request.setAttribute("storelist",storeService.allstore() );
        request.setAttribute("userlist",userService.findallUser());
        return "manager";
    }

    @RequestMapping("/manager_userafford")
    public String manager_userafford(HttpServletRequest request,
                                     @RequestParam(value = "userid")int userid){
        request.setAttribute("storelist",storeService.allstore() );
        List<Afford> affordList=affordService.findAffordByUserid(userid);
        for (int i=0 ;i<affordList.size();i++){
            affordList.get(i).setUser_id(userService.finduserbyid(userid));
            affordList.get(i).setGoods_id(goodsService.findgoodsbyid(affordList.get(i).getGoodsid()));
            int storeid = affordList.get(i).getGoods_id().getStoreid();
            affordList.get(i).getGoods_id().setStored(storeService.findstorebyid(storeid));
        }
        request.setAttribute("userlist",userService.findallUser());
        request.setAttribute("user_name",userService.finduserbyid(userid).getUsername());
        request.setAttribute("affordlist",affordList);
        return "manager1";
    }

    @RequestMapping("/deleteUser/{userid}")
    public String deleteUser(@PathVariable(value = "userid")int userid){
        adminService.deleteUserById(userid);
        return "redirect:/manager";
    }

    @RequestMapping("/addusertostore")
    public String addstore(@RequestParam(value = "userid") int userid,
                           @RequestParam(value = "storeid") int storeid){
        storeService.addusertostore(userid, storeid);
        return "redirect:/manager";
    }
}
