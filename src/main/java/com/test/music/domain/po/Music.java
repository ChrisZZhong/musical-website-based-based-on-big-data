package com.test.music.domain.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Music implements Serializable {

	Integer id;
	String name;
	String picture;// 图片路径
	String words;// 歌词
	Integer time;// 演唱时间，秒计
	String singers;// 歌手
	String sale;// 销量
	int daysOnChart;// 在榜时常

	public Music() {
		super();
	}

	@Override
	public String toString() {
		return "Music [id=" + id + ", name=" + name + ", picture=" + picture + ", words=" + words + ", time=" + time
				+ ", singers=" + singers + ", sale=" + sale + ", daysOnChart=" + daysOnChart + "]";
	}

	public Music(Integer id, String name, String picture, String words, Integer time, String singers) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.words = words;
		this.time = time;
		this.singers = singers;
	}

	public Music(Integer id, String name, String picture, String words, Integer time, String singers, String sale,
			int daysOnChart) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.words = words;
		this.time = time;
		this.singers = singers;
		this.sale = sale;
		this.daysOnChart = daysOnChart;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public Music(String name, String picture, String words, Integer time, String singers, String sale,
			int daysOnChart) {
		super();
		this.name = name;
		this.picture = picture;
		this.words = words;
		this.time = time;
		this.singers = singers;
		this.sale = sale;
		this.daysOnChart = daysOnChart;
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

	public String getWords() {
		return words;
	}

	public void setWords(String words) {
		this.words = words;
	}

	public Integer getTime() {
		return time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	public String getSingers() {
		return singers;
	}

	public void setSingers(String singers) {
		this.singers = singers;
	}

	public String getSale() {
		return sale;
	}

	public void setSale(String sale) {
		this.sale = sale;
	}

	public int getDaysOnChart() {
		return daysOnChart;
	}

	public void setDaysOnChart(int daysOnChart) {
		this.daysOnChart = daysOnChart;
	}

}
