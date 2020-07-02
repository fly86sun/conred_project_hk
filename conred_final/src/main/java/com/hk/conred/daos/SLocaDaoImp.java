package com.hk.conred.daos;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;

@Repository
public class SLocaDaoImp implements ISLocaDao{
	
	private String namespace="com.hk.conred.SLoca.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public boolean insertSLoca(SDto sdto, SLocaDto slocadto) {
		int count=0;
		slocadto.setStore_seq(sdto.getStore_seq());
		count=sqlSession.insert(namespace+"insertSLoca",slocadto);
		return count>0?true:false;
	}

	@Override
	public boolean updateSLoca(SDto sdto, SLocaDto slocadto) {
		int count=0;
		slocadto.setStore_seq(sdto.getStore_seq());
		count=sqlSession.update(namespace+"updateSLoca",slocadto);
		return count>0?true:false;
	}
	
	
	
	
}
