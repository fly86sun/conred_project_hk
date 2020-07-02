package com.hk.conred.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;

@Repository
public class SDaoImp implements ISDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.hk.conred.S.";
	
	//매장등록1(사업자등록정보)
	@Override
	public boolean insertStoreCertify(SDto sdto) {    
		int count= 0;
		count=sqlSession.insert(namespace+"insertStoreCertify",sdto);
		return count>0?true:false;
	}
	//매장등록2(매장정보)
	@Override
	public boolean insertStoreInfo(SDto sdto) {
		int count= 0;
		count=sqlSession.update(namespace+"updateStoreInfo",sdto);
		return count>0?true:false;
	}
	//매장등록3(메뉴/서비스정보)
	@Override
	public boolean updateStoreMenu(SDto sdto) {
		int count= 0;
		count=sqlSession.update(namespace+"updateStoreMenu",sdto);
		return count>0?true:false;
	}
	
	//매장수정1(사업자등록정보)
	@Override
	public boolean updateStoreCertify(SDto sdto) {
		int count= 0;
		count=sqlSession.update(namespace+"updateStoreCertify",sdto);
		return count>0?true:false;
	}
	
	
	//Store Seq 가져오기
	@Override
	public SDto selectStoreSeq(ODto odto) {
		return sqlSession.selectOne(namespace+"selectStoreSeq",odto);
	}
	//일반 매장 상세정보들 가져오기
	@Override
	public SDto selectStoreDetail(int store_seq) {
		return sqlSession.selectOne(namespace+"selectStoreDetail",store_seq);
	}
	
	//매장 리스트+각 리스트의 상세정보 가져오기
	@Override
	public List<SDto> StoreSeqList(String[] store_seq_list) {
		List<SDto> list= new ArrayList<>();
		SDto sdto;
		for (int i = 0; i < store_seq_list.length; i++) {
			sdto=new SDto();
			sdto.setStore_seq(Integer.parseInt(store_seq_list[i]));
			list.add(sdto);
			System.out.println("각 리스트:"+list);
			sdto=null;
		}
		System.out.println("최종 리스트:"+list);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		list=sqlSession.selectList(namespace+"StoreSeqList",store_seq_list);
		return list;
	}

	
	
	
	
	
}
