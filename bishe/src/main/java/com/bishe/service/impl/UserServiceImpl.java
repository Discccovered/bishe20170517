package com.bishe.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bishe.dao.UserDao;
import com.bishe.model.basemodel.BaseUser;
import com.bishe.service.UserService;
import com.bishe.util.PageObject;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;
	
	public int insertUser(BaseUser user) {
		return userDao.insertUser(user);
	}

	public int updateUser(BaseUser user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

	public List<BaseUser> getUserList(PageObject pageObject) {
		// TODO Auto-generated method stub
		return null;
	}

	public BaseUser getUserById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteUserById(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public BaseUser findUser(BaseUser user) {
		return userDao.findUser(user);
	}

	@Override
	public List<BaseUser> getOnlineMember() {
		return userDao.getOnlineMember();
	}

	@Override
	public BaseUser getUserByName(BaseUser user) {
		return userDao.getUserByName(user);
	}

}
