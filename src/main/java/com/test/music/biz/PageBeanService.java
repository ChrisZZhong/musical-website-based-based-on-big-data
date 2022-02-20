package com.test.music.biz;

import com.test.music.domain.po.Music;
import com.test.music.domain.po.PageBean;
import com.test.music.domain.po.Singer;

public interface PageBeanService {
	public PageBean<Singer> getTop100(int pc);

	public PageBean<Music> getAllTop100(int pc);
}
