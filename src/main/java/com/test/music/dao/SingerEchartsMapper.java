package com.test.music.dao;

import java.util.List;

import com.test.music.domain.po.SingerEcharts;

public interface SingerEchartsMapper {
List<SingerEcharts> findsingerdata(String name);
}
