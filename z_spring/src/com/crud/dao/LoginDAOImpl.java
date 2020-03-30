package com.crud.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crud.dto.JoinDTO;
import com.crud.dto.SearchIDPwdDTO;

//서비스 클래스 생성 <서비스 클래스를 생성하기전  인터페이스를 생성 후에 서비스 클래스를 생성해야 한다.>
//<인터페이스가 부모>
@Repository
public class LoginDAOImpl implements LoginDAO{
	
	//=============================================================
	// SqlSessionTemplate 객체를 생성해 속변 sqlSesstion 에 저장.
	//=============================================================
	
	//=============================================================
	//속성변수 sqlSession 선언하고.
	// @Autowired 에 의해  SqlSesstionTemplate 클래스를 객체화하여 저장한다.
	//=============================================================
			//@Autowired >> 로그인 서비스 인터페이스를 구현받은 클래스를 찾아서 객체화시키고  객체의 메모리 위치 주소값을 " loginService "  변수에 저장.
			// 클래스 간에 결속력을 약화시켜 소스 수정시 연쇄수정을 없애기 위해.
			// 속성변수 loginService 선언하고, @Autowired에 의해 LoginService 라는 인터페이스를 구현한 클래스를 객체화하여 저장한다.
			// 이때 LoginService 라는 인터페이를 구현한 클래스의 이름을 몰라도 관계없다. 1개  존재하기만 하면된다.
		
	
	String sqlSessionPath="com.crud.dao.LoginDAO.";	
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//=============================================================
	// 로그인 정보의 개수를 리턴하는 메소드 선언
	//=============================================================
	// SqlSessionTemplate 객체의 selectOne 메소드를 호출하여 
	// 검색  SQL 구문을 실행하여 1행 n열의 데이터를 얻는다.
	public int getAdminCnt( Map<String, String> admin_id_pwd ) {
		System.out.println(admin_id_pwd);
		int adminCnt = this.sqlSession.selectOne(
				// xml 파일중에 <"namespace=com.naver.erp.LoginDAO"> 태그'
				// 내부에 id=getAdminCnt 를 가진 태그 내부의 
				// sql 구문을 실행하라
				sqlSessionPath+"getAdminCnt"
				// 위의 sql 구문을 실행할 때 참여할 데이터가 저장된 hashMap 객체 지정
				, admin_id_pwd
				);
		return adminCnt;
	}
	
	
	
	//회원가입 
	public int insertJoinCnt(JoinDTO joinDTO) {
		
		System.out.println("DAO 시작");
		int joinRegCnt=this.sqlSession.insert(
				sqlSessionPath+"insertJoinCnt"
			, joinDTO	
		);
		
		System.out.println("DAO 끝");
		return joinRegCnt;		
	};
	
	
	//아이디 암호 찾기
	public int getfindIDPasswordCnt(Map<String, String> FindIdPwd ) {
		System.out.println("DAO Imp"+FindIdPwd);
		
		int FindIDPasswordCnt = this.sqlSession.selectOne(
				sqlSessionPath+"getfindIDPasswordCnt"
				,FindIdPwd
				);
		
		System.out.println("아이디 암호 조회후");
		return FindIDPasswordCnt;
		
		
	};
	
	
	public SearchIDPwdDTO getfindIDPwd(Map<String, String>  FindIdPwd ) {
		System.out.println("DAO Imp"+FindIdPwd);
		
		SearchIDPwdDTO findIDPassword = this.sqlSession.selectOne(
				sqlSessionPath+"getfindIDPwd"
				,FindIdPwd
				);
		
		System.out.println("아이디 암호 조회후");
		return findIDPassword;
		
		
	};

}
