package cn.edu.zust.se.service;

import cn.edu.zust.se.dto.Store;

import java.util.List;

public interface StoreService {
    Store findstorebyid(int storeid);
    List<Store> allstore();
    void addstore(Store store);
    Store findstorebyuserid(int userid);
    void addusertostore(int userid,int storeid);
}
