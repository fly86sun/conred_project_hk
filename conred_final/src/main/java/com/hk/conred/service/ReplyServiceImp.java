package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IReplyDao;
import com.hk.conred.dtos.ReplyDto;

@Service
public class ReplyServiceImp implements IReplyService{
	
	@Autowired
	private IReplyDao replyDao;
	
	@Override
	public List<ReplyDto> replyList(String user_id,String pnum) {
		return replyDao.replyList(user_id,pnum);
	}

	@Override
	public List<ReplyDto> replyListStore(int store_seq) {
		return replyDao.replyListStore(store_seq);
	}

	@Override
	public ReplyDto replyAvgStore(int store_seq) {
		return replyDao.replyAvgStore(store_seq);
	}

	@Override
	public List<ReplyDto> replyListStoreDetail(int store_seq, int pnum) {
		return replyDao.replyListStoreDetail(store_seq, pnum);
	}

	@Override
	public boolean userReplyDelete(String user_id, int reply_seq) {
		return replyDao.userReplyDelete(user_id, reply_seq);
	}

	@Override
	public boolean userInsertReview(String user_id,int store_seq,String reply_content,double reply_service,double reply_clean,double reply_price) {
		return replyDao.userInsertReview(user_id, store_seq,reply_content, reply_service, reply_clean, reply_price); 
	}

	@Override
	public List<ReplyDto> userReplyStorePhoto(String user_id) {
		return replyDao.userReplyStorePhoto(user_id);
	}

	@Override
	public ReplyDto modalStoreName(int store_seq) {
		return replyDao.modalStoreName(store_seq);
	}

	@Override
	public boolean adminInsertReview(int store_seq) {
		return replyDao.adminInsertReview(store_seq);
	}

	@Override
	public boolean ownerAnswer(int reply_seq, String reply_answer) {
		return replyDao.ownerAnswer(reply_seq, reply_answer);
	}

	@Override
	public boolean ownerReplyRead(int store_seq) {
		return replyDao.ownerReplyRead(store_seq);
	}

}
