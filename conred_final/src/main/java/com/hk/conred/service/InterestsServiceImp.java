package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IInterestsDao;
import com.hk.conred.daos.InterestsDaoImp;
import com.hk.conred.dtos.InterestsDto;
import com.hk.conred.dtos.SDto;

@Service
public class InterestsServiceImp implements IInterestsService{

	@Autowired
	private IInterestsDao InterestsDaoImp;
	
	@Override
	public boolean insertInterests(String []category_code,String user_id) {
		return InterestsDaoImp.insertInterests(category_code,user_id);
	}
	@Override
	public List<SDto> user_interests_recommended(String user_id, String paging) {
		// TODO Auto-generated method stub
		return InterestsDaoImp.user_interests_recommended(user_id , paging);
	}
	@Override
	public InterestsDto userInterests(String user_id) {
		return InterestsDaoImp.userInterests(user_id);
	}
	
	@Override
	public int user_interests_count(String user_id){
		return InterestsDaoImp.user_interests_count(user_id);
	}
	
	
	
	
	
	
}
 