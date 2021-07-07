package cn.edu.zust.se.service;

import cn.edu.zust.se.dto.Goods;
import cn.edu.zust.se.dto.Store;

import java.util.List;

public interface GoodsService {
    List<Goods> allgoods();
    List<Goods> findgoodsbyStore(Store store);
    List<Goods> findGoodsByStoreid(int storeid);
    void addgoods(Goods goods);
    Goods findgoodsbyid(int id);
    List<Goods> findgoodsByStoreidall(int storeid);
    void updategoods(String goodsname,String goodsdesc,Double goodsprice,int goodsid);
    void updategoodsstate(int state,int goodsid);
}
