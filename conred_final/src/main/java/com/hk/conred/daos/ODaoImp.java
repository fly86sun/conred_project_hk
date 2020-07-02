package com.hk.conred.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.ODto;

@Repository
public class ODaoImp implements IODao {
	
	private String nameSpace="com.hk.conred.O.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertOwner(ODto dto) {
		int count=0;
		count=sqlSession.insert(nameSpace+"insertOwner", dto);
		return count>0?true:false;
	}

	@Override
	public ODto getLogin(String Owner_id, String Owner_password) {
		ODto dto=null;
		Map<String, String> map=new HashMap<>();
		map.put("owner_id", Owner_id);
		map.put("owner_password", Owner_password);
		dto=sqlSession.selectOne(nameSpace+"getLogin", map);
		return dto;
	}

	@Override
	public ODto ownerMyInfo(String owner_id) {
		ODto dto=null;
		dto=sqlSession.selectOne(nameSpace+"ownerMyInfo", owner_id);
		return dto;
	}

	@Override
	public boolean ownerUpdate(ODto dto) {
		int count=0;
		count=sqlSession.update(nameSpace+"ownerUpdate", dto);
		return count>0?true:false;
	}

	@Override
	public boolean ownerDelete(String owner_id) {
		int count=0;
		count=sqlSession.update(nameSpace+"ownerDelete", owner_id);
		return count>0?true:false; 
	}

	@Override
	public String ownerIdCheck(String owner_id) {
		String resultId=null;
		resultId=sqlSession.selectOne(nameSpace+"ownerIdCheck", owner_id);
		return resultId;
	}

	@Override
	public ODto getState(String owner_id) {
		ODto dto=sqlSession.selectOne(nameSpace+"getState", owner_id);
		return dto;
	}

	@Override
	public List<ODto> contentNewQna(int store_seq) {
		List<ODto> list=sqlSession.selectList(nameSpace+"contentNewQna", store_seq);
		return list;
	}

	@Override
	public List<ODto> contentNewReply(int store_seq) {
		List<ODto> list=sqlSession.selectList(nameSpace+"contentNewReply", store_seq);
		return list;
	}

	@Override
	public ODto ownerMyStoreInfoId(int store_seq) {
		ODto dto=sqlSession.selectOne(nameSpace+"ownerMyStoreInfoId", store_seq);
		return dto;
	}

	@Override
	public ODto naver_confirm_id(String owner_id) {
		ODto dto=sqlSession.selectOne(nameSpace+"naver_confirm_id", owner_id);
		return dto;
	}
	

	
	
	
	
	
}
