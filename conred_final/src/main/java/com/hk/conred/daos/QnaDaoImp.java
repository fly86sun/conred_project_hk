package com.hk.conred.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.QnaDto;

@Repository
public class QnaDaoImp implements IQnaDao{

	private String nameSpace="com.hk.conred.Qna.";
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	public List<QnaDto> qnaList(String user_id,String pnum) { 
		Map<String, String> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("pnum", pnum);
		List<QnaDto> list=sqlSession.selectList(nameSpace+"qnaList", map);
		return list;
	}

	@Override
	public List<QnaDto> qnaListStore(int store_seq,int pnum) {
		Map<String, Integer> map=new HashMap<>();
		map.put("store_seq", store_seq);
		map.put("pnum", pnum);
		List<QnaDto> list=sqlSession.selectList(nameSpace+"qnaListStore",map);
		return list;
	}

	@Override
	public QnaDto qnaAvg(int store_seq) {
		QnaDto dto=sqlSession.selectOne(nameSpace+"qnaAvg", store_seq);
		return dto;
	}

	@Override
	public boolean userQnaDelete(int qna_seq) {
		int count=0;
		count=sqlSession.update(nameSpace+"userQnaDelete", qna_seq);
		return count>0?true:false;
	}

	@Override
	public boolean userQnaUpdate(int qna_seq,String qna_title, String qna_content, String qna_hide) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("qna_seq", qna_seq);
		map.put("qna_title", qna_title);
		map.put("qna_content", qna_content);
		map.put("qna_hide", qna_hide);
		count=sqlSession.update(nameSpace+"userQnaUpdate", map);
		return count>0?true:false;
	}

	@Override
	public QnaDto getUserQna(int qna_seq) {
		QnaDto dto=null;
		dto=sqlSession.selectOne(nameSpace+"getUserQna", qna_seq);
		return dto;
	}

	@Override
	public boolean insertQna(int store_seq,String user_id,String qna_title,String qna_content,String qna_hide) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("store_seq", store_seq);
		map.put("user_id", user_id);
		map.put("qna_title", qna_title);
		map.put("qna_content", qna_content);
		map.put("qna_hide", qna_hide);
		count=sqlSession.insert(nameSpace+"insertQna", map);
		return count>0?true:false;
	}

	@Override
	public List<QnaDto> userQnaPhoto(String user_id) {
		List<QnaDto> list=sqlSession.selectList(nameSpace+"userQnaPhoto", user_id);
		return list;
	}

	@Override
	public QnaDto ownerQnaIdChk(int store_seq) {
		QnaDto dto=sqlSession.selectOne(nameSpace+"ownerQnaIdChk", store_seq);
		return dto;
	}

	@Override
	public boolean ownerQnaAnswer(int qna_seq, String qna_answer) {
		int count=0;
		Map<String, Object> map=new HashMap<>();
		map.put("qna_seq", qna_seq);
		map.put("qna_answer", qna_answer);
		count=sqlSession.update(nameSpace+"ownerQnaAnswer", map);
		return count>0?true:false; 
	}

	@Override
	public boolean ownerQnaRead(int store_seq) {
		int count=0;
		count=sqlSession.update(nameSpace+"ownerQnaRead", store_seq);
		return count>0?true:false;
	}
}
