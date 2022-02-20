package com.test.music.domain.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class User implements Serializable {
	Integer id;
	String username;
	String password;
	String gender;
	String phonenumber;
	String intro;
	int level;
	public Integer getId() {
		return id;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public User(String username, String password, String gender, String phonenumber, String intro) {
		super();
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.phonenumber = phonenumber;
		this.intro = intro;
	}
	public User(Integer id, String username, String password, String gender, String phonenumber, String intro,int level) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.phonenumber = phonenumber;
		this.intro = intro;
		this.level=level;
		
	}
	
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", gender=" + gender
				+ ", phonenumber=" + phonenumber + ", intro=" + intro + "]";
	}
	
	

}
