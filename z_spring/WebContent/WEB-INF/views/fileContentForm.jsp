<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 
	#main {
        z-index:1;
    }

    #layer {

        z-index:2;
        position:absolute;
        top:0px;
        left:0px;
        width:100%;
        background-color:rgba(0,0,0,0.8);
    }
   
    #popup {
        z-index:3;
        position:fixed;
        text-align:center;
        left:30%;
        top:20%;
        width:570px;
        height:150px;
        background-color:#FFFFFF;
        border:3px solid #dadada;       
    }

    #close {
        z-index:4;
        float:right;
    }
 

/* 출처: https://wickedmagic.tistory.com/447 [사악미소의 현대마법의 공방] */
	 
</style> 
   
<script>

//본문글 비밀번호 확인하는 팝업 창
function imagePopup(type) {
			    if(type == 'open') {       
			        // 팝업창을 연다.
			        jQuery('#layer').attr('style','display:inline');	       
			    }else if(type == 'close') {     
			      // 팝업창을 닫는다.
			        jQuery('#layer').attr('style','display:none');
			    }		    
			    if( $("#popup").find("[name=emp_password]").val()!=null){
			    		$("#popup").find("[name=emp_password]").val('');   
				}
   			$("#popup").find("[name=emp_password]").focus();
}


function enterkey() {
    if (window.event.keyCode == 13) {
    	goDelFileForm()
    }
}


function goDelFileForm(){
 

	var str1=$("[name=checkPwForm]").find("[name=emp_password]").val()
	var str2=$("[name=fileListForm]").find("[name=emp_no]").val()
	
	var emp_password="emp_password="+str1
	var emp_no="&emp_no="+str2
	
  	if(is_empty($("[name=checkPwForm]").find("[name=emp_password]"))){
		alert("비밀번호를 입력해 주세요.");
		$("[name=checkPwForm]").find("[name=emp_password]").focus();
		return;
	}

	 //.serialize()는 form 태그에 적용되는 메소드 
	$.ajax({
		// 접속할 서버 쪽 URL 주소 설정
		url : "/z_spring/filetDelProc.do"
		// 전송 방법 설정
		, type : "post"
		// 서버로 보낼 파라미터명과 파라미터값을 설정
		, data : emp_password+emp_no
		// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
		// 매개변수 boardRegCnt 에는 입력 행의 개수가 들어온다.
		, success : function(comenDelCnt){
			// 게시판 입력 행 적용 개수가 1개면(=insert가 한번 성공했다는 뜻)
			if(comenDelCnt == 1){

				location.replace("/z_spring/fileListForm.do");
				
			}else if(comenDelCnt == -2){
				alert("비밀번호가 틀립니다. 재입력 바랍니다.");
				$("#popup").find("[name=emp_password]").focus();
			}			
			// 게시판 새글 입력 행 적용 개수 가 1개가 아니면 경고하기
			else{
				alert("댓글 삭제 실패! 관리자에게  문의 바랍니다.");
			}
		}
		// 서버의 응답을 못받았을 경우 실행할 익명함수 설정.
		, error : function(request,status,error){
			alert("서버 접속 실패");
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			 
		}
	});

 
	
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
function goFileListForm(){
	location.replace("/z_spring/fileListForm.do");
}

  //파일다운
function goFiledownForm(temp_name){
 
	 /* var filePath = "C:/stu_2020.02.12_KSJ/z_spring/WebContent/WEB-INF/resources/imagecollection/"+emp_pic;*/
 	var filePath = "C:/imagecollection/"+temp_name;  

    var fileName = temp_name
                
    location.href = "/z_spring/filedown.do?filePath="+filePath+"&fileName="+fileName;
 
	//var str="emp_pic="+emp_pic
	//location.replace("/z_spring/filedown.do?"+str);
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
									 	<!--  <li><a style="cursor:pointer" onClick="goJoinForm()">SignUp</a></li> -->
									 	<!-- <li><a style="cursor:pointer" onClick="goFileForm()">File Upload</a></li> -->
									 	<li><a style="cursor:pointer" onClick="goFileListForm()">FileList</a></li>
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
				<input type="hidden" name="emp_no" value="${fileUpDTO.emp_no}"> 
				<input type="hidden" name="emp_password" value="${fileUpDTO.emp_password}">
				<table name=fileContentForm class="boardTable table">
				<tbody>
				<tr>
					<td width="20%" align=center><b>번호
					<td align=center><b><c:out value="${count_no}" escapeXml="true" default="${count_no}"/>
 	 			<tr>
 	 				<td width="20%" align=center><b>제목
					<td align=center><b><c:out value="${fileUpDTO.emp_name}" escapeXml="true" default="${fileUpDTO.emp_name}"/>
				<tr>
 	 				<td width="20%" align=center><b>작성자
					<td align=center><b><c:out value="${fileUpDTO.emp_email}" escapeXml="true" default="${fileUpDTO.emp_email}"/>
				<tr>
 	 				<td width="20%" align=center><b>파일 이름<br>(파일 개수 : <c:out value="${file_cnt}" escapeXml="true" default="${file_cnt}"/>개)
			 		<td name=file_name align=center><b>
<%-- 			 <c:out value="${fileUpDTO.file_name.get(0).values()}" escapeXml="true" default="${fileUpDTO.file_name}"/>
 --%>			  
 			 
 				 	  	<c:forEach items="${fileName}" var="filename"  varStatus="status">
 				 	  		<div style='display: flex;' align='left'>
							<c:out value="${filename}" escapeXml="true" default="${file_name}"/>
							 
							<button type="button" onClick="goFiledownForm('${temp_name[status.index]}')">파일 다운받기</button><br>
							</div>
						</c:forEach> 
				 
		 
                        <br>
<%--                                <button type="button" class="btn btn-primary" onClick="goFiledownForm('${fileUpDTO.file_name[0]}')">모두 다운받기</button>
 --%>
 				</tbody>	
			</table>
	
	
	<div align="right">
	<!-- 	<button type=button class="btn btn-info" href="javascript:" onClick="imagePopup('open')" >
			삭제
		</button> -->
		<button class="btn btn-info"  onClick="goFileListForm()" type="button">
			목록보기
		</button>
			</div> 
	</form>
<!-- 본문글 비밀번호 확인 -->
<div id="layer" style="display:none">    <!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
    <div id="popup">
        <!-- 팝업창 닫기 버튼 -->
 
        <h3>비밀번호 입력</h3> 
      
        <form name="checkPwForm">
        <!--input 타입  1개일때는 엔터키가 먹지 않음  -->
	        <input type=password id=emp_password name=emp_password  onkeyup="enterkey();" >
	        <input type="hidden" name="emp_no" value="${fileUpDTO.emp_no}">  
 			<input type="text" style="display: none;">
        <div align=right>
        	<button class="btn btn-info"  onClick="goDelFileForm()"type=button >확인</button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-info"  type=button   onClick="imagePopup('close')">닫기</button>&nbsp;&nbsp;&nbsp; 
        </div>
         </form>
    <div>
</div>



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