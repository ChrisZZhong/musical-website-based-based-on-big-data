package com.test.music.domain.po;

import java.util.List;

public class Singer {
	private int id;
	private String name;
	private String picture;
	private String intro;
	private String sale;
	private List<String> musics;

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

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getSale() {
		return sale;
	}

	public void setSale(String sale) {
		this.sale = sale;
	}

	public List<String> getMusics() {
		return musics;
	}

	public void setMusics(List<String> musics) {
		this.musics = musics;
	}

	@Override
	public String toString() {
		return "Singer [id=" + id + ", name=" + name + ", picture=" + picture + ", intro=" + intro + ", sale=" + sale
				+ "]";
	}

	public Singer(String name, String picture, String intro, String sale, List<String> musics) {
		super();
		this.name = name;
		this.picture = picture;
		this.intro = intro;
		this.sale = sale;
		this.musics = musics;
	}

	public Singer() {
		super();
	}

}
