package com.test.music.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.test.music.domain.po.User;

@Repository
public interface UserMapper {
	public int register(@Param("user") User user);

	public User getUserById(@Param("id") int id);

	public void updateUser(@Param("user") User user);

	public User login(@Param("user") String user, @Param("pswd") String pswd);

	public User getUserByName(@Param("name") String name);

	// 以下为收藏功能
	public boolean addcollect(@Param("userid") int userid, @Param("musicid") int musicid);

	public boolean uncollect(@Param("userid") int userid, @Param("musicid") int musicid);

	public Integer iscollect(@Param("userid") int userid, @Param("musicid") int musicid);

	public List<Integer> getcollectbyuserid(@Param("userid") int userid);
}
