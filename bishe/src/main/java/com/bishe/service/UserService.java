package com.bishe.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.bishe.model.basemodel.BaseUser;
import com.bishe.util.PageObject;

public interface UserService {
	public static final Log logger = LogFactory.getLog(UserService.class);
	int insertUser(BaseUser user);
	int updateUser(BaseUser user);
	List<BaseUser> getUserList(PageObject pageObject);
	BaseUser getUserById(String id);
	int deleteUserById(String id);
	BaseUser findUser(BaseUser user);
	
}
