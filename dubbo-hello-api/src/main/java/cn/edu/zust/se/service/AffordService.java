package cn.edu.zust.se.service;

import cn.edu.zust.se.dto.Afford;

import java.util.List;

public interface AffordService {
    List<Afford> findAffordByUserid(int userid);
    void addAfford(int cartid);
    List<Afford> findByStoreidAndState(int storeid,int state);
    void updatestate(int state,int affordid);
}
