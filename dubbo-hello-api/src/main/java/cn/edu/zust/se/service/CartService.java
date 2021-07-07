package cn.edu.zust.se.service;

import cn.edu.zust.se.dto.Cart;

import java.util.List;

public interface CartService {
    List<Cart> findcartbyuserID(int userid);
    Cart findCartById(int cartid);
    void updateCartAmount(int cartid,int amount);
    void delCartbyId(int cartid);
    void addcart(Cart cart);
    void addcart(int user_id,int goods_id,int amount);
}
