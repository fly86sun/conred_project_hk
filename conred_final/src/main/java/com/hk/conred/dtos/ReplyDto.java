package com.hk.conred.dtos;

import java.util.Date;

public class ReplyDto {
	
	private int reply_seq;
	private String user_id;
	private int store_seq;
	private String reply_content;
	private double reply_clean;
	private double reply_price;
	private double reply_service;
	private String reply_answer;
	private String reply_read;
	private Date reply_regdate;
	private String reply_delflag;
	
	private double clean_avg;
	private double service_avg;
	private double price_avg;
	private double all_avg;
	private int reply_count;
	private int answer_count;
	private int rn;
	private String store_name;
	
	private String store_photo_stored;
	
	private String reply_realdate;
	private String owner_id;
	
	
	public ReplyDto() {
		super();
	}


	public ReplyDto(int reply_seq, String user_id, int store_seq, String reply_content, double reply_clean,
			double reply_price, double reply_service, String reply_answer, String reply_read, Date reply_regdate,
			String reply_delflag, double clean_avg, double service_avg, double price_avg, double all_avg,
			int reply_count, int answer_count, int rn, String store_name, String store_photo_stored,
			String reply_realdate, String owner_id) {
		super();
		this.reply_seq = reply_seq;
		this.user_id = user_id;
		this.store_seq = store_seq;
		this.reply_content = reply_content;
		this.reply_clean = reply_clean;
		this.reply_price = reply_price;
		this.reply_service = reply_service;
		this.reply_answer = reply_answer;
		this.reply_read = reply_read;
		this.reply_regdate = reply_regdate;
		this.reply_delflag = reply_delflag;
		this.clean_avg = clean_avg;
		this.service_avg = service_avg;
		this.price_avg = price_avg;
		this.all_avg = all_avg;
		this.reply_count = reply_count;
		this.answer_count = answer_count;
		this.rn = rn;
		this.store_name = store_name;
		this.store_photo_stored = store_photo_stored;
		this.reply_realdate = reply_realdate;
		this.owner_id = owner_id;
	}


	public int getReply_seq() {
		return reply_seq;
	}


	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getStore_seq() {
		return store_seq;
	}


	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}


	public String getReply_content() {
		return reply_content;
	}


	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}


	public double getReply_clean() {
		return reply_clean;
	}


	public void setReply_clean(double reply_clean) {
		this.reply_clean = reply_clean;
	}


	public double getReply_price() {
		return reply_price;
	}


	public void setReply_price(double reply_price) {
		this.reply_price = reply_price;
	}


	public double getReply_service() {
		return reply_service;
	}


	public void setReply_service(double reply_service) {
		this.reply_service = reply_service;
	}


	public String getReply_answer() {
		return reply_answer;
	}


	public void setReply_answer(String reply_answer) {
		this.reply_answer = reply_answer;
	}


	public String getReply_read() {
		return reply_read;
	}


	public void setReply_read(String reply_read) {
		this.reply_read = reply_read;
	}


	public Date getReply_regdate() {
		return reply_regdate;
	}


	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}


	public String getReply_delflag() {
		return reply_delflag;
	}


	public void setReply_delflag(String reply_delflag) {
		this.reply_delflag = reply_delflag;
	}


	public double getClean_avg() {
		return clean_avg;
	}


	public void setClean_avg(double clean_avg) {
		this.clean_avg = clean_avg;
	}


	public double getService_avg() {
		return service_avg;
	}


	public void setService_avg(double service_avg) {
		this.service_avg = service_avg;
	}


	public double getPrice_avg() {
		return price_avg;
	}


	public void setPrice_avg(double price_avg) {
		this.price_avg = price_avg;
	}


	public double getAll_avg() {
		return all_avg;
	}


	public void setAll_avg(double all_avg) {
		this.all_avg = all_avg;
	}


	public int getReply_count() {
		return reply_count;
	}


	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}


	public int getAnswer_count() {
		return answer_count;
	}


	public void setAnswer_count(int answer_count) {
		this.answer_count = answer_count;
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


	public String getReply_realdate() {
		return reply_realdate;
	}


	public void setReply_realdate(String reply_realdate) {
		this.reply_realdate = reply_realdate;
	}


	public String getOwner_id() {
		return owner_id;
	}


	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}


	@Override
	public String toString() {
		return "ReplyDto [reply_seq=" + reply_seq + ", user_id=" + user_id + ", store_seq=" + store_seq
				+ ", reply_content=" + reply_content + ", reply_clean=" + reply_clean + ", reply_price=" + reply_price
				+ ", reply_service=" + reply_service + ", reply_answer=" + reply_answer + ", reply_read=" + reply_read
				+ ", reply_regdate=" + reply_regdate + ", reply_delflag=" + reply_delflag + ", clean_avg=" + clean_avg
				+ ", service_avg=" + service_avg + ", price_avg=" + price_avg + ", all_avg=" + all_avg
				+ ", reply_count=" + reply_count + ", answer_count=" + answer_count + ", rn=" + rn + ", store_name="
				+ store_name + ", store_photo_stored=" + store_photo_stored + ", reply_realdate=" + reply_realdate
				+ ", owner_id=" + owner_id + "]";
	}


	
	

	
	
	
	
	
	
	
	
	
	
}
