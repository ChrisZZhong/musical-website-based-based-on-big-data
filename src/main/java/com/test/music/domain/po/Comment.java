package com.test.music.domain.po;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class Comment implements Serializable {
	Integer id;
	int user_id;
	int music_id;
	Timestamp date;
	String context;
	String username;

	public Comment(Integer id, int user_id, int music_id, Timestamp date, String context, String username) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.music_id = music_id;
		this.date = date;
		this.context = context;
		this.username = username;
	}

	public Comment(int user_id, int music_id, String context, String username) {
		super();
		this.user_id = user_id;
		this.music_id = music_id;
		this.context = context;
		this.username = username;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getMusic_id() {
		return music_id;
	}

	public void setMusic_id(int music_id) {
		this.music_id = music_id;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", user_id=" + user_id + ", music_id=" + music_id + ", date=" + date + ", context="
				+ context + ", username=" + username + "]";
	}

}
