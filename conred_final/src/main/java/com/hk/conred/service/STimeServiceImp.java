package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.ISTimeDao;
import com.hk.conred.dtos.STimeDto;

@Service
public class STimeServiceImp implements ISTimeService{

	@Autowired
	private ISTimeDao STimeDaoImp;
	
//	@Override
//	public boolean insertStime(STimeDto stimedto) {
//		return STimeDaoImp.insertStime(stimedto);
//	}

	@Override
	public boolean updateStime(STimeDto stimedto) {
		return false;
	}

	@Override
	public List<STimeDto> selectStime(int store_seq){
		
		return STimeDaoImp.selectStime(store_seq);
	}

}
