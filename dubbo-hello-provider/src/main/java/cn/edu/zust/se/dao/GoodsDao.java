package cn.edu.zust.se.dao;

import cn.edu.zust.se.entity.TGoods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface GoodsDao extends JpaRepository<TGoods,Integer>, JpaSpecificationExecutor<TGoods> {
    @Query(nativeQuery = true,value = "select * from goods where store_id=? and state=1")
    List<TGoods> findByStoreid(int store_id);

    @Query(nativeQuery = true,value = "select * from goods where state=1")
    List<TGoods> findallgoods();

    @Query(nativeQuery = true,value = "select * from goods where store_id=?")
    List<TGoods> findByStoreidall(int store_id);


    @Query(nativeQuery = true,value = "select * from goods where id=?")
    TGoods findById(int goods_id);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "update goods set gname=?1 , gdesc=?2 , price=?3 where id=?4")
    void updategoods(String goodsname, String goodsdesc, Double goodsprice, int goodsid);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "update goods set state=?1 where id=?2")
    void updategoodsstate(int state, int goodsid);
}
