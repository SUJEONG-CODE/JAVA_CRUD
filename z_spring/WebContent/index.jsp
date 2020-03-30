<!-- **************************************************************************************************** -->
<!-- JSP 기술의 한 종류인  [Page Directive] 를 이용하여 현 JSP 페이지 처리 방식 선언하기. -->
<!-- **************************************************************************************************** -->
	<!-- 
		현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다 라고 설정함. 
		현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다.
		UTF-8 인코딩 방식은 한글을 포함한 전 세계 모든 문자열을 부호화 할 수 있는 방법이다.
	-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
   
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	<script>
		location.replace("/z_spring/loginForm.do")
	</script>
 -->

	<script>
		location.replace("/z_spring/boardListForm.do")
	</script>

</body>



</html>















