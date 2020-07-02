package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.ISubwayDao;
import com.hk.conred.dtos.SubwayDto;

@Service
public class SubwayServiceImp implements ISubwayService{

	@Autowired
	private ISubwayDao subwayDao;
	
	@Override
	public SubwayDto subway_search(String keyword) {
		return subwayDao.subway_search(keyword);
	}

}
