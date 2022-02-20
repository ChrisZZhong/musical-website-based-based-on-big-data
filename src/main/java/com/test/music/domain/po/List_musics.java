package com.test.music.domain.po;

public class List_musics {
	private int id;
	private int list_id;
	private String musicname;
	private String time;
	private String singer;
	private String album;

	@Override
	public String toString() {
		return "List_musics [id=" + id + ", list_id=" + list_id + ", musicname=" + musicname + ", time=" + time
				+ ", singer=" + singer + ", album=" + album + "]";
	}

	public List_musics() {
		super();
	}

	public List_musics(int list_id, String musicname, String time, String singer, String album) {
		super();
		this.list_id = list_id;
		this.musicname = musicname;
		this.time = time;
		this.singer = singer;
		this.album = album;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getList_id() {
		return list_id;
	}

	public void setList_id(int list_id) {
		this.list_id = list_id;
	}

	public String getMusicname() {
		return musicname;
	}

	public void setMusicname(String musicname) {
		this.musicname = musicname;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSinger() {
		return singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

}
