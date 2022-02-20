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
import com.test.music.biz.SongEchartsService;
import com.test.music.domain.po.MyData;
import com.test.music.domain.po.SongEcharts;

@Controller
public class SongEchartController {
	@Autowired
	private SongEchartsService songEchartsService;

	@RequestMapping(value = "/getdata", method = RequestMethod.GET)

	public @ResponseBody String getdata(String songname) throws Exception, IOException {
		String songname1 = songname.trim();
		List<MyData> myDatas = this.fillDatas(songname1);
		// System.out.println(myData.getData());
		Gson gson = new Gson();
		String str = gson.toJson(myDatas);
		return str;
	}

	public List<SongEcharts> relevel(List<SongEcharts> songs) {
		songs.sort((i1, i2) -> {
			return i1.getDatetime().compareTo(i2.getDatetime());

		});
		return songs;
	}

	public List<SongEcharts> quitrepeat(List<SongEcharts> songs) {
		List<SongEcharts> songEcharts = new ArrayList<SongEcharts>();
		for (int i = 1; i < songs.size(); i++) {
			try {
				if (songs.get(i).getDatetime() == songs.get(i - 1).getDatetime()) {
					String datetime = songs.get(i).getDatetime();
					Double number = Double
							.valueOf(songs.get(i).getSellNum().substring(0, songs.get(i).getSellNum().length() - 1))
							+ Double.valueOf(songs.get(i - 1).getSellNum().substring(0,
									songs.get(i - 1).getSellNum().length() - 1));
					String sellNum = number + "k";
					SongEcharts songEcharts2 = new SongEcharts(datetime, sellNum);
					songEcharts.add(songEcharts2);
				} else {
					SongEcharts song1 = new SongEcharts(songs.get(i).getDatetime(), songs.get(i).getSellNum());
					songEcharts.add(song1);
				}
				;
			} catch (Exception e) {
				continue;
				// TODO: handle exception
			}

		}
		return songEcharts;
	}

	private List<MyData> fillDatas(String songname) throws NumberFormatException, IOException {

		List<MyData> myDatas = new ArrayList<MyData>();
		List<SongEcharts> songEcharts = songEchartsService.findsongdata(songname);
		List<SongEcharts> songs = quitrepeat(relevel(songEcharts));
		for (SongEcharts songecharts : songs) {
			try {
				MyData myData = new MyData();
				myData.setCategories(songecharts.getDatetime());
				myData.setData(
						Double.valueOf(songecharts.getSellNum().substring(0, songecharts.getSellNum().length() - 1)));
				myDatas.add(myData);
			} catch (Exception e) {
				continue;
				// TODO: handle exception
			}
		}
		return myDatas;
	}
}
