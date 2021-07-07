package cn.edu.zust.se.service;


import cn.edu.zust.se.dto.*;

import java.util.List;

public interface UserService {
    void adduser(User user);
    void adduser(String username,String password);
    void updateuser(String password,int id);
    void updateaddress(String address,int id);
    List<UserDto> findallUser();
    UserDto login(String username,String password);
    UserDto finduserbyid(int id);
}