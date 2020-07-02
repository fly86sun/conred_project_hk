package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.RPhotoDto;

public interface IRPhotoDao {
	
	//사용자 매장 리뷰 사진등록
	public boolean reviewPhotoInsert(List<RPhotoDto> list);
	
	//해당 매장 리뷰사진출력
	public List<RPhotoDto> reviewPhotoList(int store_seq);
	
	//3.사용자 마이페이지 리뷰사진출력
	public List<RPhotoDto> userReplyPhoto();
}
