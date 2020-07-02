package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IODao;
import com.hk.conred.dtos.ODto;

@Service
public class OServiceImp implements IOService{

	@Autowired
	private IODao ODaoImp;
	
	@Override
	public boolean insertOwner(ODto dto) {
		return ODaoImp.insertOwner(dto);
	}

	@Override
	public ODto getLogin(String Owner_id, String Owner_password) {
		return ODaoImp.getLogin(Owner_id, Owner_password);
	}

	@Override
	public ODto ownerMyInfo(String owner_id) {
		return ODaoImp.ownerMyInfo(owner_id); 
	}

	@Override
	public boolean ownerUpdate(ODto dto) {
		return ODaoImp.ownerUpdate(dto);
	}

	@Override
	public boolean ownerDelete(String owner_id) {
		return ODaoImp.ownerDelete(owner_id);
	}

	@Override
	public String ownerIdCheck(String owner_id) {
		System.out.println("@@@@@@@@@@@@@서비스쪽:::"+owner_id);
		return ODaoImp.ownerIdCheck(owner_id);
	}

	@Override
	public ODto getState(String owner_id) {
		return ODaoImp.getState(owner_id);
	}

	@Override
	public List<ODto> contentNewQna(int store_seq) {
		return ODaoImp.contentNewQna(store_seq);
	}

	@Override
	public List<ODto> contentNewReply(int store_seq) {
		return ODaoImp.contentNewReply(store_seq);
	}

	@Override
	public ODto ownerMyStoreInfoId(int store_seq) {
		return ODaoImp.ownerMyStoreInfoId(store_seq);
	}

	@Override
	public ODto naver_confirm_id(String owner_id) {
		return ODaoImp.naver_confirm_id(owner_id);
	}

	

}
