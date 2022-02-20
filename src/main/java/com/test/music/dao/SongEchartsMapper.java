package com.test.music.dao;

import java.util.List;

import com.test.music.domain.po.SongEcharts;

public interface SongEchartsMapper {
List<SongEcharts> findsongdata(String songname);
}
