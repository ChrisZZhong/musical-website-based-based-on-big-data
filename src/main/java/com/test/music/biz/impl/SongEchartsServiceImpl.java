package com.test.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.music.biz.SongEchartsService;
import com.test.music.dao.SongEchartsMapper;
import com.test.music.domain.po.SongEcharts;

@Service
public class SongEchartsServiceImpl implements SongEchartsService {
@Autowired
private SongEchartsMapper songechartsmapper;
	@Override
	public List<SongEcharts> findsongdata(String songname) {
		// TODO Auto-generated method stub
		List<SongEcharts> songs=songechartsmapper.findsongdata(songname);
		return songs;
			}

}
