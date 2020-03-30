package com.crud.dto;

public class BoardDTO {
	private int b_no;
	private String subject;
	private String writer;
	private String reg_date;
	private int readcount;
	private String content;
	private String pwd;

	private int group_no;
	private int print_no;
	private int print_level;

	private int group_count;
	private int max_level;

	private int file_cnt;

	public String[] getOnlyTempName() {
		return onlyTempName;
	}

	public void setOnlyTempName(String[] onlyTempName) {
		this.onlyTempName = onlyTempName;
	}

	private String[] onlyTempName = null;
	private String[] onlyFileName = null;

	public String[] getOnlyFileName() {
		return onlyFileName;
	}

	public void setOnlyFileName(String[] onlyFileName) {
		this.onlyFileName = onlyFileName;
	}

	public int getFile_cnt() {
		return file_cnt;
	}

	public void setFile_cnt(int file_cnt) {
		this.file_cnt = file_cnt;
	}

	public int getMax_level() {
		return max_level;
	}

	public void setMax_level(int max_level) {
		this.max_level = max_level;
	}

	private int comment_count;

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	public int getGroup_count() {
		return group_count;
	}

	public void setGroup_count(int group_count) {
		this.group_count = group_count;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public int getPrint_no() {
		return print_no;
	}

	public void setPrint_no(int print_no) {
		this.print_no = print_no;
	}

	public int getPrint_level() {
		return print_level;
	}

	public void setPrint_level(int print_level) {
		this.print_level = print_level;
	}

}
