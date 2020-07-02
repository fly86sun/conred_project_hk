package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IQnaDao;
import com.hk.conred.daos.QnaDaoImp;
import com.hk.conred.dtos.QnaDto;

@Service
public class QnaServiceImp implements IQnaService{

	@Autowired
	private IQnaDao QnaDaoImp;
	
	@Override
	public List<QnaDto> qnaList(String user_id,String pnum) {
		return QnaDaoImp.qnaList(user_id,pnum);
	}
	
	@Override
	public List<QnaDto> qnaListStore(int store_seq,int pnum) {
		return QnaDaoImp.qnaListStore(store_seq,pnum);
	}

	@Override
	public QnaDto qnaAvg(int store_seq) {
		return QnaDaoImp.qnaAvg(store_seq);
	}

	@Override
	public boolean userQnaDelete(int qna_seq) {
		return QnaDaoImp.userQnaDelete(qna_seq);
	}

	@Override
	public boolean userQnaUpdate(int qna_seq, String qna_title, String qna_content, String qna_hide) {
		return QnaDaoImp.userQnaUpdate(qna_seq, qna_title, qna_content, qna_hide);
	}


	@Override
	public QnaDto getUserQna(int qna_seq) {
		return QnaDaoImp.getUserQna(qna_seq);
	}

	@Override
	public boolean insertQna(int store_seq,String user_id,String qna_title,String qna_content,String qna_hide) {
		return QnaDaoImp.insertQna(store_seq, user_id, qna_title, qna_content, qna_hide);
	}

	@Override
	public List<QnaDto> userQnaPhoto(String user_id){ 
		return QnaDaoImp.userQnaPhoto(user_id);
	}

	@Override
	public QnaDto ownerQnaIdChk(int store_seq) {
		return QnaDaoImp.ownerQnaIdChk(store_seq);
	}

	@Override
	public boolean ownerQnaAnswer(int qna_seq, String qna_answer) {
		return QnaDaoImp.ownerQnaAnswer(qna_seq, qna_answer);
	}

	@Override
	public boolean ownerQnaRead(int store_seq) {
		return QnaDaoImp.ownerQnaRead(store_seq);
	} 
	

}
