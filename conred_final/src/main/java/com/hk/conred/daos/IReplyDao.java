package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.ReplyDto;

public interface IReplyDao {

	//1.리뷰목록 - 사용자: 자기가 쓴 모든 리뷰
	public List<ReplyDto> replyList(String user_id,String pnum);

	//2.리뷰목록 - 점주: 특정 매장에 달린 모든 리뷰
	public List<ReplyDto> replyListStore(int store_seq);
	
	//3.리뷰평균목록 - 점주: 특정 매장에 달린 모든 리뷰에 대한 평균들, 달린리뷰, 달은 답변 갯수
	public ReplyDto replyAvgStore(int store_seq);
	
	//2.리뷰목록 - 점주: 특정 매장에 달린 모든 리뷰 -- 상세 
	public List<ReplyDto> replyListStoreDetail(int store_seq,int pnum);
	
	//5.리뷰삭제 - 사용자:자기가쓴 모든리뷰 개별삭제
	public boolean userReplyDelete(String user_id,int reply_seq);
	
	//6.리뷰 등록 - 사용자:매장에대한 평점과 리뷰글 등록
	public boolean userInsertReview(String user_id,int store_seq,String reply_content,double reply_service,double reply_clean,double reply_price);

	//7.사용자 리뷰 매장사진
	public List<ReplyDto> userReplyStorePhoto(String user_id);
	
	//8. 리뷰 모달창 매장명
	public ReplyDto modalStoreName(int store_seq);
	
	//9.매장 등록시 리뷰 등록 - 관리자:매장에대한 첫 평점과 리뷰글 등록(최초 평점값 넣기-몇가지오류방지됨)
	public boolean adminInsertReview(int store_seq);
	
	//10.점주 리뷰 답변
	public boolean ownerAnswer(int reply_seq,String reply_answer);
	
	//11.점주리뷰읽음처리
	public boolean ownerReplyRead(int store_seq);
}
