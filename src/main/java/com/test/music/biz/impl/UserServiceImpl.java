package com.test.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.music.biz.UserService;
import com.test.music.dao.UserMapper;
import com.test.music.domain.po.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper usermapper;

	public boolean checkUsername(String checkName) {
		User l = usermapper.getUserByName(checkName);
		if (l == null)
			return true;
		else
			return false;
	}

	@Override
	public int register(User user) {
		// TODO Auto-generated method stub
		return usermapper.register(user);
	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return usermapper.getUserById(id);
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		usermapper.updateUser(user);

	}

	@Override
	public boolean login(String user, String pswd) {
		User tmp = usermapper.getUserByName(user);
		if (tmp == null)
			return false;
		if (pswd.equals(tmp.getPassword()))
			return true;
		else
			return false;

	}

	@Override
	public User getUserByName(String name) {
		// TODO Auto-generated method stub
		return usermapper.getUserByName(name);
	}

	@Override
	public boolean addcollect(int userid, int musicid) {
		// TODO Auto-generated method stub
		return usermapper.addcollect(userid, musicid);
	}

	@Override
	public boolean uncollect(int userid, int musicid) {
		// TODO Auto-generated method stub
		return usermapper.uncollect(userid, musicid);
	}

	@Override
	public Integer iscollect(int userid, int musicid) {
		// TODO Auto-generated method stub
		return usermapper.iscollect(userid, musicid);
	}

	@Override
	public List<Integer> getcollectbyuserid(int userid) {
		// TODO Auto-generated method stub
		return usermapper.getcollectbyuserid(userid);
	}

}
