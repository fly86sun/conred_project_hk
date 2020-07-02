package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.ILikeDao;
import com.hk.conred.dtos.LikeDto;

@Service
public class LikeServiceImp implements ILikeService{

	@Autowired
	private ILikeDao likeDaoImp;
	
	@Override
	public List<LikeDto> likeList(String user_id,int pnum) {
		return likeDaoImp.likeList(user_id,pnum);
	}

	@Override
	public boolean userLikeDelete(int like_list_seq) {
		return likeDaoImp.userLikeDelete(like_list_seq);
	}

	@Override
	public List<LikeDto> likeStoreImg(String user_id) {
		return likeDaoImp.likeStoreImg(user_id);
	}

	@Override
	public LikeDto likeStore(String user_id, int store_seq) {
		return likeDaoImp.likeStore(user_id, store_seq);
	}

	@Override
	public boolean insertLike(String user_id, int store_seq) {
		return likeDaoImp.insertLike(user_id, store_seq);
	}

	@Override
	public boolean deleteLike(String user_id, int store_seq) {
		return likeDaoImp.deleteLike(user_id, store_seq);
	}
	
}
