package cn.edu.zust.se.service.impl;

import cn.edu.zust.se.dao.GoodsDao;
import cn.edu.zust.se.dto.Goods;
import cn.edu.zust.se.dto.Store;
import cn.edu.zust.se.entity.TGoods;
import cn.edu.zust.se.service.GoodsService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

@Service(version = "${hello.service.version}",application = "${dubbo.application.id}")
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDao goodsDao;

    public void addgoods(Goods goods) {
        goodsDao.save(d2e(goods));
    }

    @Override
    public Goods findgoodsbyid(int id) {
        return e2d(goodsDao.findById(id));
    }

    public List<Goods> findgoodsByStoreidall(int storeid) {
        return e2d(goodsDao.findByStoreidall(storeid));
    }

    @Override
    public void updategoods(String goodsname, String goodsdesc, Double goodsprice, int goodsid) {
        goodsDao.updategoods(goodsname, goodsdesc, goodsprice, goodsid);
    }

    @Override
    public void updategoodsstate(int state, int goodsid) {
        goodsDao.updategoodsstate(state, goodsid);
    }

    public List<Goods> allgoods() {
        return e2d(goodsDao.findallgoods());
    }
    public List<Goods> findgoodsbyStore(Store store) {
        return null;
    }
    public List<Goods> findGoodsByStoreid(int storeid) {
        return e2d(goodsDao.findByStoreid(storeid));
    }

    private List<Goods> e2d(List<TGoods> tGoods) {
        List<Goods> goods=new ArrayList<>();
        if(tGoods!=null&& tGoods.size()>0){
            for(TGoods tGoods1 : tGoods){
                goods.add(e2d(tGoods1));
            }
        }
        return goods;
    }

    private Goods e2d(TGoods tGoods) {
        if(tGoods==null)
            return null;
        Goods goods=new Goods();
        BeanUtils.copyProperties(tGoods,goods);
        goods.setStoreid(tGoods.getStore().getId());
        return goods;
    }

    private List<TGoods> d2e(List<Goods> goods) {
        List<TGoods> tgoods=new ArrayList<>();
        if(goods!=null&& goods.size()>0){
            for(Goods goods1 : goods){
                tgoods.add(d2e(goods1));
            }
        }
        return tgoods;
    }

    private TGoods d2e(Goods cart) {
        if(cart==null)
            return null;
        TGoods tCart=new TGoods();
        BeanUtils.copyProperties(cart,tCart);
        return tCart;
    }
}
