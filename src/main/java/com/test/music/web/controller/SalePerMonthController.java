package com.test.music.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.test.music.biz.SalePerMonthService;
import com.test.music.domain.po.MyData;
import com.test.music.domain.po.SalePerMonth;

@Controller
public class SalePerMonthController {
@Autowired
private SalePerMonthService salePerMonthService;
	@RequestMapping(value = "/getsaledata",method = RequestMethod.GET)
	
	public @ResponseBody String getsaledata() throws Exception, IOException
	{
		List<MyData> myDatas=this.fillDatas();
		//	System.out.println(myData.getData());
		Gson gson = new Gson();  
		String str = gson.toJson(myDatas);
		return str;
	}
	private List<MyData> fillDatas() throws NumberFormatException, IOException {

		List<MyData> myDatas = new ArrayList<MyData>();
		List<SalePerMonth> sales=salePerMonthService.findsaledata();
		for(SalePerMonth sale:sales)
		{
			try {
				MyData myData=new MyData();
				myData.setCategories(sale.getDatetime());
				myData.setData(sale.getSellNum());
				myDatas.add(myData);
			}
			catch (Exception e) {
				continue;
			// TODO: handle exception
			}
		}
		return myDatas;
	}

}
