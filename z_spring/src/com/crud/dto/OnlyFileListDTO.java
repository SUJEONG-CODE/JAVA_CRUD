package com.crud.dto;

public class OnlyFileListDTO {
 
	//수정중
	private int emp_no=0;
	private int file_no=0;
 
	private String file_name;
	
	private String contents_type;
	private String temp_name;
	private String file_reg_date;
	
	
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getContents_type() {
		return contents_type;
	}
	public void setContents_type(String contents_type) {
		this.contents_type = contents_type;
	}
	public String getTemp_name() {
		return temp_name;
	}
	public void setTemp_name(String temp_name) {
		this.temp_name = temp_name;
	}
	public String getFile_reg_date() {
		return file_reg_date;
	}
	public void setFile_reg_date(String file_reg_date) {
		this.file_reg_date = file_reg_date;
	}
 
  
	 
	
 
}
