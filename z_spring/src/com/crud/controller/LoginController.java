package com.crud.controller;
import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crud.dto.JoinDTO;
import com.crud.dto.SearchIDPwdDTO;
import com.crud.service.LoginService;

//*********************************************************************
// 가상  URL 주소로 접속하며 호출되는 메소드를 소유한  [ 컨트롤러 클래스 ] 선언
	// @Controller 를 붙임으로써  [ 컨트롤러 클래스 ] 임을 지정한다.
//*********************************************************************
@Controller
// 클래스 내부에서 발생하는 모든 예외를 아래의  @ControllerAdvice 어노테이션이 잡아준 후 @ExceptionHandler의 메소드를 호출해준다.
//@ExceptionHandler의 리턴값은 jsp 페이지를 리턴한다.
@ControllerAdvice
public class LoginController {
	
	// @Autowired >> 로그인 서비스 인터페이스를 구현받은 클래스를 찾아서 객체화시키고  객체의 메모리 위치 주소값을 " loginService "  변수에 저장.
	// 클래스 간에 결속력을 약화시켜 소스 수정시 연쇄수정을 없애기 위해.
	// 속성변수 loginService 선언하고, @Autowired에 의해 LoginService 라는 인터페이스를 구현한 클래스를 객체화하여 저장한다.
	// 이때 LoginService 라는 인터페이를 구현한 클래스의 이름을 몰라도 관계없다. 1개  존재하기만 하면된다.
 
	@Autowired
	private LoginService loginService;
 
	//=================================================================
	//가상주소 / z_spring/loginForm.do 로 접근하면 호출되는 메소드 선언
	//=================================================================
	@RequestMapping( value="/loginForm.do" )
	public ModelAndView loginForm(
	/* HttpSession session */
			) {
		/* session.removeAttribute("admin_id"); */
		//----------------------------------
		// ModelAndView 객체 생성하기
		// ModelAndView 객체에 호출할 JSP 페이지명을 저장하기.
		// ModelAndView 객체 리턴하기.
		//----------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginForm.jsp");
		return mav;
	}
	
	//=================================================================
	//가상주소  ${ctRoot}/loginProc.do 로 접근하면 호출되는 메소드 선언.
	// 메소드 호출 후 ModelAndView 객체를 리턴하지 않고 
	// 아이디 암호의 존재 개수를 리턴하도록 설정한다.
	//=================================================================
	
