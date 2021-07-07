package cn.edu.zust.se.dao;


import cn.edu.zust.se.entity.TUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface UserDao extends JpaRepository<TUser,Integer>, JpaSpecificationExecutor<TUser> {
    TUser findByUsernameAndPassword(String username, String password);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "update user set password=?1 where id=?2")
    int updatepassword(String password, int id);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "update user set address=?1 where id=?2")
    int updateaddress(String address, int id);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "update user set type=?1 where id=?2")
    int updateusertype(String type, int id);

    TUser findById(int id);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,value = "delete from user where id =?")
    void deleteByIdAfter(int id);
}