package cn.edu.zust.se.dao;

import cn.edu.zust.se.entity.TCart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CartDao extends JpaRepository<TCart,Integer>, JpaSpecificationExecutor<TCart> {
    @Query(nativeQuery = true,value = "select * from cart where user_id=?")
    List<TCart> findByUser_id(int user_id);

    @Query(nativeQuery = true,value = "select * from cart where id=?")
    TCart findById(int cartid);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "update cart set amount=?1 where id=?2")
    int updateamount(int amount, int cartid);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "delete from cart where id=?")
    int deleteCartById(int cartid);
}
