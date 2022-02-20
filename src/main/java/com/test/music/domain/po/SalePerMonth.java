package com.test.music.domain.po;

public class SalePerMonth {
private String datetime;
private Double sellNum;
public String getDatetime() {
	return datetime;
}
public void setDatetime(String datetime) {
	this.datetime = datetime;
}
public Double getSellNum() {
	return sellNum;
}
public void setSellNum(Double sellNum) {
	this.sellNum = sellNum;
}
@Override
public String toString() {
	return "SalePerMonth [datetime=" + datetime + ", sellNum=" + sellNum + "]";
}
public SalePerMonth(String datetime, Double sellNum) {
	super();
	this.datetime = datetime;
	this.sellNum = sellNum;
}
public SalePerMonth() {
	super();
}

}
