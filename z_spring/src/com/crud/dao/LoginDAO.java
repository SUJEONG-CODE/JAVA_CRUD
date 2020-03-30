package com.crud.dao;

import java.util.Map;

import com.crud.dto.JoinDTO;
import com.crud.dto.SearchIDPwdDTO;

public interface LoginDAO {
	
	//============================================================
	// [ 로그인 아이디, 암호 존재 개수 ] 검색 메소드 선언.
	//============================================================
	int getAdminCnt(Map<String, String> admin_id_pwd);
	
	//========================================================================
	//회원가입 
	//========================================================================
	int insertJoinCnt(JoinDTO joinDTO );
	
	//========================================================================
	//아이디 암호 조회  및 사업자 번호 개수  
	//========================================================================
 	int getfindIDPasswordCnt(Map<String, String> FindIdPwd );
	SearchIDPwdDTO getfindIDPwd(Map<String, String>  FindIdPwd );
	

}
