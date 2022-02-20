package com.test.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.music.biz.SingerEchartsService;
import com.test.music.dao.SingerEchartsMapper;
import com.test.music.domain.po.SingerEcharts;

@Service
public class SingerEchartsServiceImpl implements SingerEchartsService {

	@Autowired
	private SingerEchartsMapper singerechartsmapper;
	@Override
	public List<SingerEcharts> findsingerdata(String name) {
		// TODO Auto-generated method stub
		return singerechartsmapper.findsingerdata(name);
	}

}
