package com.hk.conred.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.ReplyDto;

@Repository
public class ReplyDaoImp implements IReplyDao{

	private String nameSpace="com.hk.conred.Reply.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReplyDto> replyList(String user_id,String pnum) {
		Map<String, String> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("pnum", pnum);
		List<ReplyDto> list=sqlSession.selectList(nameSpace+"replyList", map);
		return list;
	}

	@Override
	public List<ReplyDto> replyListStore(int store_seq) {
		List<ReplyDto> list = sqlSession.selectList(nameSpace+"replyListStore",store_seq);
		return list;
	}
	
	@Override
	public ReplyDto replyAvgStore(int store_seq) {
		return sqlSession.selectOne(nameSpace+"replyAvgStore",store_seq);
	}

	@Override
	public List<ReplyDto> replyListStoreDetail(int store_seq,int pnum) {
		Map<String, Integer> map=new HashMap<>();
		map.put("store_seq", store_seq);
		map.put("pnum", pnum);
		List<ReplyDto> list=sqlSession.selectList(nameSpace+"replyListStoreDetail", map);
		return list;
	}

	@Override
	public boolean userReplyDelete(String user_id, int reply_seq) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("reply_seq", reply_seq);
		count=sqlSession.update(nameSpace+"userReplyDelete", map);
		return count>0?true:false;
	}

	@Override
	public boolean userInsertReview(String user_id,int store_seq,String reply_content,double reply_service,double reply_clean,double reply_price) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("store_seq", store_seq);
		map.put("reply_content", reply_content);
		map.put("reply_service", reply_service);
		map.put("reply_clean", reply_clean);
		map.put("reply_price", reply_price); 
		count=sqlSession.insert(nameSpace+"userInsertReview", map);
		return count>0?true:false;
	}

	@Override
	public List<ReplyDto> userReplyStorePhoto(String user_id) {
		List<ReplyDto> list=sqlSession.selectList(nameSpace+"userReplyStorePhoto", user_id);
		return list;
	}

	@Override
	public ReplyDto modalStoreName(int store_seq) {
		ReplyDto store_name=sqlSession.selectOne(nameSpace+"modalStoreName", store_seq);
		return store_name;
	}

	@Override
	public boolean adminInsertReview(int store_seq) {
		int count= 0;
		count =sqlSession.insert(nameSpace+"adminInsertReview",store_seq);
		return count>0?true:false;
	}

	@Override
	public boolean ownerAnswer(int reply_seq, String reply_answer) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("reply_seq", reply_seq);
		map.put("reply_answer", reply_answer);
		count=sqlSession.update(nameSpace+"ownerAnswer", map);
		return count>0?true:false;
	}

	@Override
	public boolean ownerReplyRead(int store_seq) {
		int count=0;
		count=sqlSession.update(nameSpace+"ownerReplyRead", store_seq);
		return count>0?true:false;
	}
	
}
