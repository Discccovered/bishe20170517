package com.bishe.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.bishe.model.basemodel.BaseUser;
import com.bishe.util.PageObject;

@Repository
public interface UserDao {
	public static final Log logger = LogFactory.getLog(UserDao.class);
	
	@Insert("insert into user (userid, username, password,  usertype, credit, status,  balance, file) values (#{userid}, #{username}, #{password},  #{usertype}, #{credit}, #{status},  #{balance}, #{file})")
	int insertUser(BaseUser user);
	
	@Update("update user    set userid = #{userid},      username = #{username},      password = #{password},      usertype = #{usertype},      credit = #{credit},      status = #{status},      balance = #{balance},      file = #{file} where userid=#{userid}")
	int updateUser(BaseUser user);
	
	@Select("select userid,username,usertype,credit,status,password,balance,file,(case usertype when '1' then '养生专家' when '0' then '管理员' else '养生爱好者' end) as usertypename,(case status when '3' then '冻结' else '正常' end) as statusname from user  order by credit desc limit #{rownum} offset #{skip}")
	List<BaseUser> getUserList(PageObject pageObject);
	
	@Select("select * from user where userid=#{id}")
	BaseUser getUserById(String id);
	
	@Delete("delete from user where userid=#{id}")
	int deleteUserById(String id);
	
	@Select("select * from user where username=#{username} and password=#{password}")
	BaseUser findUser(BaseUser user);
	
	@Select("select userid,username,password,(case usertype when '1' then '养生专家' when '0' then '管理员' else '养生爱好者' end) as usertypename ,usertype ,credit,status,balance,file from user  where status='1' limit 15")
	List<BaseUser> getOnlineMember();
	
	@Select("select userid,username,password,(case usertype when '1' then '养生专家' when '0' then '管理员' else '养生爱好者' end) as usertypename ,usertype ,credit,status,balance,file from user  where username=#{username}")
	BaseUser getUserByName(BaseUser user);
	
	@Select("select count(userid) from user")
	int getRowNum();

	
	@Update("update user set status='3' where userid=#{userid}")
	int forbidUserById(String userid);
}
