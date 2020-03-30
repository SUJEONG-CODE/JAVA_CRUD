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
 
</head>

	<script> 
 


	function reset_exceptId(){
		$("[name=writer]").val('');
		$("[name=subject]").val('');
		$("[name=content]").val('');
		$("[name=pwd]").val(''); 
		$("[name=subject]").focus();   

	}
	 //나중에 지워야함.
	 
				 
	  $(document).ready(function(){


 		  $('[name=uploadBtn]').change(function (e){
 			 
		  if(document.getElementById("uploadBtn").value!=""){
			 
			    var fileSize = document.getElementById("uploadBtn").files[0].size;
			    var maxSize = 2 * 1024 * 1024;//2MB
		 
			    if(fileSize > maxSize){
			       alert("첨부파일 사이즈는 2MB 이내로 등록 가능합니다. ");
			       return;
			    }
		 
		  }


		 });


		  $("a[name='file-delete']").on("click", function(e) {
	          e.preventDefault();
	          deleteFile($(this));
	      });
			  
 
		
		  
		$("[name=writer]").val("abc");
		$("[name=subject]").val("QQQ");  
	  	 $("[name=content]").val(" TEST용 가상 내용 ");  
		$("[name=pwd]").val("QQQ11@");  


		//==================================================================
		//글자수 제한 유효성 검사 시작
	 
 		//이름 유효성 검사하기------------------------------------------
		$('#regTable').find('[name=writer]').keyup(function (e){
		    var content = $(this).val();
		       
		    if(is_empty("[name=writer]") && content.length>0){
				alert("작성자를 입력해 주세요.");
				$(this).val(content.substring(0, 0)); 
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

 		if(is_empty("[name=writer]")&&content.length>0){
			alert("작성자를 입력해 주세요.");
			$(this).val(content.substring(0, 0)); 
			$("[name=writer]").focus();
			return;
		}else if(content.length > 10){
			 alert("최대 10자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 10));      
		        $('#regTable').find('[name=writer]').focus();
		        return;
			}   
 
  
	});

 	 /*
 	$('#regTable').find('[name=writer]').blur(function (e){

		 var content = $(this).val();  

		if (content.length > 10){
   	 
			 alert("최대 10자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 10));      
	        $('#regTable').find('[name=writer]').focus();
	        return;
		      
   	}  
	});


	
 	
		$('#regTable').find('[name=writer]').focusout(function (e){
		    var content = $(this).val();

		    if (content.length > 10){
		    	if(is_empty("[name=writer]")){
					alert("작성자를 입력해 주세요.");
					$(this).val(content.substring(0, 0)); 
					$("[name=writer]").focus();
					return;
				}else{
					 alert("최대 10자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 10));      
			        $('#regTable').find('[name=writer]').focus();
			        return;
				}      
		    }  
		});
 */
	 
 
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


		//비밀번호 유효성 검사하기
		$('#regTable').find('[name=pwd]').keyup(function (e){
		    var content = $(this).val();
		    if (content.length > 10){
		        alert("최대 10자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 10));      
		        $('#regTable').find('[name=pwd]').focus();
		    } 
		});
		 $('#regTable').find('[name=pwd]').blur(function (e){
		    var content = $(this).val();
		    if (content.length > 10){
		        alert("최대 10자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 10));      
		        $('#regTable').find('[name=pwd]').focus();
		    } 
		});  
		$('#regTable').find('[name=pwd]').focusout(function (e){
		    var content = $(this).val();
		    if (content.length > 10){
		        alert("최대 10자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 10));      
		        $('#regTable').find('[name=pwd]').focus();
		    } 
		});
 
 
 
 
	});  

	//파일리스트
	  function goFileListForm(){
	  	location.replace("/z_spring/fileListForm.do");
	  }
	  	
 
		//=======================================================================
			// 게시판 등록 화면  에 입력된 데이터 유효성 체크 함수 선언
		//=======================================================================
			function checkBoardRegForm(){

				 
				
				if(is_empty("[name=writer]")){
					alert("작성자를 입력해 주세요.");
					$("[name=writer]").focus();
					return;
				}
				 
				if(is_empty("[name=subject]")){
					alert("제목을 입력해 주세요.");
					$("[name=subject]").focus();
					return;
				}
				/* if(is_empty("[name=email]")){
					alert("이메일을 입력해 주세요.");
					$("[name=email]").focus();
					return;
				}
				if( is_valid_email("[name=email]")==false ){
					alert("이메일 형식을 벗어납니다.");
					return;
				} */
				/* return; */
				if(is_empty("[name=content]")){
					alert("내용 입력해 주세요.");
					 
					$("[name=content]").focus();
					return;
				}
				if(is_valid_pattern("[name=pwd]", /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9]){10}$/) == false){
					alert("6자~10자 사이에 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요.");
					$("[name=pwd]").focus();
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
	 
 
				
			/* 	if(confirm('정말 저장하시겠습니까?') == false){
					return;
				}
				 */
				
				/* alert( $('[name=boardRegForm]').serialize() );
				return;
				 */
				//===========================================================================
				// 현재 화면에서 페이지 이동 없이 서버쪽 "/z_spring/boardRegProc.do"를 호출하여 
				// 게시판 글을 입력하고 [게시판 입력 행 적용 개수]를 받기
				//===========================================================================

			 				
				 var form = $('[name=boardRegForm]')[0];
     
    			var formData = new FormData(form);



    			  
    		    $.ajax({
    		        url: "/z_spring/boardRegProc.do",
    		                processData: false,
    		                contentType: false,
    		                data: formData,
    		                type: 'POST',
    		                success: function(result){
    		                    alert("완료되었습니다.");
    		                
    		                    location.replace('/z_spring/boardListForm.do');

    		                }
    		               //서버의 응답을 못 받았을 경우 실행할 익명함수 설정
    		           , error : function(){
    		              alert("서버 접속 실패");
    		           }
    		    });  


    		/*     
    
				$.ajax({
					// 접속할 서버 쪽 URL 주소 설정
					url : "/z_spring/boardRegProc.do"
					// 전송 방법 설정
					, type : "post"
					// 서버로 보낼 파라미터명과 파라미터값을 설정
					, data : $("[name=boardRegForm]").serialize()
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
					// 매개변수 boardRegCnt 에는 입력 행의 개수가 들어온다.
					, success : function(boardRegCnt){
						// 게시판 입력 행 적용 개수가 1개면(=insert가 한번 성공했다는 뜻)
						if(boardRegCnt == 1){
							/* alert(boardRegCnt);  
							//alert("게시판 글 등록 성공!");
							location.replace('/z_spring/boardListForm.do');
						}
						// 게시판 새글 입력 행 적용 개수 가 1개가 아니면 경고하기
						else{
							alert("게시판 글 등록 실패! 관리자에게  문의 바랍니다.");
						}
					}
					// 서버의 응답을 못받았을 경우 실행할 익명함수 설정.
					, error : function(){
						alert("서버 접속 실패");
					}
				}); */
			}

 
		
		//회원가입
		function goJoinForm(){
			location.replace("/z_spring/joinForm.do");
		}	
		
		//게시판 목록
		function goBoardListForm(){
			location.replace("/z_spring/boardListForm.do");
		}	




		var cnt=1;
/* 

		for(int i=0; i<$("input[name=uploadBtn]").length; i++){

			var fileCheck = document.getElementById("uploadBtn").value;

			 alert(fileCheck)
			 if(!fileCheck){
				alert("파일을 등록해주세요.");
				 
				return false;
			}


		}
		 */
		
 

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

 
	
		 if($("input[name=uploadBtn]").length<5){
			 
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


		
		
   </script>
   
   
   

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
   </div>Banner area end 
 -->

   <section id="main-container" class="main-container">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="isotope-nav" data-isotope-nav="isotope">
				<!-- ============================================== -->
				<!-- 게시판 검색 조건 관련 입력 양식 삽입된  form 태그 선언하기. -->
				<!-- ============================================== -->
				<form method="post" name="boardRegForm" action="/z_spring/boardRegProc.do">
					
						<!-- 파라미터명이 b_no 인 파라미터값을 저장할 hidden 태그 선언. //EL 태그는 값이 없으면 저장되지 않는다. -->
					<!-- b_no 가 int형이면 새글쓰기 할 때 값이 없게 전달되는데 자동으로 null을 넣어주게되며 이 때 DTO 안의 b_no 값의 자료형과 null의 자료형이 맞지않아 오류가 발생 -->
					<!-- 댓글 쓸 경우 b_no 라는 파라미터명에는 엄마글의 글번호가 들어온다. -->
					<input type="hidden" name="b_no" value="${(empty param.b_no)?0:param.b_no}">
					<input type="hidden" name="readcount" value="${(empty param.readcount)?0:param.readcount}">
					<!-- ----------------------------------------------------------------------------- -->
					<!-- 
						커스텀태그의 일종인 JSTL C코어 태그를 사용하여 
						파라미터명이 b_no 인 파라미터값이 비어있으면 새글쓰기를 출력하고
						파라미터명이 b_no 인 파라미터값이 있으면 댓글쓰기 출력하기.
					 -->
					<!-- ----------------------------------------------------------------------------- -->
					<c:if test="${empty param.b_no}">
					<center><h3>[새 글쓰기]</h3></center><br>
					</c:if>
					<c:if test="${param.b_no>0}">
					<center><h3>[답글 쓰기]</h3></center><br>
					</c:if>
					
					<!-- 또 다른 커스텀 태그의 if구문 -->
					<!-- 위 코드는 아래 코드 처럼도 가능하다. -->
					<%-- 
					<c:choose>
						<c:when test="'${empty param.b_no}">
							<b>[새 글쓰기]</b><br>
						</c:when>
						<c:otherwise>
							<b>[댓글 쓰기]</b><br>
						</c:otherwise>
					</c:choose> 
					 --%>
					<div class="container">
					<table class="table table-condensed" id="regTable">
						<tr>	
							<th class="active">작성자 
							<td><input type="text"  size="30"  name="writer" class="form-control">
						<tr>
							<th class="active">제목
							<td><input type="text" size="40"   name="subject" class="form-control">
						<!-- <tr>
							<th class="active">이메일
							<td><input type="text" size="40"   name="email" class="form-control"> -->
						<tr>
							<th class="active">내용
							<td><div style="white-space:pre-wrap;"><textarea id="content" name="content" rows
							="13" cols="40"  placeholder="내용을 입력해주세요(최대 1000자)" class="form-control"></textarea></div>
							<span style="color:#aaa; text-align: right;" name="counter">(0 / 최대 1000자)</span>
							
						<tr>
							<th class="active">파일 업로드
							<td>
							<div style="color:#aaa; text-align: left;" class='helpA'><br>"파일업로드는 최대 5개까지 가능합니다"</div><br>
							<div class="form-group" id="file-list">
                          
 								  <div align='right'>
<!--  								  	<a style='text-decoration: none; color: blue;' href="#this" onclick="addFile(this.form)">파일추가 </a>
 --> 								  	<input type="button" value=파일추가 onclick="addFile();">
 								  </div>  
 	 
	 							 <div class="file-group">
						           <input type="file" id="uploadBtn" class=1 name="uploadBtn"> 
						        </div>  
						        
					        <br>
							</div>
							
								
						<tr>
					
							<th class="active">비밀번호
							<td><input type="password" size="10" name="pwd" class="form-control">
							<div style="color:#aaa; text-align: left;" class='helpA'><br>"6자~10자 사이에 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요."</div>
							
					</table>
					</div>
					 
					<div align="right"> 
					<!--	<input type="button" value="저장"  onClick="checkBoardRegForm()" class="button">
				 	<input type="reset" value="다시작성" class="button">
					<input type="button" value="목록보기" onClick="location.replace('/z_spring/boardListForm.do')" class="button">
					 -->
					<button class="btn btn-info" type="button" onClick="checkBoardRegForm()"  >
						저장
					</button>
					<button class="btn btn-info" type="button" onClick="reset_exceptId()">
						다시작성
					</button>
					<button class="btn btn-info"  onClick="location.replace('/z_spring/boardListForm.do')"  type="button">
						목록보기
					</button>
					
					
					</div>
				</form>
               
                   
               </div><!-- Isotope filter end -->
            </div><!-- Filter col end -->
         </div><!-- Filter row end -->

         <div id="isotope" class="isotope">
 
            </div><!-- Isotop end -->

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