	@RequestMapping(
			value="/loginProc.do"					//접속하는 클라이언트의 URL 주소 설정
			, method=RequestMethod.POST				//접속하는 클라이언트의 파라미터값 전송 방법
			, produces="application/json;carset=UTF-8"	//응답할 데이터 종류  : json 으로 설정
	)
	@ResponseBody
	public int loginProc( 
			// admin_id 라는 파라미터명에 해당하는 파라미터값을 저장한 매개변수 admin_id 선언
		@RequestParam(value="admin_id") String admin_id
		// pwd 라는 파라미터명에 해당하는 파라미터값을 저장한 매개변수 pwd 선언.
		, @RequestParam(value="pwd") String pwd	
		// is_login 라는 파라미터명에 해당하는 파라미터값을 저장한 매개변수 is_login 선언.
		, @RequestParam(value="is_login", required=false) String is_login
		// HttpSession 객체의 메위주를 받아오는 매개변수 선언.
		, HttpSession session
		// HttpServletResponse 객체의 메위주를 받아오는 매개변수 선언.
		, HttpServletResponse response
	) {
		System.out.println("admin_id = " + admin_id);
		System.out.println("pwd = " + pwd);
		System.out.println("is_login = " + is_login);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("admin_id", admin_id);
		map.put("pwd", pwd);
		
		
		//-------------------------------------------------------------------------
		// 로그인 아이디, 암호의 존재 개수를 저장하는 변수 선언하기.
		//-------------------------------------------------------------------------
		int admin_idCnt = 0;
		try {
			//-------------------------------------------------------------------------
			// 서비스클래스의 메소드를 호출하여
			// admin 테이블에 존재하는 로그인 아이디의 존재 개수를 얻어오기
			// admin_idCnt 에는 DB연동후 나온 결과값이 저장되어 있다.
			//-------------------------------------------------------------------------
			admin_idCnt = this.loginService.getAdminCnt(map);
			
			
			
			// 만약 로그인 아이디의 존재 개수가   1이면(즉, 로그인이 성공했으면)
			// HttpSession 객체에 로그인 아이디 저장하기.
			if(admin_idCnt==1) {
				// HttpSession 객체에 아이디를 저장해 놓는다.
				session.setAttribute("admin_id", admin_id);
				
				// 아이디 암호 저장 의사가 있을경우 쿠키를 생성하가 쿠키명-쿠키값을 admin_id
				if(is_login != null) {
					// 쿠키 객체를 생성하여 아이디를 저장할 cookie1 변수 설정 후 [ admin_id - "입력아이디" ]로 하고
					// 수명은 60*60*24 로 하기.
					// 그리고 이 쿠키 HttpServletResponse 객체에 저장하기.
					// 쿠키를 생성하고 쿠키명-쿠키값을 [ admin_id - "입력아이디" ]로 하고 수명은 60*60*24로 하기 
					// HttpServletResponse 객체에 저장된 쿠키는 클라이언트에게 전송된다.
					Cookie cookie1 = new Cookie("admin_id",admin_id);
					cookie1.setMaxAge(60*60*24);
					response.addCookie(cookie1);
					Cookie cookie2 = new Cookie("pwd",pwd);
					cookie2.setMaxAge(60*60*24);
					response.addCookie(cookie2);
				}
				// 아이디 암호 저장 의사가 없을 경우
				// 쿠키 객체를 생성하여 아이디를 저장할 cookie1 변수 설정 후 [ admin_id - null ]로 하고
				// 수명은 0 로 하기.
				// 그리고 이 쿠키 HttpServletResponse 객체에 저장하기.
				// 쿠키를 생성하고 쿠키명-쿠키값을 [ admin_id - null ]로 하고 수명은 0로 하기 
				// HttpServletResponse 객체에 저장된 쿠키는 클라이언트에게 전송된다.
				else {
					Cookie cookie1 = new Cookie("admin_id", null);
					cookie1.setMaxAge(0);
					response.addCookie(cookie1);
					Cookie cookie2 = new Cookie("pwd",null);
					cookie2.setMaxAge(0);
					response.addCookie(cookie2);
				}
			}
			System.out.println("<접속성공> [접속 URL]->/loginProc.do [호출메소드] -> LoginController.loginProc(~) \n\n\n");
		}catch(Exception e) {
			System.out.println("<접속실패> [접속 URL]->/loginProc.do [호출메소드] -> LoginController.loginProc(~) \n\n\n");
			 System.out.println(e.getMessage());
			admin_idCnt = -1;
		}
		//-------------------------------------------------------------------------
				// admin 테이블에 존재하는 로그인 아이디의 존재 개수를 리턴하기.
				//-------------------------------------------------------------------------
				return admin_idCnt;
	}
	
	
	//회원가입 폼 열기
	@RequestMapping( value="/joinForm.do" )
	public ModelAndView joinForm(
	/* HttpSession session */
			) {
		/* session.removeAttribute("admin_id"); */
		//----------------------------------
		// ModelAndView 객체 생성하기
		// ModelAndView 객체에 호출할 JSP 페이지명을 저장하기.
		// ModelAndView 객체 리턴하기.
		//----------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("joinForm.jsp");
		return mav;
	}
	
