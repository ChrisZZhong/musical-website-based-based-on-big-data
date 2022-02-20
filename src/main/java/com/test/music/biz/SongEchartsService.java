package com.test.music.biz;

import java.util.List;



import com.test.music.domain.po.SongEcharts;


public interface SongEchartsService {
List<SongEcharts> findsongdata(String songname);
}
