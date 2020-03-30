<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<!DOCTYPE html>
 

<head>
<%@ include file="common.jsp" %>
	<!-- Basic Page Needs
	================================================== -->
 
	<title>Constra - Construction Html5 Template</title>

	<!-- Mobile Specific Metas
	================================================== -->

	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<!-- CSS
	================================================== -->

	<!-- Bootstrap -->
	<link rel="stylesheet" href="resources/mainBootstrap/css/bootstrap.min.css">
	<!-- Template styles-->
	<link rel="stylesheet" href="resources/mainBootstrap/css/style.css">
	<!-- Responsive styles-->
	<link rel="stylesheet" href="resources/mainBootstrap/css/responsive.css">
	<!-- FontAwesome -->
	<link rel="stylesheet" href="resources/mainBootstrap/css/font-awesome.min.css">
	<!-- Animation -->
	<link rel="stylesheet" href="resources/mainBootstrap/css/animate.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="resources/mainBootstrap/css/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/mainBootstrap/css/owl.theme.default.min.css">
	<!-- Colorbox -->
	<link rel="stylesheet" href="resources/mainBootstrap/css/colorbox.css">

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
	<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
<style>
		table {
		  width: 500;
		  border-top: 1px solid #444444;
		  border-collapse: collapse;
		}
		th, td {
		  border-bottom: 1px solid #444444;
		  padding: 10px;
		}
</style>  
<script>

$(document).ready(function(){

/* 
$('[name=rowCntPerPage]').change(function(){
		goFileListForm();	
	}); */
	
 $(".pagingNumber").html(
			getPagingNumber(
				"${fileListAllCnt}"				//검색 결과 총 행 개수
				,"${fileUpDTO.selectPageNo}"	//선택된 현재 페이지 번호
				,"${fileUpDTO.rowCntPerPage}"	//페이지 당 출력행의 개수
				,"10"								//페이지당 보여줄 페이지번호 개수
				,"goFileListForm();"						//페이지 번호 클릭 후 실행할 자스코드
			)		
	);
 	inputData( "[name=fileListForm]", "${fileUpDTO.selectPageNo}" );
	inputData( "[name=fileListForm]", "${fileUpDTO.rowCntPerPage}" );
 
	
});

function goFileListForm(){
 
	document.fileListForm.submit();
}
		
//회원가입
function goJoinForm(){
	location.replace("/z_spring/joinForm.do");
}	

//게시판 목록
function goBoardListForm(){
	location.replace("/z_spring/boardListForm.do");
}

//파일 등록
function goFileForm(){
	location.replace("/z_spring/fileForm.do");
}
 
  //파일리스트
function goFileListFormSide(){
	location.replace("/z_spring/fileListForm.do");
}  

function goFileContentForm(emp_no,file_cnt,count_no){
	 var str="emp_no="+emp_no+"&file_cnt="+file_cnt+"&count_no="+count_no
	 location.replace("/z_spring/fileContentForm.do?"+str);
}
</script>
 
</head>