	//아이디 비밀번호 찾기 폼 열기
	@RequestMapping( value="/findIdPwdForm.do" )
	public ModelAndView findIdPwdForm(
	/* HttpSession session */
			) {
		/* session.removeAttribute("admin_id"); */
		//----------------------------------
		// ModelAndView 객체 생성하기
		// ModelAndView 객체에 호출할 JSP 페이지명을 저장하기.
		// ModelAndView 객체 리턴하기.
		//----------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("findIdPwdForm.jsp");
		return mav;
	}
	
	//회원가입 입력
	   @RequestMapping(
				value="/joinRegProc.do"					//접속하는 클라이언트의 URL 주소 설정
				, method=RequestMethod.POST				//접속하는 클라이언트의 파라미터값 전송 방법
				, produces="application/json;carset=UTF-8"	//응답할 데이터 종류  : json 으로 설정
			)
	   @ResponseBody
	   public int insertJoinCnt(
			   //=============================================
			   // 파라미터값을 저장할 BoardDTO 객체 를 매개변수로 선언
			   //=============================================
			   JoinDTO joinDTO) {
		   int joinRegCnt = 0;
 		   try {
 		
 			System.out.println( joinDTO.getAdmin_address() );
 			System.out.println( joinDTO.getAdmin_id());
 			System.out.println( joinDTO.getAdmin_email());
 			System.out.println( joinDTO.getAdmin_jibunaddress());
 			System.out.println( joinDTO.getAdmin_name());
 			System.out.println( joinDTO.getAdmin_phonenum());
 			System.out.println( joinDTO.getAdmin_postcode());
 			System.out.println( joinDTO.getAdmin_roadaddress());
 			System.out.println( joinDTO.getPwd());
  
 			   //[ BoardServiceImpl 객체 ]의 insertBoard 메소드 호출로 게시판 입력하고 [게시판 입력] 적용행의 개수 얻기.
			   joinRegCnt = this.loginService.insertJoinCnt(joinDTO);
			   
		   }catch(Exception e) {
			   System.out.println("<에러발생>");
			   joinRegCnt = -1;
		   }
		   return joinRegCnt;
	   }
	   	
	
	   // 아이디 비밀번호 찾기

		@RequestMapping(value = "/findIDPasswordProc.do", method = RequestMethod.POST, produces = "application/json;carset=UTF-8")
		@ResponseBody
		public SearchIDPwdDTO findIDPassword(
				@RequestParam(value = "admin_name") String admin_name,
				@RequestParam(value = "admin_phonenum") String admin_phonenum) {

			System.out.println("admin_name = " + admin_name);
			System.out.println("admin_phonenum = " + admin_phonenum);
 

			Map<String, String> map = new HashMap<String, String>();
			map.put("admin_name", admin_name);
			map.put("admin_phonenum", admin_phonenum);
 

			SearchIDPwdDTO findfindIDPwd = null;

			try {

				System.out.println("findIDPassword입장");

				findfindIDPwd = this.loginService.getfindIDPwd(map);

				//System.out.println(findfindIDPwd.getUser_id());
				System.out.println(findfindIDPwd);
				System.out.println("<접속성공>findIDPassword \n\n\n");

			} catch (Exception e) {
				System.out.println(findfindIDPwd);
				System.out.println("<접속실패>findIDPassword \n\n\n");

			}

			// int 와 string을 사용한다면 modelandview 사용 해서 if 사용하여 가져옴
			return findfindIDPwd;
		}
		
		//로그 아웃시
		//------------------------------------------------------------------------	
		

		@RequestMapping(value = "/logoutForm.do")
		public ModelAndView logout(

				HttpSession session) {

			session.removeAttribute("admin_id");
			session.removeAttribute("uri");
			session.removeAttribute("BoardSerchDTO");

			// session.removeAttribute("boardSearchDTO");

			ModelAndView mav = new ModelAndView();
			mav.setViewName("logout.jsp");
			System.out.println(" 접속성공 logout");
			return mav;
		}

		@ExceptionHandler(Exception.class)
		public String handlerException(HttpServletRequest request) {
			return "logout.jsp";
		}
		

 
	
};