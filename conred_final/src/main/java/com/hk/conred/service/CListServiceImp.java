package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.ICListDao;
import com.hk.conred.dtos.CListDto;

@Service
public class CListServiceImp implements ICListService{

	@Autowired
	private ICListDao CListDaoImp;
	
	@Override
	public List<CListDto> selectCList(int store_seq) {
		return CListDaoImp.selectCList(store_seq);
	}

}
