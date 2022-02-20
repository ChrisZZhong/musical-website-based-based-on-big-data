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
import com.test.music.biz.SingerEchartsService;
import com.test.music.biz.SongEchartsService;
import com.test.music.domain.po.MyData;
import com.test.music.domain.po.SingerEcharts;
import com.test.music.domain.po.SongEcharts;

@Controller
public class SingerEchartsController {
	@Autowired
	private SingerEchartsService singerEchartsService;
	@RequestMapping(value = "/getsingerdata",method = RequestMethod.GET)
	
	public @ResponseBody String getdata(String singername) throws Exception, IOException
	{
		List<MyData> myDatas=this.fillDatas(singername);
		//	System.out.println(myData.getData());
		Gson gson = new Gson();  
		String str = gson.toJson(myDatas);
		return str;
	}
	public List<SingerEcharts> relevel(List<SingerEcharts> singers)
	{
		singers.sort((i1,i2)->{
			return i1.getDate().compareTo(i2.getDate());

		});
		return singers;
	}
	private List<MyData> fillDatas(String songname) throws NumberFormatException, IOException {

		List<MyData> myDatas = new ArrayList<MyData>();
		List<SingerEcharts> singerEcharts=singerEchartsService.findsingerdata(songname);
		List<SingerEcharts> singers=relevel(singerEcharts);
		for(SingerEcharts singerecharts:singers)
		{
			try {
				MyData myData=new MyData();
				myData.setCategories(singerecharts.getDate());
				myData.setData(Double.valueOf(singerecharts.getSale().substring(0,singerecharts.getSale().length()-1)));
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
