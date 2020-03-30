package com.crud.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crud.dao.LoginDAO;
import com.crud.dto.JoinDTO;
import com.crud.dto.SearchIDPwdDTO;

//서비스 클래스 생성 <서비스 클래스를 생성하기전  인터페이스를 생성 후에 서비스 클래스를 생성해야 한다.>
//<인터페이스가 부모>


@Service
@Transactional
public class LoginServiceImpl implements LoginService{
	
	//-------------------------------------------------------------------
	// 속성변수 loginDAO 선언하고
	// // @Autowired 에 의해  loginDAO 클래스를 객체화하여 저장한다.
	//-------------------------------------------------------------------
		//@Autowired >> 로그인 서비스 인터페이스를 구현받은 클래스를 찾아서 객체화시키고  객체의 메모리 위치 주소값을 " loginService "  변수에 저장.
		// 클래스 간에 결속력을 약화시켜 소스 수정시 연쇄수정을 없애기 위해.
		// 속성변수 loginService 선언하고, @Autowired에 의해 LoginService 라는 인터페이스를 구현한 클래스를 객체화하여 저장한다.
		// 이때 LoginService 라는 인터페이를 구현한 클래스의 이름을 몰라도 관계없다. 1개  존재하기만 하면된다.
	@Autowired
	private LoginDAO loginDAO;

	
	//=============================================================
	// 로그인 정보의 개수를 리턴하는 메소드 선언
	//=============================================================
	public int getAdminCnt( Map<String, String> admin_id_pwd ) {
		
		// LoginDAOImpl 객체의 getAdminCnt 메소드를 호출하여 아이디, 암호의 존재개수 얻기
		int adminCnt = this.loginDAO.getAdminCnt(admin_id_pwd);
		// 아이디 암호의 존재개수 리턴하기.
		return adminCnt;
	}
	
	//회원가입 
	public int insertJoinCnt(JoinDTO joinDTO ) {
		System.out.println("서비스 시작");
 		int joinRegCnt=this.loginDAO.insertJoinCnt(joinDTO);
	 
		return joinRegCnt;
		
	};
	
	//아이디 암호 조회 후  개수 ---------------------------------------------------------------------------------
	public int getfindIDPasswordCnt(Map<String, String> FindIdPwd ) {
		System.out.println("loginserviceImp"+FindIdPwd);
 	
		int FindIDPasswordCnt = this.loginDAO.getfindIDPasswordCnt(FindIdPwd);	
		if(FindIDPasswordCnt==0) {return -2;}
		
		return FindIDPasswordCnt;

		
	};
	
	public SearchIDPwdDTO getfindIDPwd(Map<String, String> FindIdPwd ) {
		System.out.println("loginserviceImp"+FindIdPwd);
		
		SearchIDPwdDTO findIDPassword = this.loginDAO.getfindIDPwd(FindIdPwd);
		return findIDPassword;
		
		
	};
	

}
