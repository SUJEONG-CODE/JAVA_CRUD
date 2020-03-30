<!-- **************************************************************************************************** -->
<!-- JSP 기술의 한 종류인  [Page Directive] 를 이용하여 현 JSP 페이지 처리 방식 선언하기. -->
<!-- **************************************************************************************************** -->
   <!-- 
      현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다 라고 설정함. 
      현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다.
      UTF-8 인코딩 방식은 한글을 포함한 전 세계 모든 문자열을 부호화 할 수 있는 방법이다.
   -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSP 페이지에서 사용할  [ 사용자 정의 태그 ]인 [JSTL의  C코어 태그] 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  
<!-- JSP 페이지에서 사용할 [사용자 정의 태그]인 [spring 폼 태그] 선언 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
 
<!-- 변수 thColor1 선언하고, 문자열 "#eaeaea" 저장하기. -->
<c:set var="thColor1" value="#eaeaea"/>
<c:set var="headerColor" value="#78909C"/>
<c:set var="oddTrColor" value="WHITE"/>
<c:set var="evenTrColor" value="#ECEFF1"/>
<c:set var="mouseOverColor" value="#CCE1FF"/>
<!-- ========================================== -->
<c:set var="bodyBgColor1" value="lightblue"/>
<c:set var="bodyBgColor1" value="#EFEBE9"/>
<!-- =========================================== -->
<c:set var="ctRoot" value="/z_spring"/>
<%--    <c:set var="ctRootImage" value="${ctRoot}/resources/imagecollection"/> 
 --%>  
   
   <c:set var="ctRootImage" value="C:/imagecollection"/>  
  <!-- 파일의 보안을 위해  WebContent내부의  WEB-INF 내에 파일을 저장한다면 url 경로를 통해 파일에 접속하지 못하게 막기 때문에  WEB-INF 파일에 저장한다.  -->
<!-- /z_spring/resources/common.css fake경로의 간단한 이유는 servlet-context.xml 파일에서 설정한 코딩에 의해서 리얼 주소로변경해준다. -->

<!-- **************************************************************************************************** -->
<!-- css 파일 수입 -->
<!-- JQuery 라이브러리 파일 수입 -->
<!-- **************************************************************************************************** -->
<link href="/z_spring/resources/common.css" rel="stylesheet" type="text/css">
<script src="/z_spring/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="/z_spring/resources/common.js?a=<%=Math.random()%>" type="text/javascript"></script>



<!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->
<!-- JSTL 의 C코어 태그를 사용하여 변수들을 선언하기 -->
<!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->
<!-- 
 로그 아웃 버튼
<script>
	$(document).ready(function(){
		if( location.href.indexOf("loginForm.do")<0 & location.href.indexOf("findIdPwdForm.do")<0 & location.href.indexOf("joinForm.do")<0){
/* 			$(".unstyled").prepend("<button type=button value='로그아웃'  onClick=\"location.replace('/z_spring/logout.do')\">Logout</button>")
 */			$("body").find(".top-bar").prepend("<div style=float:right;''><button class='btn pull-right btn-primary' type='button' onClick=\"location.replace('/z_spring/logoutForm.do')\">로그아웃</button></div>")
			
		}
		 
	});
</script>
 -->


