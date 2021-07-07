package cn.edu.zust.se.service.impl;

import cn.edu.zust.se.dao.UserDao;
import cn.edu.zust.se.service.AdminService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service(version = "${hello.service.version}",application = "${dubbo.application.id}")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private UserDao userDao;
    @Override
    public void deleteUserById(int id) {
        userDao.deleteByIdAfter(id);
    }
}
