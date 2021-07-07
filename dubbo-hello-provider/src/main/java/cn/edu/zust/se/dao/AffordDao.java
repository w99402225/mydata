package cn.edu.zust.se.dao;

import cn.edu.zust.se.entity.TAfford;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AffordDao extends JpaRepository<TAfford,Integer>, JpaSpecificationExecutor<TAfford> {
    @Query(nativeQuery = true,value = "select * from afford where user_id=?")
    List<TAfford> findByUser_id(int userid);
    @Query(nativeQuery = true,value = "select * from afford,goods where goods.store_id=?1 and afford.state=?2 and goods.id=afford.goods_id")
    List<TAfford> findByStoreidAndState(int storeid,int state);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "update afford set state=?1 where id=?2")
    int updatestate(int state, int id);
}
