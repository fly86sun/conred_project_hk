package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.LikeDto;
import com.hk.conred.dtos.UDto;

public interface ILikeService {

	//1.예약목록
	public List<LikeDto> likeList(String user_id,int pnum);
	
	//2.찜 삭제
	public boolean userLikeDelete(int like_list_seq);
	
	//찜 목록 가게 사진 출력
	public List<LikeDto> likeStoreImg(String user_id);
	
	//매장 찜버튼
	public LikeDto likeStore(String user_id,int store_seq);
	
	//유저- 매장 좋아요
	public boolean insertLike(String user_id,int store_seq);
	//유저 -매장 좋아요 취소
	public boolean deleteLike(String user_id,int store_seq);
}
