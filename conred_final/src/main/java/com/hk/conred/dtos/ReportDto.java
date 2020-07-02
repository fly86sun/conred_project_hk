package com.hk.conred.dtos;

import java.util.Date;

public class ReportDto {
	private int report_seq;
	private int reply_seq;
	private String report_why;
	private String report_content;
	private String report_read;
	private String report_black;
	private Date report_regdate;
	private String report_id;
	
	public ReportDto() {
	}

	public ReportDto(int report_seq, int reply_seq, String report_why, String report_content, String report_read,
			String report_black, Date report_regdate, String report_id) {
		super();
		this.report_seq = report_seq;
		this.reply_seq = reply_seq;
		this.report_why = report_why;
		this.report_content = report_content;
		this.report_read = report_read;
		this.report_black = report_black;
		this.report_regdate = report_regdate;
		this.report_id = report_id;
	}

	public int getReport_seq() {
		return report_seq;
	}

	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	public String getReport_why() {
		return report_why;
	}

	public void setReport_why(String report_why) {
		this.report_why = report_why;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_read() {
		return report_read;
	}

	public void setReport_read(String report_read) {
		this.report_read = report_read;
	}

	public String getReport_black() {
		return report_black;
	}

	public void setReport_black(String report_black) {
		this.report_black = report_black;
	}

	public Date getReport_regdate() {
		return report_regdate;
	}

	public void setReport_regdate(Date report_regdate) {
		this.report_regdate = report_regdate;
	}

	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}

	@Override
	public String toString() {
		return "reportDto [report_seq=" + report_seq + ", reply_seq=" + reply_seq + ", report_why=" + report_why
				+ ", report_content=" + report_content + ", report_read=" + report_read + ", report_black="
				+ report_black + ", report_regdate=" + report_regdate + ", report_id=" + report_id + "]";
	}
	
	
}
