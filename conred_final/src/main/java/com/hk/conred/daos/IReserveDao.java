package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.ReserveDto;

public interface IReserveDao {
	
	//숙박 예약
	public boolean insertReserveS(String user_id,int menu_seq,int store_seq,String reserve_price,String reserve_sdate,String reserve_edate);
	
	//당일 예약
	public boolean insertReserveT(String user_id,int menu_seq,int store_seq,String reserve_time,String reserve_price,String reserve_sdate);
	
	//예약목록조회
	public List<ReserveDto> reserveList(String user_id,String pnum);
	
	//상세조회 -->로 들어가야 결제버튼 있음
	public ReserveDto getReserve(int reserve_seq);
	
	//메뉴->날짜 선택시 매진된 시간 클릭못하게
	public List<ReserveDto> reserveMax(int store_seq,int menu_seq,String reserve_sdate);
	
	//숙박 예약 출력
	public List<ReserveDto> stayReserve(int store_seq,int menu_seq);
	
	//사용자 예약취소
	public boolean userReserveCancel(int reserve_seq);
	
	//사용자 예약메뉴 매장사진
	public List<ReserveDto> userReservePhoto(String user_id);
	
	//사용자 결제후 상태 S로 업데이트
	public boolean reserveSuccess(int reserve_seq);
	
	//유저가 결제한 매장에대한 리뷰 1회기능
	public List<ReserveDto> userOnceReview(int store_seq,String user_id);
	
	//해당매장 리뷰남기면 상태N
	public boolean userReviewSuccess(String user_id,int store_seq);
	
	//결제완료후 정보뿌리기
	public ReserveDto reserveSuccessInfo(int reserve_seq);
	
	//점주 자기매장 예약목록
	public List<ReserveDto> ownerStoreReserve(int store_seq,int pnum);
	
	//점주 자기매장 결제목록
	public List<ReserveDto> ownerStoreReserveSuccess(int store_seq,int pnum);
	
}
