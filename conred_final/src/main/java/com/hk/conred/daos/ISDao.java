package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;

public interface ISDao {
	//매장등록1(사업자등록정보)
	public boolean insertStoreCertify(SDto sdto);
	//매장등록2(매장정보)
	public boolean insertStoreInfo(SDto sdto);
	//매장등록3(메뉴/서비스정보)
	public boolean updateStoreMenu(SDto sdto);
	
//	//매장수정1(사업자등록정보)
	public boolean updateStoreCertify(SDto sdto);
//	//매장수정2(매장정보)
//	public boolean updateStoreInfo(SDto sdto);
//	//매장수정3(메뉴/서비스정보)
//	public boolean updateStoreMenu(SDto sdto);
//	
	
	//로그인중인 점주의 store_Seq 가져오기
	public SDto selectStoreSeq(ODto odto);
	//일반 매장 상세정보들 가져오기
	public SDto selectStoreDetail(int store_seq);
	//매장 리스트+각 리스트의 상세정보 가져오기
	public List<SDto> StoreSeqList(String[] store_seq_list);
	
	
	
	
}
