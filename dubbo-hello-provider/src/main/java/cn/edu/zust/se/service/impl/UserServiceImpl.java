package cn.edu.zust.se.service.impl;


import cn.edu.zust.se.dao.*;
import cn.edu.zust.se.dto.Store;
import cn.edu.zust.se.dto.User;
import cn.edu.zust.se.dto.UserDto;
import cn.edu.zust.se.entity.*;

import cn.edu.zust.se.service.UserService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service(version = "${hello.service.version}",application = "${dubbo.application.id}")
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;

    public UserDto login(String username, String password) {
        return e2d(userDao.findByUsernameAndPassword(username,password));
    }

    @Override
    public UserDto finduserbyid(int id) {
        return e2d(userDao.findById(id));
    }


    public void adduser(User user) {
        userDao.save(d2e(user));
    }

    public void adduser(String username, String password) {
        User user = new User();
        user.setPassword(password);
        user.setUsername(username);
        user.setType("1");
        userDao.save(d2e(user));
    }

    public void updateuser(String password, int id) {
        userDao.updatepassword(password,id);
    }

    public void updateaddress(String address, int id) {
        userDao.updateaddress(address, id);
    }


    public List<UserDto> findallUser() {
        return e2d(userDao.findAll());
    }


    private List<UserDto> e2d(List<TUser> tusers) {
        List<UserDto> users=new ArrayList<>();
        if(tusers!=null&& tusers.size()>0){
            for(TUser tuser : tusers){
                users.add(e2d(tuser));
            }
        }
        return users;
    }
    private UserDto e2d(TUser tuser) {
        if(tuser==null)
            return null;
        UserDto user=new UserDto();
        BeanUtils.copyProperties(tuser,user);
        return user;
    }
    private TUser d2e(User user) {
        if(user==null)
            return null;
        TUser tuser=new TUser();
        BeanUtils.copyProperties(user,tuser);
        return tuser;
    }


}