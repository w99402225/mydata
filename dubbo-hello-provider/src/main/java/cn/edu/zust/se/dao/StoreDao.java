package cn.edu.zust.se.dao;

import cn.edu.zust.se.entity.TStore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface StoreDao extends JpaRepository<TStore,Integer>, JpaSpecificationExecutor<TStore> {
    TStore findById(int storeid);

    @Query(nativeQuery = true,value = "select * from store")
    List<TStore> findAllstore();

    TStore findByUserid(int userid);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "update store set user_id=?1 where id=?2")
    int updatestoreuser(int userid, int storeid);
}
