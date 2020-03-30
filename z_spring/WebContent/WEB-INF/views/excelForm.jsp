<!-- **************************************************************************************************** -->
<!-- JSP 기술의 한 종류인  [Page Directive] 를 이용하여 현 JSP 페이지 처리 방식 선언하기. -->
<!-- **************************************************************************************************** -->
	<!-- 
		현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다 라고 설정함. 
		현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다.
		UTF-8 인코딩 방식은 한글을 포함한 전 세계 모든 문자열을 부호화 할 수 있는 방법이다.
	-->
 
<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" %><%@ page language="java" import="java.util.*" %>
<% 
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
  String today = formatter.format(new java.util.Date());
  String file_name = "엑셀저장_"+today;
  String ExcelName  = new String(file_name.getBytes(),"UTF-8")+".xls";
  response.setContentType("application/vnd.ms-excel");
  response.setHeader("Content-Disposition", "attachment; filename="+ExcelName);
  response.setHeader("Pragma", "no-cache");   
%>

 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
   
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 
<body bgcolor=white>
	<table border=1>
		<tr bgcolor="#CACACA">
			<th>순서</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
	 
		</tr>
	   
		 <c:forEach items="${excelBoardList}" var="excelBoardList" varStatus="loopTagStatus">  
		<tr>
			<td>${ boardListAllCnt -(boardSearchDTO.selectPageNo*boardSearchDTO.rowCntPerPage-boardSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1}
			<td>
			
			<c:if test="${excelBoardList.subject eq ' ' && excelBoardList.print_no==0}">
				 해당 게시물은 삭제되었습니다. 
			</c:if>
			
			 
			 <c:if test="${excelBoardList.print_level>0 && excelBoardList.subject eq ' '}">
			  
						<c:forEach begin="0" end="${excelBoardList.print_level}">
							&nbsp;&nbsp;  
						</c:forEach>
						ㄴ
				 
				 해당 게시물은 삭제되었습니다. 
			 </c:if>
			 
			 
			 
			 
			 
			
			<c:if test="${excelBoardList.comment_count==0 && excelBoardList.subject ne ' '}">
			
					<c:if test="${excelBoardList.print_level>0}">
						<c:forEach begin="0" end="${excelBoardList.print_level}">
							&nbsp;&nbsp;  
						</c:forEach>
						ㄴ
					</c:if>
					<c:out value="${excelBoardList.subject}" escapeXml="true" default="${excelBoardList.subject}"/> 

			</c:if>
			
			
			
			
			
			
			<c:if test="${excelBoardList.comment_count>0}">
			<!-- ============================================== -->
			<!-- 게시판 검색 목록 중에 각 행의 제목 출력. -->
			<!-- ============================================== -->
				<c:if test="${excelBoardList.print_level>0}">
						<c:forEach begin="0" end="${excelBoardList.print_level}">
							&nbsp;&nbsp;  
						</c:forEach>
						ㄴ
				</c:if>
				<c:out value="${excelBoardList.subject}" escapeXml="true" default="${excelBoardList.subject}"/> 
				<span style="color:blue;">(${excelBoardList.comment_count})</span>
	 
			</c:if>
										
										
			<td><c:out value="${excelBoardList.writer}" escapeXml="true" default="${excelBoardList.writer}"/>
			<td><c:out value="${excelBoardList.reg_date}" escapeXml="true" default="${excelBoardList.reg_date}"/>
			<td><c:out value="${excelBoardList.readcount}" escapeXml="true" default="${excelBoardList.readcount}"/>
		 
		
		</tr>
		</c:forEach>
		
			
	</table>
	
	<c:if test="${empty excelBoardList}">
					검색 결과가 없습니다.
				</c:if>  
	
</body>


</html>















