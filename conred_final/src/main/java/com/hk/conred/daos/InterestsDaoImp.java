package com.hk.conred.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.InterestsDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;

@Repository
public class InterestsDaoImp implements IInterestsDao{

	
	private String nameSpace="com.hk.conred.Interests.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertInterests(String[] category_code,String user_id) {
		int count=0;
		InterestsDto dto=new InterestsDto();
		dto.setCategory_codes(category_code);
		dto.setUser_id(user_id);
		
//		Map<String , String[]>map=new HashMap<>();
//		map.put("lists", category_code);
//		map.put("user_id", user_id);
		count=sqlSession.insert(nameSpace+"insertInterests", dto);
		return count>0?true:false;
	}
	
	@Override
	public List<SDto> user_interests_recommended(String user_id, String paging) {
			
		Map<String, String> map=new HashMap<String, String>();
			map.put("user_id", user_id);	
			map.put("paging", paging);
			//결과 타입 리턴
		return sqlSession.selectList(nameSpace+"user_interests_recommended", map);
			
	}

	@Override
	public InterestsDto userInterests(String user_id) {
		InterestsDto dto=sqlSession.selectOne(nameSpace+"userInterests", user_id);
		return dto;
	}
	
	@Override
	public int user_interests_count(String user_id) { 
		return sqlSession.selectOne(nameSpace+"user_interests_count", user_id);
		
	}
	
	
	
} 
