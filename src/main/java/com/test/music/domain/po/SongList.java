package com.test.music.domain.po;

import java.util.List;

public class SongList {
	private int id;
	private String name;
	private String intro;
	private String username;
	private String date;
	private String type;
	private List<List_musics> music_of_SongList;

	@Override
	public String toString() {
		return "SongList [id=" + id + ", name=" + name + ", intro=" + intro + ", username=" + username + ", date="
				+ date + ", type=" + type + ", music_of_SongList=" + music_of_SongList.size() + "]";
	}

	public SongList() {
		super();
	}

	public SongList(String name, String intro, String username, String date, String type,
			List<List_musics> music_of_SongList) {
		super();
		this.name = name;
		this.intro = intro;
		this.username = username;
		this.date = date;
		this.type = type;
		this.music_of_SongList = music_of_SongList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<List_musics> getMusic_of_SongList() {
		return music_of_SongList;
	}

	public void setMusic_of_SongList(List<List_musics> music_of_SongList) {
		this.music_of_SongList = music_of_SongList;
	}

}
