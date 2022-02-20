package com.test.music.biz;

import java.util.List;

import com.test.music.domain.po.SingerEcharts;

public interface SingerEchartsService {
	List<SingerEcharts> findsingerdata(String name);
}
