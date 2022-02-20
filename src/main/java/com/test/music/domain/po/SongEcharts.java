package com.test.music.domain.po;

public class SongEcharts {
private String datetime;
private String sellNum;
public String getDatetime() {
	return datetime;
}
public void setDatetime(String datetime) {
	this.datetime = datetime;
}
public String getSellNum() {
	return sellNum;
}
public void setSellNum(String sellNum) {
	this.sellNum = sellNum;
}
@Override
public String toString() {
	return "SongEcharts [datetime=" + datetime + ", sellNum=" + sellNum + "]";
}
public SongEcharts(String datetime, String sellNum) {
	super();
	this.datetime = datetime;
	this.sellNum = sellNum;
}
public SongEcharts() {
	super();
}

}