<body>

	<div class="body-inner">

		<div id="top-bar" class="top-bar">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
						<ul class="top-info">
 
						</ul>
					</div>
					<!--/ Top info end -->

					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 top-social text-right">
						<ul class="unstyled">
							<li>
								 
							</li>
						</ul>
					</div>
					<!--/ Top social end -->
				</div>
				<!--/ Content row end -->
			</div>
			<!--/ Container end -->
		</div>
		<!--/ Topbar end -->

		<!-- Header start -->
		<header id="header" class="header-one">
			<div class="container">
			</div><!-- Container end -->

			<nav class="site-navigation navigation navdown">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="site-nav-inner pull-left">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>

								<div class="collapse navbar-collapse navbar-responsive-collapse">
									<ul class="nav navbar-nav">
										<li><a style="cursor:pointer" onClick="goBoardListForm()">Main</a></li>
									 	<li><a style="cursor:pointer" onClick="goFileListFormSide()">FileList</a></li>
									 	
									</ul>
									<!--/ Nav ul end -->
								</div>
								<!--/ Collapse end -->

							</div><!-- Site Navbar inner end -->

						</div>
						<!--/ Col end -->
					</div>
					<!--/ Row end -->

					<div class="nav-search">
						<span id="search"><i class="fa fa-search"></i></span>
					</div><!-- Search end -->

					<div class="search-block" style="display: none;">
						<input type="text" class="form-control" placeholder="Type what you want and enter">
						<span class="search-close">&times;</span>
					</div><!-- Site search end -->
				</div>
				<!--/ Container end -->

			</nav>
			<!--/ Navigation end -->
		</header>
 
			

   <section id="main-container" class="main-container">
       <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="isotope-nav" data-isotope-nav="isotope">
               <!-- ============================================== -->
				<!-- 게시판 검색 조건 관련 입력 양식 삽입된  form 태그 선언하기. -->
				<!-- ============================================== -->
				<center>
				<form name="fileListForm" method="post" action="/z_spring/fileListForm.do">
					<input type="hidden" name="selectPageNo" >
				 
						<div align="right" style="width:800">
 
								<!-- ============================================== -->
								<!-- EL 문법으로 게시판 검색 총 개수 출력하기 -->
								<!-- '$'{boardListAllCnt}는 컨트롤러 클래스인 BoardController 클래스 내부에 -->
								<!-- ModelAndView 객체에 boardListAllCnt 라는 키값으로 저장된 -->
								<!-- 데이터를 EL 로 표현하여 삽입 하라는 뜻이다. -->
								<!-- ============================================== -->
								[총 개수] : ${fileListAllCnt}&nbsp;&nbsp;&nbsp;
								<!-- ============================================== -->
								<!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력양식 표현하기. -->
								<!-- 행의 개수는 db연동시 아주 중요한 역할을 한다. -->
								<!-- ============================================== -->
							<!-- 	<select style='width:50px;' name="rowCntPerPage">
									<option value="10">10
									<option value="15">15
									<option value="20">20
									<option value="25">25
									<option value="30">30	
								</select> 행보기 -->
					 
							<button class="btn btn-light"  onClick="goFileForm();"  type="button">
								파일등록하기
							</button>
					</div>
					<br>
  
				<table class="boardTable table">
					<thead><tr>
					<td width="5%" align=center><b>번호
					<td  width="15%" align=center><b>제목
					<td  width="10%" align=center><b>작성자
					<td  width="5%" align=center><b>등록일
					<td  width="5%" align=center><b>문서
 	
				 </thead>

					<tbody>
					 
					<c:forEach items="${fileList}" var="fileList" varStatus="loopTagStatus">
						<!-- foreach 태그 상태 속성이다. 속성을 이용해서 제어하면 좀더 쉽게 제어, 순서와 관련 제어할때 사용 -->
							 
							<tr style="cursor:pointer" onClick="goFileContentForm(${fileList.emp_no},${fileList.file_cnt},${ fileListAllCnt-(fileUpDTO.selectPageNo*fileUpDTO.rowCntPerPage-fileUpDTO.rowCntPerPage+1+loopTagStatus.index)+1})">
					 			<td align=center> 
					 				<input type="hidden" name="emp_no" value="${fileList.emp_no}">
					 			
									${ fileListAllCnt-(fileUpDTO.selectPageNo*fileUpDTO.rowCntPerPage-fileUpDTO.rowCntPerPage+1+loopTagStatus.index)+1}
								<td align=left>	
									<c:out value="${fileList.emp_name}" escapeXml="true" default="${fileList.emp_name}"/>
								<td  align=left>
									<c:out value="${fileList.emp_email}" escapeXml="true" default="${fileList.emp_email}"/>
								<td  align=left>
									<c:out value="${fileList.reg_date}" escapeXml="true" default="${fileList.reg_date}"/>
								<td align=center>
									파일개수: <c:out value="${fileList.file_cnt}" escapeXml="true" default="${fileList.file_cnt}"/>
					
					
					
					<%-- 		  <c:choose>
								<c:when test="${fn:contains(fileList.emp_pic,'png')||fn:contains(fileList.emp_pic, 'jpg')}">
									<div style="width: 30px; height: 30px; overflow: hidden">
                                    <img src="C:/imagecollection/image.jpg" style="width: 100%; height: 100%;">
                                    </div>
								</c:when>
					 
								<c:otherwise>
									
									<div style="width: 30px; height: 30px; overflow: hidden">
									<img src="C:/imagecollection/default.jpg" style="width: 100%; height: 100%;">
									</div>
                                  
                 				</c:otherwise>
                 				</c:choose>
						  --%>
						</c:forEach>
 
			</tbody>
				
			</table>
		</div> 
	</form>
	
		 <div align=center>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>  
	 	
		<c:if test="${empty fileList}">
					검색 결과가 없습니다.
		</c:if>  
 </div>
 </div>
</section>
 

   <footer id="footer" class="footer bg-overlay">
    <div class="footer-main">
      <div class="container">
         
      </div><!-- Container end -->
    </div><!-- Footer main end -->

    <div class="copyright">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-6">
            <div class="copyright-info">
              <span>Copyright © 2019 a theme by <a href="https://themefisher.com">themefisher.com</a></span>
            </div>
          </div>

        </div><!-- Row end -->

        <div id="back-to-top" data-spy="affix" data-offset-top="10" class="back-to-top affix">
          <button class="btn btn-primary" title="Back to Top">
            <i class="fa fa-angle-double-up"></i>
          </button>
        </div>

      </div><!-- Container end -->
    </div><!-- Copyright end -->

  </footer><!-- Footer end -->


  <!-- Javascript Files
================================================== -->

  <!-- initialize jQuery Library -->
  <script type="text/javascript" src="resources/mainBootstrap/js/jquery.js"></script>
  <!-- Bootstrap jQuery -->
  <script type="text/javascript" src="resources/mainBootstrap/js/bootstrap.min.js"></script>
  <!-- Owl Carousel -->
  <script type="text/javascript" src="resources/mainBootstrap/js/owl.carousel.min.js"></script>
  <!-- Color box -->
  <script type="text/javascript" src="resources/mainBootstrap/js/jquery.colorbox.js"></script>
  <!-- Isotope -->
  <script type="text/javascript" src="resources/mainBootstrap/js/isotope.js"></script>
  <script type="text/javascript" src="resources/mainBootstrap/js/ini.isotope.js"></script>


  <!-- Google Map API Key-->
  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU&libraries=places"></script>
  <!-- Google Map Plugin-->
  <script type="text/javascript" src="resources/mainBootstrap/js/gmap3.js"></script>

 <!-- Template custom -->
 <script type="text/javascript" src="resources/mainBootstrap/js/custom.js"></script>

</div><!-- Body inner end -->
</body>

</html>