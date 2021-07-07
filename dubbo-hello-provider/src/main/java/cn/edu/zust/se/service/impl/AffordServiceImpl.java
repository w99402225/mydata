package cn.edu.zust.se.service.impl;

import cn.edu.zust.se.dao.AffordDao;
import cn.edu.zust.se.dao.CartDao;
import cn.edu.zust.se.dto.Afford;
import cn.edu.zust.se.dto.Store;
import cn.edu.zust.se.entity.TAfford;
import cn.edu.zust.se.entity.TCart;
import cn.edu.zust.se.entity.TStore;
import cn.edu.zust.se.service.AffordService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service(version = "${hello.service.version}",application = "${dubbo.application.id}")
public class AffordServiceImpl implements AffordService {
    @Autowired
    private AffordDao affordDao;
    @Autowired
    private CartDao cartDao;

    public List<Afford> findAffordByUserid(int userid) {
        return e2d(affordDao.findByUser_id(userid));
    }
    public void addAfford(int cartid) {
        TCart cart = cartDao.findById(cartid);
        TAfford afford = new TAfford();
        afford.setAmount(cart.getAmount());
        afford.setUser_id(cart.getUser_id());
        afford.setGoods_id(cart.getGoods_id());
        double price = cart.getAmount() * cart.getGoods_id().getPrice();
        afford.setPrice(price);
        afford.setAddress(cart.getUser_id().getAddress());
        Date date = new Date();
        afford.setBuytime(date);
        affordDao.save(afford);
        cartDao.deleteCartById(cartid);
    }

    public List<Afford> findByStoreidAndState(int storeid, int state) {
        return e2d(affordDao.findByStoreidAndState(storeid, state));
    }

    public void updatestate(int state, int affordid) {
        affordDao.updatestate(state, affordid);
    }

    private List<Afford> e2d(List<TAfford> tAffords) {
        List<Afford> affords=new ArrayList<>();
        if(tAffords!=null&& tAffords.size()>0){
            for(TAfford tAfford : tAffords){
                affords.add(e2d(tAfford));
            }
        }
        return affords;
    }

    private Afford e2d(TAfford tAfford) {
        if(tAfford==null)
            return null;
        Afford afford=new Afford();
        BeanUtils.copyProperties(tAfford,afford);
        afford.setGoodsid(tAfford.getGoods_id().getId());
        afford.setUserid(tAfford.getUser_id().getId());
        return afford;
    }
    private TAfford d2e(Afford afford) {
        if(afford==null)
            return null;
        TAfford tAfford=new TAfford();
        BeanUtils.copyProperties(afford,tAfford);
        return tAfford;
    }
}
