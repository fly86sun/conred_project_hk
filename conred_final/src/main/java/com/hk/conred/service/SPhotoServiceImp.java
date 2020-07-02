package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.ISPhotoDao;
import com.hk.conred.dtos.SPhotoDto;

@Service
public class SPhotoServiceImp implements ISPhotoService{
	
	@Autowired
	private ISPhotoDao sPhotoDaoImp;
	
	@Override
	public List<SPhotoDto> selectSPhoto(int store_seq) {
		return sPhotoDaoImp.selectSPhoto(store_seq);
	}

}
