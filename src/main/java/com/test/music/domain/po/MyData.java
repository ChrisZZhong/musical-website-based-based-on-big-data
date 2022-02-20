package com.test.music.domain.po;

import java.util.List;

public class MyData {
	String categories;
	Double data;
	public String  getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public Double getData() {
		return data;
	}
	public void setData(Double data) {
		this.data = data;
	}
	public MyData(String categories, Double data) {
		super();
		this.categories = categories;
		this.data = data;
	}
	public MyData() {
		super();
	}
	@Override
	public String toString() {
		return "MyData [categories=" + categories + ", data=" + data + "]";
	}


}
