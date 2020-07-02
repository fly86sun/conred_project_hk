package com.hk.conred.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.CListDto;
import com.hk.conred.dtos.SDto;

@Repository
public class CListDaoImp implements ICListDao{

	private String namespace="com.hk.conred.CList.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertCList(SDto sdto, String[] clist) {
		int count =0;//갔다와서 interest랑 내가했던 foreach 문 보고 clist도 넣기
		List<CListDto> list = new ArrayList<>();
		CListDto dto;
		for (int i = 0; i < clist.length; i++) {
			dto = new CListDto();
			dto.setStore_seq(sdto.getStore_seq());
			dto.setCategory_code_small(clist[i]);
			list.add(dto);
			dto=null;
		} 
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		count=sqlSession.insert(namespace+"insertCList",map);
		return count>0?true:false;
	}

	@Override
	public List<CListDto> selectCList(int store_seq) {
		List<CListDto> list =sqlSession.selectList(namespace+"selectCList",store_seq);
		return list;
	}

	@Override
	public boolean deleteCList(SDto sdto) {
		int count =0;
		count = sqlSession.delete(namespace+"deleteCList",sdto);
		return count>0?true:false;
	}

}
