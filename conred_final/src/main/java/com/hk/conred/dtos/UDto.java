package com.hk.conred.dtos;

import java.util.Date;

public class UDto {

	private String user_id;
	private String user_password;
	private String user_name;
	private String user_email;
	private String user_birth;
	private String user_sex;
	private Date user_regdate;
	private String user_agreement;
	private String user_out;
	private String user_black;
	private String user_role;
	private int user_point;
	private int reserve_count;
	private int qna_count;
	private int reply_count;
	private int like_count;
	private String[] user_ids;
	
	private String category_code;
	private int interests_seq;
	private String category_name;
	
	

	public UDto() {
		super();
	}



	public UDto(String user_id, String user_password, String user_name, String user_email, String user_birth,
			String user_sex, Date user_regdate, String user_agreement, String user_out, String user_black,
			String user_role, int user_point, int reserve_count, int qna_count, int reply_count, int like_count,
			String category_code, int interests_seq, String category_name) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_birth = user_birth;
		this.user_sex = user_sex;
		this.user_regdate = user_regdate;
		this.user_agreement = user_agreement;
		this.user_out = user_out;
		this.user_black = user_black;
		this.user_role = user_role;
		this.user_point = user_point;
		this.reserve_count = reserve_count;
		this.qna_count = qna_count;
		this.reply_count = reply_count;
		this.like_count = like_count;
		this.category_code = category_code;
		this.interests_seq = interests_seq;
		this.category_name = category_name;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getUser_password() {
		return user_password;
	}



	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getUser_email() {
		return user_email;
	}



	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}



	public String getUser_birth() {
		return user_birth;
	}



	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}



	public String getUser_sex() {
		return user_sex;
	}



	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}



	public Date getUser_regdate() {
		return user_regdate;
	}



	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}



	public String getUser_agreement() {
		return user_agreement;
	}



	public void setUser_agreement(String user_agreement) {
		this.user_agreement = user_agreement;
	}



	public String getUser_out() {
		return user_out;
	}



	public void setUser_out(String user_out) {
		this.user_out = user_out;
	}



	public String getUser_black() {
		return user_black;
	}



	public void setUser_black(String user_black) {
		this.user_black = user_black;
	}



	public String getUser_role() {
		return user_role;
	}



	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}



	public int getUser_point() {
		return user_point;
	}



	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}



	public int getReserve_count() {
		return reserve_count;
	}



	public void setReserve_count(int reserve_count) {
		this.reserve_count = reserve_count;
	}



	public int getQna_count() {
		return qna_count;
	}



	public void setQna_count(int qna_count) {
		this.qna_count = qna_count;
	}



	public int getReply_count() {
		return reply_count;
	}



	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}



	public int getLike_count() {
		return like_count;
	}



	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}



	public String getCategory_code() {
		return category_code;
	}



	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}



	public int getInterests_seq() {
		return interests_seq;
	}



	public void setInterests_seq(int interests_seq) {
		this.interests_seq = interests_seq;
	}



	public String getCategory_name() {
		return category_name;
	}



	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}



	@Override
	public String toString() {
		return "UDto [user_id=" + user_id + ", user_password=" + user_password + ", user_name=" + user_name
				+ ", user_email=" + user_email + ", user_birth=" + user_birth + ", user_sex=" + user_sex
				+ ", user_regdate=" + user_regdate + ", user_agreement=" + user_agreement + ", user_out=" + user_out
				+ ", user_black=" + user_black + ", user_role=" + user_role + ", user_point=" + user_point
				+ ", reserve_count=" + reserve_count + ", qna_count=" + qna_count + ", reply_count=" + reply_count
				+ ", like_count=" + like_count + ", category_code=" + category_code + ", interests_seq=" + interests_seq
				+ ", category_name=" + category_name + "]";
	}


	
	
	

	

	


	
	
	
	
}
