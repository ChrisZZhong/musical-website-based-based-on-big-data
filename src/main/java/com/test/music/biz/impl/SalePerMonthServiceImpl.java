package com.test.music.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.music.biz.SalePerMonthService;
import com.test.music.dao.SalePerMonthMapper;
import com.test.music.domain.po.SalePerMonth;
@Service
public class SalePerMonthServiceImpl implements SalePerMonthService {

	@Autowired
	SalePerMonthMapper salepermonthmapper;
	@Override
	public List<SalePerMonth> findsaledata() {
		// TODO Auto-generated method stub
		return salepermonthmapper.findsaledata();
	}

}
