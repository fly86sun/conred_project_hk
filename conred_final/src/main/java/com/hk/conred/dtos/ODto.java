package com.hk.conred.dtos;

import java.util.Date;

public class ODto {
	private String owner_id;
	private String owner_password;
	private String owner_name;
	private String owner_email;
	private String owner_birth;
	private String owner_sex;
	private Date owner_regdate;
	private String owner_agreement;
	private String owner_out;
	
	private int reserve_count;
	private int like_count;
	private int pay_count;
	private int reply_count;
	private int qna_count;
	private int store_seq;
	
	private String reply_read;
	private String qna_read;
	
	public ODto() {
		super();
	}

	public ODto(String owner_id, String owner_password, String owner_name, String owner_email, String owner_birth,
			String owner_sex, Date owner_regdate, String owner_agreement, String owner_out, int reserve_count,
			int like_count, int pay_count, int reply_count, int qna_count, int store_seq, String reply_read,
			String qna_read) {
		super();
		this.owner_id = owner_id;
		this.owner_password = owner_password;
		this.owner_name = owner_name;
		this.owner_email = owner_email;
		this.owner_birth = owner_birth;
		this.owner_sex = owner_sex;
		this.owner_regdate = owner_regdate;
		this.owner_agreement = owner_agreement;
		this.owner_out = owner_out;
		this.reserve_count = reserve_count;
		this.like_count = like_count;
		this.pay_count = pay_count;
		this.reply_count = reply_count;
		this.qna_count = qna_count;
		this.store_seq = store_seq;
		this.reply_read = reply_read;
		this.qna_read = qna_read;
	}

	public String getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}

	public String getOwner_password() {
		return owner_password;
	}

	public void setOwner_password(String owner_password) {
		this.owner_password = owner_password;
	}

	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}

	public String getOwner_email() {
		return owner_email;
	}

	public void setOwner_email(String owner_email) {
		this.owner_email = owner_email;
	}

	public String getOwner_birth() {
		return owner_birth;
	}

	public void setOwner_birth(String owner_birth) {
		this.owner_birth = owner_birth;
	}

	public String getOwner_sex() {
		return owner_sex;
	}

	public void setOwner_sex(String owner_sex) {
		this.owner_sex = owner_sex;
	}

	public Date getOwner_regdate() {
		return owner_regdate;
	}

	public void setOwner_regdate(Date owner_regdate) {
		this.owner_regdate = owner_regdate;
	}

	public String getOwner_agreement() {
		return owner_agreement;
	}

	public void setOwner_agreement(String owner_agreement) {
		this.owner_agreement = owner_agreement;
	}

	public String getOwner_out() {
		return owner_out;
	}

	public void setOwner_out(String owner_out) {
		this.owner_out = owner_out;
	}

	public int getReserve_count() {
		return reserve_count;
	}

	public void setReserve_count(int reserve_count) {
		this.reserve_count = reserve_count;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public int getPay_count() {
		return pay_count;
	}

	public void setPay_count(int pay_count) {
		this.pay_count = pay_count;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public int getQna_count() {
		return qna_count;
	}

	public void setQna_count(int qna_count) {
		this.qna_count = qna_count;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getReply_read() {
		return reply_read;
	}

	public void setReply_read(String reply_read) {
		this.reply_read = reply_read;
	}

	public String getQna_read() {
		return qna_read;
	}

	public void setQna_read(String qna_read) {
		this.qna_read = qna_read;
	}

	@Override
	public String toString() {
		return "ODto [owner_id=" + owner_id + ", owner_password=" + owner_password + ", owner_name=" + owner_name
				+ ", owner_email=" + owner_email + ", owner_birth=" + owner_birth + ", owner_sex=" + owner_sex
				+ ", owner_regdate=" + owner_regdate + ", owner_agreement=" + owner_agreement + ", owner_out="
				+ owner_out + ", reserve_count=" + reserve_count + ", like_count=" + like_count + ", pay_count="
				+ pay_count + ", reply_count=" + reply_count + ", qna_count=" + qna_count + ", store_seq=" + store_seq
				+ ", reply_read=" + reply_read + ", qna_read=" + qna_read + "]";
	}

	

	
	
	
	
	
	
	
}