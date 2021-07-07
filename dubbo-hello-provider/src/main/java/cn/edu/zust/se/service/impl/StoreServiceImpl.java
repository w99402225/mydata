package cn.edu.zust.se.service.impl;

import cn.edu.zust.se.dao.StoreDao;
import cn.edu.zust.se.dao.UserDao;
import cn.edu.zust.se.dto.Store;
import cn.edu.zust.se.entity.TStore;
import cn.edu.zust.se.entity.TUser;
import cn.edu.zust.se.service.StoreService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

@Service(version = "${hello.service.version}",application = "${dubbo.application.id}")
public class StoreServiceImpl implements StoreService {
    @Autowired
    private StoreDao storeDao;
    @Autowired
    private UserDao userDao;

    public Store findstorebyid(int storeid) {
        return e2d(storeDao.findById(storeid));
    }
    public List<Store> allstore() {
        return e2d(storeDao.findAllstore());
    }
    public void addstore(Store store) {
        storeDao.save(d2e(store));
    }

    public Store findstorebyuserid(int userid) {
        return e2d(storeDao.findByUserid(userid));
    }

    public void addusertostore(int userid, int storeid) {
        TStore store=storeDao.findById(storeid);
        if (store.getUserid() != null){
            TUser tUser = userDao.findById((int)store.getUserid());
            userDao.updateusertype("1",tUser.getId());
        }
        storeDao.updatestoreuser(userid, storeid);
        userDao.updateusertype("2",userid);
    }

    private List<Store> e2d(List<TStore> tStores) {
        List<Store> stores=new ArrayList<>();
        if(tStores!=null&& tStores.size()>0){
            for(TStore tStore : tStores){
                stores.add(e2d(tStore));
            }
        }
        return stores;
    }

    private Store e2d(TStore tStore) {
        if(tStore==null)
            return null;
        Store store=new Store();
        BeanUtils.copyProperties(tStore,store);
        return store;
    }
    private TStore d2e(Store store) {
        if(store==null)
            return null;
        TStore tStore=new TStore();
        BeanUtils.copyProperties(store,tStore);
        return tStore;
    }
}
