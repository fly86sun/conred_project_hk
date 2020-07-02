package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IADao;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;

@Service
public class AServiceImp implements IAService{

	@Autowired
	private IADao ADaoImp;

	@Override
	public List<UDto> admin_site_userlist(String keyword) {
		// TODO Auto-generated method stub
		return ADaoImp.admin_site_userlist(keyword);
	}
	@Override
	public List<UDto> admin_blackuser_search(String blackuser) {
		// TODO Auto-generated method stub
		return ADaoImp.admin_blackuser_search(blackuser);
	}
	
	@Override
	public List<ODto> admin_site_ownerlist(String keywordowner) {
		// TODO Auto-generated method stub
		return ADaoImp.admin_site_ownerlist(keywordowner);
	}
	
	
	@Override
	public List<SDto> admin_site_storelist(String keywordstore) {
		// TODO Auto-generated method stub
		return ADaoImp.admin_site_storelist(keywordstore);
	}
	
	@Override
	public List<SDto> admin_store_state_search(String adminstate) {
		// TODO Auto-generated method stub
		return ADaoImp.admin_store_state_search(adminstate);
	}
	@Override
	public List<SDto> admin_store_state_search_n(String adminstate_n) {
		
		return ADaoImp.admin_store_state_search_n(adminstate_n);
	}
	
	@Override
	public boolean adminMulchk(String[] store_seqs) {
		return ADaoImp.adminMulchk(store_seqs);
	}
	
	@Override 
	public boolean adminMuldel(String[] store_seqs) {
		return ADaoImp.adminMuldel(store_seqs);
	}
	
	@Override
	public boolean adminMuldelOwner(String[] owner_ids) {
		return ADaoImp.adminMuldelOwner(owner_ids);
	} 
	

	@Override
	public boolean adminMuldelUser(String[] user_ids) {
		return ADaoImp.adminMuldelUser(user_ids);
	}
	
	
}