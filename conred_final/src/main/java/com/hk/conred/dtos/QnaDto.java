package com.hk.conred.dtos;

import java.util.Date;

public class QnaDto {

	private int qna_seq;
	private int store_seq;
	private String user_id;
	private String qna_title;
	private String qna_content;
	private String qna_answer;
	private String qna_hide;
	private String qna_read;
	private Date qna_regdate;
	private String qna_delflag;
	private int rn;
	private String store_name;
	private String store_photo_stored;
	
	private String qna_realdate;
	
	private String owner_id;
	
	public QnaDto() {
	}

	public QnaDto(int qna_seq, int store_seq, String user_id, String qna_title, String qna_content, String qna_answer,
			String qna_hide, String qna_read, Date qna_regdate, String qna_delflag, int rn, String store_name,
			String store_photo_stored, String qna_realdate, String owner_id) {
		super();
		this.qna_seq = qna_seq;
		this.store_seq = store_seq;
		this.user_id = user_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_answer = qna_answer;
		this.qna_hide = qna_hide;
		this.qna_read = qna_read;
		this.qna_regdate = qna_regdate;
		this.qna_delflag = qna_delflag;
		this.rn = rn;
		this.store_name = store_name;
		this.store_photo_stored = store_photo_stored;
		this.qna_realdate = qna_realdate;
		this.owner_id = owner_id;
	}

	public int getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}

	public String getQna_hide() {
		return qna_hide;
	}

	public void setQna_hide(String qna_hide) {
		this.qna_hide = qna_hide;
	}

	public String getQna_read() {
		return qna_read;
	}

	public void setQna_read(String qna_read) {
		this.qna_read = qna_read;
	}

	public Date getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

	public String getQna_delflag() {
		return qna_delflag;
	}

	public void setQna_delflag(String qna_delflag) {
		this.qna_delflag = qna_delflag;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_photo_stored() {
		return store_photo_stored;
	}

	public void setStore_photo_stored(String store_photo_stored) {
		this.store_photo_stored = store_photo_stored;
	}

	public String getQna_realdate() {
		return qna_realdate;
	}

	public void setQna_realdate(String qna_realdate) {
		this.qna_realdate = qna_realdate;
	}

	public String getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}

	@Override
	public String toString() {
		return "QnaDto [qna_seq=" + qna_seq + ", store_seq=" + store_seq + ", user_id=" + user_id + ", qna_title="
				+ qna_title + ", qna_content=" + qna_content + ", qna_answer=" + qna_answer + ", qna_hide=" + qna_hide
				+ ", qna_read=" + qna_read + ", qna_regdate=" + qna_regdate + ", qna_delflag=" + qna_delflag + ", rn="
				+ rn + ", store_name=" + store_name + ", store_photo_stored=" + store_photo_stored + ", qna_realdate="
				+ qna_realdate + ", owner_id=" + owner_id + "]";
	}

	

	

	

	

	

	

	
	

	
	
	

	
}
