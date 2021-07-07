package cn.edu.zust.se.service.impl;

import cn.edu.zust.se.dao.CartDao;
import cn.edu.zust.se.dao.GoodsDao;
import cn.edu.zust.se.dao.UserDao;
import cn.edu.zust.se.dto.Cart;
import cn.edu.zust.se.entity.TCart;
import cn.edu.zust.se.service.CartService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

@Service(version = "${hello.service.version}",application = "${dubbo.application.id}")
public class CartServiceImpl implements CartService {
    @Autowired
    private CartDao cartDao;
    @Autowired
    private GoodsDao goodsDao;
    @Autowired
    private UserDao userDao;

    public List<Cart> findcartbyuserID(int userid) {
        return e2d(cartDao.findByUser_id(userid));
    }
    public Cart findCartById(int cartid) {
        return e2d(cartDao.findById(cartid));
    }
    public void updateCartAmount(int cartid, int amount) {
        cartDao.updateamount(amount,cartid);
    }
    public void delCartbyId(int cartid) {
        cartDao.deleteCartById(cartid);
    }
    public void addcart(Cart cart) {
        cartDao.save(d2e(cart));
    }
    public void addcart(int user_id, int goods_id, int amount) {
        TCart cart = new TCart();
        cart.setGoods_id(goodsDao.findById(goods_id));
        cart.setUser_id(userDao.findById(user_id));
        cart.setAmount(amount);
        cartDao.save(cart);
    }

    private List<Cart> e2d(List<TCart> tCarts) {
        List<Cart> carts=new ArrayList<>();
        if(tCarts!=null&& tCarts.size()>0){
            for(TCart tCart : tCarts){
                carts.add(e2d(tCart));
            }
        }
        return carts;
    }

    private Cart e2d(TCart tCart) {
        if(tCart==null)
            return null;
        Cart cart=new Cart();
        BeanUtils.copyProperties(tCart,cart);
        cart.setGoodsid(tCart.getGoods_id().getId());
        cart.setUserid(tCart.getUser_id().getId());
        return cart;
    }
    private TCart d2e(Cart cart) {
        if(cart==null)
            return null;
        TCart tCart=new TCart();
        BeanUtils.copyProperties(cart,tCart);
        return tCart;
    }
}
