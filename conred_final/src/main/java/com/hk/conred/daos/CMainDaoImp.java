package com.hk.conred.daos;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.CMainDto;

@Repository
public class CMainDaoImp implements ICMainDao {
	
	private String namespace="com.hk.conred.CMain.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertCMain(CMainDto cmaindto) {
		int count=0;
		count=sqlSession.insert(namespace+"insertCMain",cmaindto);
		return count>0?true:false;
	}

	@Override
	public CMainDto selectCMain(int store_seq) {
		return sqlSession.selectOne(namespace+"selectCMain",store_seq);
	}

	@Override
	public boolean updateCMain(CMainDto cmaindto) {
		int count =0;
		count=sqlSession.update(namespace+"updateCMain",cmaindto);
		return count>0?true:false;
	}

}
