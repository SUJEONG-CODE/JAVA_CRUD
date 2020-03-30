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
    
	    
	<!-- 만약에 상세보기할 게시판 글이 없으면 경고 하고 이전화면으로 이동하기. -->
	<!-- boardDTO 이스펠링이 ModelAndView 객체에 저장된 것과 같아야 한다. -->
	<c:if test="${empty boardDTO}">
		<script>
			alert("게시판 글이 삭제 되었습니다.");
			/* history.go(-1); */
			location.replace("/z_spring/boardListForm.do");
		</script>
	</c:if>
	    
 
    
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
		
 

#file { display:none; } 

 

 
</style>  
<script>





		$(document).ready(function(){	

 
			 
		/* 		<div style='display: flex;' class='form-group filenamecnt' name="${status.index}" >
				<c:out value="${onlyFileName}" escapeXml="true" default="${onlyFileName}" />
						<span style='text-align: right;'>

						 	<a style='text-decoration: none; color: blue; cursor:pointer;' onclick="deleteFileData(${status.index})">삭제 </a>
						 
						</span>
		     
				</div>
			  */
			//==================================================================
			//글자수 제한 유효성 검사 시작
	
 		//이름 유효성 검사하기------------------------------------------
		$('#regTable').find('[name=writer]').keyup(function (e){
		    var content = $(this).val();
		       
		    if(is_empty("[name=writer]") &&content.length>0){
				alert("작성자를 입력해 주세요.");
				$(this).val(''); 
				$("[name=writer]").focus();
				return;
			}else if(content.length > 10){
	   			alert("최대 10자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 10));      
		        $('#regTable').find('[name=writer]').focus();
		        return;
 
			}
			  
		 
		});

 
	 
 	$('#regTable').find('[name=writer]').blur(function (e){

 		 var content = $(this).val();  

 		if(is_empty("[name=writer]") &&content.length>0){
			alert("작성자를 입력해 주세요.");
			$(this).val(''); 
			$("[name=writer]").focus();
			return;
		}else if(content.length > 10){
			 alert("최대 10자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 10));      
		        $('#regTable').find('[name=writer]').focus();
		        return;
			}   
 
  
	});


 			


		//제목 유효성 검사하기-------------------------------------------
	
		$('#regTable').find('[name=subject]').keyup(function (e){
		    var content = $(this).val();


		    if(is_empty("[name=subject]")&&content.length>0){
				alert("제목를 입력해 주세요.");
				$(this).val(content.substring(0, 0)); 
				$("[name=subject]").focus();
				return;
			}else if (content.length > 30){
 
					 alert("최대 30자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 30));      
			        $('#regTable').find('[name=subject]').focus();
			        return;
				}      
		    
		});

				
		 $('#regTable').find('[name=subject]').blur(function (e){
			    var content = $(this).val();
		
		
			    if(is_empty("[name=subject]")&&content.length>0){
					alert("제목를 입력해 주세요.");
					$(this).val(content.substring(0, 0)); 
					$("[name=subject]").focus();
					return;
				}else if (content.length > 30){
		
						 alert("최대 30자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 30));      
				        $('#regTable').find('[name=subject]').focus();
				        return;
					}      
			    
			});

	
 
	 
		//---------------------------------------------------------
		//내용 글자수 검사하는 유효성 검사
		 
		$('#regTable').find('[name=content]').keyup(function (e){
		    var content = $(this).val();
		    $('#regTable').find('[name=counter]').html("("+content.length+" / 최대 1000자)");    //글자수 실시간 카운팅

		    if(is_empty("[name=content]")&&content.length>0){
				alert("내용를 입력해 주세요.");
				$(this).val(content.substring(0, 0));
				$('#regTable').find('[name=counter]').html("( 0 / 최대 1000자)");  
				$("[name=content]").focus();
				return;
			} else if (content.length > 1000){
		    	 
					 alert("최대 1000자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 1000));   
			        $('#regTable').find('[name=counter]').html("(1000 / 최대 1000자)");   
			        $('#regTable').find('[name=content]').focus();
			        return;
				     
		    } 
		    
		  
		});
		$('#regTable').find('[name=content]').blur(function (e){
		    var content = $(this).val();
		    $('#regTable').find('[name=counter]').html("("+content.length+" / 최대 1000자)");    //글자수 실시간 카운팅

		    if(is_empty("[name=content]")&&content.length>0){
				alert("내용를 입력해 주세요.");
				$(this).val(content.substring(0, 0));
				$('#regTable').find('[name=counter]').html("( 0 / 최대 1000자)");  
				$("[name=content]").focus();
				return;
			} else if (content.length > 1000){
		    	 
					 alert("최대 1000자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 1000));   
			        $('#regTable').find('[name=counter]').html("(1000 / 최대 1000자)");   
			        $('#regTable').find('[name=content]').focus();
			        return;
				     
		    } 
		    
		  
		});
 
 
	 

	 
			//==================================================================
		});

//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
	// 게시판 수정/삭제 화면 에 입력된 데이터의 유효성 체크 함수 선언
	//nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
	function checkBoardUpDelForm(upDel){
		// 매개변수로 들어온 upDel 에 "del" 이 저장되었으면
		// 즉, 삭제버튼을 눌렀으면 암호 확인하고 삭제 여부를 물어보기.
		if(upDel=="del"){
		//name=upDel 을 가진 양식에 "del" 저장하기.
			// <주의> 아래 코드를 생략하면 일어나는 일
			//--------------------------------
				// 수정버튼을 누르고 취소하게 되면 name=upDel에 "up" 들어간다.
				// 그리고 삭제버튼을 누르면 name=upDel 에 "up"이 들어간 상태에서 
				//  삭제가 진행되므로 올바른 삭제가 진행되지 않는다.
				
			$("[name=upDel]").val("del");

			if( is_empty("[name=writer]") ){
				alert("작성자를 입력해 주세요");
				$("[name=writer]").focus();
				return;
			}

			if( is_empty("[name=subject]") ){
				alert("제목를 입력해 주세요");
				$("[name=subject]").focus();
				return;
			}
			
			
			if( is_empty("[name=content]") ){
				alert("내용를 입력해 주세요");
				$("[name=content]").focus();
				return;
			}
 
			
			
			  //if(confirm("정말 삭제 하시겠습니까?")==false){ return; } 
			//location.replace('/z_spring/boardListForm.do');
		}
		// 매개변수로 들어온 upDel에 "up" 이 저장되었으면
		// 즉 수정 버튼을 눌렀으면 각 입력양식의 유효성 체크하고 수정 여부 물어보기.
		else if(upDel=="up"){
		//name=upDel 을 가진 양식에 "up" 저장하기.
		// <주의> 아래 코드를 생략하면 일어나는 일
		//--------------------------------
			// 삭제버튼을 누르고 취소하게 되면 name=upDel에 "del" 들어간다.
			// 그리고 수정버튼을 누르면 name=upDel 에 "del"이 들어간 상태에서 
			//  수정이 진행되므로 올바른 수정이 진행되지 않는다.
			$("[name=upDel]").val("up");

			if( is_empty("[name=writer]") ){
				alert("작성자를 입력해 주세요");
				$("[name=writer]").focus();
				return;
			}
		 
  			if(is_empty("[name=subject]")){
  				alert("제목을 입력해 주세요.");
  				$("[name=subject]").focus();
  				return;
  			}
  			

			if( is_empty("[name=subject]") ){
				alert("제목를 입력해 주세요");
				$("[name=subject]").focus();
				return;
			}
			
			
			if( is_empty("[name=content]") ){
				alert("내용를 입력해 주세요");
				$("[name=content]").focus();
				return;
			}

			 for(var i=0; i<$("input[name=uploadBtn]").length; i++){

				 var files = new Array();	
			     files = document.getElementsByName("uploadBtn");
			     var file= files[i].value; 
			    
			     if(!file){
			 
			    	 alert("파일을 등록해주세요.");
			    	 return;
			     }
			 }
 
  			
		}


		 var form = $('[name=boardUpDelForm]')[0];
	     
			var formData = new FormData(form);



			  
		    $.ajax({
		        url: "/z_spring/boardUpDelProc.do",
		                processData: false,
		                contentType: false,
		                data: formData,
		                type: 'POST',
		                success: function(upDelCnt){
		                	if( upDel=="up"){
								
								if(upDelCnt == 1){
									//alert("게시글의 수정이 완료되었습니다.");
								 	location.replace('/z_spring/boardListForm.do');
								}
								else if(upDelCnt==-1){
									alert("게시글이 삭제되어 수정할 수 없습니다.");
								}
								else if(upDelCnt==-2){
									alert("비밀번호가 잘못 입력 되었습니다.");
								}
								else {
									alert("서버쪽 DB 연동 실패!");
								}
								
						}
							else if(upDel=="del"){
								if(upDelCnt == 1){
									//alert("게시글의 삭제가 완료되었습니다.");
								 	location.replace('/z_spring/boardListForm.do');
								}
								else if(upDelCnt==-1){
									alert("이미 삭제된 게시물입니다.");
								}
								else if(upDelCnt==-2){
									alert("비밀번호가 잘못 입력 되었습니다.");
								}
								else if(upDelCnt==-3){
									alert("댓글이 있어 삭제 불가능합니다.");
								}
								else {
									alert("서버쪽 DB 연동 실패!");
								}
		 					}

		                }
		               //서버의 응답을 못 받았을 경우 실행할 익명함수 설정
		           , error : function(){
		              alert("서버 접속 실패");
		           }
		    });  



}    
		/* //======================================================================
		// 현재 화면에서 페이지 이동없이 서버쪽 /z_spring/boardUpDelProc.do를 호출하여
		// 게시판 수정 또는 삭제 적용 개수를 받는다.
		//======================================================================
		$.ajax({
			// 호출할 서버쪽 URL 주소 설정
			url : "/z_spring/boardUpDelProc.do"	
			// 전송할 방법 설정
			, type : "post"
			// 서버로 보낼 파라미터명과 파라미터값을 설정.		serialize = 파라미터명과 파라미터값을 잘 만들어줌.
			, data : $("[name=boardUpDelForm]").serialize()
			// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			// 매개변수 upDelCnt 에는 게시판 수정 또는 삭제 적용 개수가 들어온다.
			, success : function(upDelCnt){
				if( upDel=="up"){
						
						if(upDelCnt == 1){
							//alert("게시글의 수정이 완료되었습니다.");
						 	location.replace('/z_spring/boardListForm.do');
						}
						else if(upDelCnt==-1){
							alert("게시글이 삭제되어 수정할 수 없습니다.");
						}
						else if(upDelCnt==-2){
							alert("비밀번호가 잘못 입력 되었습니다.");
						}
						else {
							alert("서버쪽 DB 연동 실패!");
						}
						
				}
					else if(upDel=="del"){
						if(upDelCnt == 1){
							//alert("게시글의 삭제가 완료되었습니다.");
						 	location.replace('/z_spring/boardListForm.do');
						}
						else if(upDelCnt==-1){
							alert("이미 삭제된 게시물입니다.");
						}
						else if(upDelCnt==-2){
							alert("비밀번호가 잘못 입력 되었습니다.");
						}
						else if(upDelCnt==-3){
							alert("댓글이 있어 삭제 불가능합니다.");
						}
						else {
							alert("서버쪽 DB 연동 실패!");
						}
 					}
				}
			// 서버의 응답을 못받을 경우 실행할 익명함수 설정.
			, error : function(){
			alert("서버 접속 실패");
		}
			
		}); 
		
	}*/
	
 

		//회원가입
		function goJoinForm(){
			location.replace("/z_spring/joinForm.do");
		}	

		//게시판 목록
		function goBoardListForm(){
			location.replace("/z_spring/boardListForm.do");
		}


		function deleteFileData(cntFile){
			 
			 var countNum=cntFile
			 $("[name="+countNum+"]").remove();
			// alert($(this).parent().siblings().val());
		 
		}

		function alldeleteFileData(){
			$("[name=file_name]").remove();
			}

		var cnt=1;


		//파일 추가
		function addFile() {


			 for(var i=0; i<$("input[name=uploadBtn]").length; i++){

				 var files = new Array();	
			     files = document.getElementsByName("uploadBtn");
			     var file= files[i].value; 
			    
			     if(!file){
			    	 alert("파일을 등록해주세요.");
			    	 return;
			     }
			 }

			 if($("input[name=uploadBtn]").length+$(".filenamecnt").length<5 ){
					cnt++;	
					     var str = "<div style='display: flex;' class='form-group'><input type='file' id='uploadBtn' class="+cnt+" name='uploadBtn'><span style='text-align: left;'><a style='text-decoration: none; color: blue;' href='#this' name='file-delete'>삭제</a></div> ";
					     $("#file-list").append(str);
					     $("[name='file-delete']").on("click", function(e) {
					    	    e.preventDefault();
					    	    deleteFile($(this));		    	   
					    	}); 		
				}else{
		
					alert("파일 업로드 횟수가 초과하였습니다.");
					cnt=$("input[name=uploadBtn]").length;
					  
				}
		}


		
		function deleteFile(obj) {
	 
		    obj.parent().parent().remove();
		  
		}
		
		function fileDeleteOriginal(){

			$("[name=fileDeleteOriginal]").remove();

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
									 	<!-- <li><a style="cursor:pointer" onClick="goJoinForm()">SignUp</a></li> -->
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
		<!--/ Header end -->
<!-- 
   <div id="banner-area" class="banner-area" style="background-image: url('resources/loginBootstrap/images/bg-01.jpg');">
      <div class="banner-text">
         <div class="container">
            <div class="row">
               <div class="col-xs-12">
                  <div class="banner-heading">
                     <h1 class="banner-title">PORTFOLIO</h1>
 
                  </div>
               </div>Col end
            </div>Row end
         </div>Container end
      </div>Banner text end
   </div>Banner area end  -->


   <section id="main-container" class="main-container">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="isotope-nav" data-isotope-nav="isotope">
				<!-- ============================================== -->
				<!-- 게시판 검색 조건 관련 입력 양식 삽입된  form 태그 선언하기. -->
				<!-- ============================================== -->
				<%-- 
				<form method="post" name="boardUpDelForm" action="/z_spring/boardUpDelForm.do">
					<b>[ 글 수정/삭제 ]</b><br>
					<table class="tbcss1" border=1 bordercolor=gray cellspacing=0; cellpadding=5 align=center>
						<tr>
							<th bgcolor="gray">이름
							<td><input type="text" size="10" maxlength="10" name="writer" value="${ boardDTO.writer }">
						<tr>
							<th bgcolor="gray">제목
							<td><input type="text" size="40" maxlength="50" name="subject" value="${ boardDTO.subject }">
						<tr> 
							<th bgcolor="gray">이메일
							<td><input type="text" size="40" maxlength="30" name="email" value="${ boardDTO.email }">
						<tr>
							<th bgcolor="gray">내용
							<td><textarea name="content" rows="13" cols="40"> ${boardDTO.content} </textarea>
						<tr>
							<th bgcolor="gray">비밀번호
							<td><input type="password" size="8" maxlength="12" name="pwd">
					</table>
					<!-- -------------------------------------------------------------------------------------------- -->
					<table><tr height=4><td></table>
					<!-- -------------------------------------------------------------------------------------------- -->
					<input type="hidden" value="upDel"  value="up">
					<input type="hidden" value="b_no"  value="${ boardDTO.b_no }">
					<!-- -------------------------------------------------------------------------------------------- -->
					<input type="button" value="수정"  onClick="checkBoardUpDelForm('up')">
					<input type="button" value="삭제"  onClick="checkBoardUpDelForm('del')">
					<input type="button" value="목록보기" onClick="location.replace('/z_spring/boardListForm.do')">
				</form>
				--%>
				 <!-- *************************************************************** -->
				 <!-- 스프링 폼태그를 사용하여 html의 form 태그와 입력양식관련 태그를 출력한다. -->
				 <!-- 이때 DTO 객체나 Map 객체 등과 연결하면 이 객체안의 데이터가 자동으로 입력양식에 삽입된다.-->
				 <!-- *************************************************************** -->
				 <c:if test="${!empty boardDTO}">
				 <!-- commandName="boardDTO" boardDTO 객체의  키값명이 null 값이 아니여야 실행 가능하기 때문에 위의 커스텀태그로 null값을 걸러내는 조건문을 작성해 줘야 한다. -->
				 <form:form method="post" name="boardUpDelForm" commandName="boardDTO" action="/z_spring/boardUpDelProc.do">
				 <%-- 위 스프링 폼태그는 아래처럼 변화되어 실행된다.
				 	<form name="boardUpDelForm" method="post" id="boardDTO" action="/z_spring/boardUpDelProc.do"> 
				 --%> <form:hidden path="group_no" className="group_no" class="form-control"/>
					 <form:hidden path="group_count" className="group_count" class="form-control"/>
					 <form:hidden path="comment_count" className="comment_count" class="form-control"/>
		 
					<form:hidden path="max_level" className="max_level" class="form-control"/>
					 <form:hidden path="print_level" className="print_level" class="form-control"/>
					 
					<div align="center"><h3>[ 글 수정/삭제 ]</h3><div><br><br>
					<div class="container">
					<table class="table table-condensed" id="regTable" name="regTable">
						<tr>
							<th class="active">작성자
							<td><form:input  path="writer" className="writer" class="form-control"/>
							 
							<!-- 아래처럼 변환되어 실행된다. -->
							<!-- <td><input id="writer" name="writer" className="writer" type="text" value="b"/> -->
						<tr>
							<th class="active">제목
							<td><form:input path="subject" className="subject" class="form-control"/>

						<tr>
							<th class="active">내용
							<td><form:textarea path="content" className="content" rows="13" cols="40" class="form-control" name="content" />
							<span style="color:#aaa; text-align: right;" name="counter">(0 / 최대 1000자)</span>
						<tr > 
							<th   rowspan=2 class="active">파일이름
							<td name=file_name align=center ><b>
 					 		<c:forEach items="${onlyFileName}" var="onlyFileName"  varStatus="status">
	 				 	  		<div style='display: flex;' class='form-group filenamecnt' name="${status.index}" >
							 	<c:out value="${onlyFileName}" escapeXml="true" default="${onlyFileName}"  />  
							<!--  		<script>
										var list= '<c:out value="${onlyFileName}" />';
										alert(list);
										for(var i=0; i<list.length; i++){
											 $("[name=file_name]").append("<div style='display: flex;' class='form-group filenamecnt'><input type=file  id=uploadBtn name=uploadBtn value="+list[i]+"><span style='text-align: right;'><a style='text-decoration: none; color: blue; cursor:pointer;' onclick=deleteFileData("+i+")>삭제 </a></span>")
											 $("[name=file_name]").append()
										}

							 		</script> -->
 		 								<span style='text-align: right;'>
 
<%-- 	 	 								 	<a style='text-decoration: none; color: blue; cursor:pointer;' onclick="deleteFileData(${status.index})">삭제 </a>
 --%>	  									 	 
	  									 
		 								</span>
							     
 								</div>
 							
		 							 
							</c:forEach>   
							 	<div align=right>
 
<%-- 	 	 								 	<a style='text-decoration: none; color: blue; cursor:pointer;' onclick="deleteFileData(${status.index})">삭제 </a>
 --%>	  									 	<a style='text-decoration: none; color: blue; cursor:pointer;' onclick="alldeleteFileData()">삭제 </a>
	  									 
 							 
 	 					<tr>
                        <td >
                           	<div style="color:#aaa; text-align: left;" class='helpA'><br>"파일업로드는 최대 5개까지 가능합니다"</div> 
                          
                           <div class="form-group" id="file-list">
                          
 								  <div align='right'>
<!--  								  	<a style='text-decoration: none; color: blue;' href="#this" onclick="addFile()">파일추가 </a>
 --> 									<input type="button" value=파일추가 onclick="addFile();">	  
 								</div>  
 	 
 							 <div style='display: flex;' class="file-group"  name="fileDeleteOriginal">
					           <input type="file" id="uploadBtn" class=1 name="uploadBtn"> 
					           <span style='text-align: left;'><a style='text-decoration: none; color: blue;' href='#this' onclick="fileDeleteOriginal()">삭제</a></span>
					        </div>  
					        <br>
 						 </div>
                          
                 
                        </td>
 	 							
 	 						 
		 
			
						<%-- <tr>
							<th class="active"">비밀번호
							<td><form:password path="pwd" className="pwd" class="form-control"/> --%>
					</table>
					</div>
					 	
					<input type="hidden" name="upDel"  value="up">
					<input type="hidden" name="b_no"  value="${ boardDTO.b_no }">
					<!-- -------------------------------------------------------------- -->
					 
					<div align="right">
<!-- 					<input type="button" value="수정"  onClick="checkBoardUpDelForm('up')">
					<input type="button" value="삭제"  onClick="checkBoardUpDelForm('del')">
					<input type="button" value="목록보기" onClick="location.replace('/z_spring/boardListForm.do')">
					<input type="button" value="목록보기" onClick="document.boardListForm.submit();">
					 -->
					
					<button class="btn btn-info" type="button" onClick="checkBoardUpDelForm('up')"  >
						수정
					</button>
					<button class="btn btn-info" type="button" onClick="checkBoardUpDelForm('del')"  >
						삭제
					</button>
				<!-- 	<button class="btn btn-info"  onClick="document.boardListForm.submit();"  type="button">
						목록보기
					</button> -->
					
					<button class="btn btn-info"  onClick="location.replace('/z_spring/boardListForm.do')"  type="button">
						목록보기
					</button>
					
					
					
					</div>
					<%-- <!-- ==================================================================================== -->
					<input type="text" name="keyword1" value="${ boardSearchDTO.keyword1 }">
					<input type="text" name="orAnd" value="${ boardSearchDTO.orAnd }">
					<input type="text" name="keyword2" value="${ boardSearchDTO.keyword2 }"> --%>
					
					
				</form:form>
				</c:if>
				<form name="boardListForm" method="post" action="/z_spring/boardListForm.do">
			         <input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
			         <input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
			    </form>
				
               </div><!-- Isotope filter end -->
            </div><!-- Filter col end -->
         </div><!-- Filter row end -->
 

      </div><!-- Conatiner end -->
   </section><!-- Main container end -->
	

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