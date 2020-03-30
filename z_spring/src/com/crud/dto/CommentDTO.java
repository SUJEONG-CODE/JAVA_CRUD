package com.crud.dto;

public class CommentDTO {
	
	private int b_no=0;

	private int b_no_comment=0;
	private int c_code=0;
	private int b_code=0;
	private String comment_detail;
	private String writer; 
	private String comment_reg_date;
	private String comment_password;
	
	
	
	
	
	public String getComment_password() {
		return comment_password;
	}
	public void setComment_password(String comment_password) {
		this.comment_password = comment_password;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	
	public int getB_no_comment() {
		return b_no_comment;
	}
	public void setB_no_comment(int b_no_comment) {
		this.b_no_comment = b_no_comment;
	}
	public int getC_code() {
		return c_code;
	}
	public void setC_code(int c_code) {
		this.c_code = c_code;
	}
	public int getB_code() {
		return b_code;
	}
	public void setB_code(int b_code) {
		this.b_code = b_code;
	}
	public String getComment_detail() {
		return comment_detail;
	}
	public void setComment_detail(String comment_detail) {
		this.comment_detail = comment_detail;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getComment_reg_date() {
		return comment_reg_date;
	}
	public void setComment_reg_date(String comment_reg_date) {
		this.comment_reg_date = comment_reg_date;
	}
	 
	
	
	
}
