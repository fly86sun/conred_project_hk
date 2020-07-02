package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.ODto;

public interface IODao {

	//1. 점주 회원가입
	public boolean insertOwner(ODto dto);
	//2. 점주 로그인
	public ODto getLogin(String Owner_id,String Owner_password);
	//3. 나의정보조회 -- 점주
	public ODto ownerMyInfo(String owner_id);
	//4. 내정보수정 --점주
	public boolean ownerUpdate(ODto dto);
	//5. 점주 탈퇴
	public boolean ownerDelete(String owner_id);
	//6. 점주 아이디중복체크
	public String ownerIdCheck(String owner_id);
	//7.점주 매장통계출력
	public ODto getState(String owner_id);
	//8.점주 문의 읽음여부
	public List<ODto> contentNewQna(int store_seq);
	//9.점주 리뷰 읽음여부
	public List<ODto> contentNewReply(int store_seq);
	//10.마이스토어인포에 점주아이디
	public ODto ownerMyStoreInfoId(int store_seq);
	
	//11.네이버 아이디 로그인을 위한 유저 아이디 중복 조회
	public ODto naver_confirm_id(String owner_id);
	
}
