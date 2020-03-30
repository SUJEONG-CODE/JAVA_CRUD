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
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
    
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


/* function checkCommentPwd(type){
	 alert(11)
		$(this).parents("[name=commentli]").hide();
		if(type == 'open') { 
			 alert(11)
			$(this).parents("[name=commentli]").hide();
	 
		 	//this.parent('#checkCommentPwd').show();
		} else if(type == 'close') {     
			//$('#commentList').find("[name=commentli]").show();
	    }
	}

 */
 

//본문글 비밀번호 확인하는 팝업 창
function imagePopup(type) {
			    if(type == 'open') {       
			        // 팝업창을 연다.
			        jQuery('#layer').attr('style','display:inline');	       
			    }else if(type == 'close') {     
			      // 팝업창을 닫는다.
			        jQuery('#layer').attr('style','display:none');
			    }		    
			    if( $("#popup").find("[name=pwd]").val()!=null){
			    		$("#popup").find("[name=pwd]").val('');   
				}
   			$("#popup").find("[name=pwd]").focus();
}
 
	    function enterkey() {
	        if (window.event.keyCode == 13) {
	 
	             // 엔터키가 눌렸을 때 실행할 내용
	        	var pwd1=document.getElementById('pwd').value;
				var writer1=document.getElementById('writer').value;
	 			var pwd2=document.getElementById('pwd1').value;
				var writer2=document.getElementById('writer1').value;
	 
				 if(pwd1==pwd2&&writer1==writer2){
					 document.boardUpDelForm.submit();
					 
				}else{
					alert("비밀번호가 틀립니다.재입력 바랍니다.")
	 				$("[name=pwd]").focus();

				}
	        }
		}



	    
	    function enterkey1() {
	        if (window.event.keyCode == 13) {
	        	 goCheckCommentPwd()
	       
	        }
		}
	    
 
$(document).ready(function(){
		  
				 $('[name=checkCommentPwd]').click(function() {
					 jQuery('#layer2').attr('style','display:inline');
					 $('#layer2').find("#popup").find("[name=comment_password]").focus();

					   if( $('#layer2').find("#popup").find("[name=comment_password]").val()!=null){
						   $('#layer2').find("#popup").find("[name=comment_password]").val('');   
					}
					   $('#layer2').find("#popup").find("[name=comment_password]").focus();
 

					   var str=$(this).parents("[name=commentli]").find("[name=b_no_comment]").val();
					   var str2=$(this).parents("[name=commentli]").find("[name=comment_count]").val();
					   var str3=$(this).parents("[name=commentli]").find("[name=b_no]").val();
					   var str4=$(this).parents("[name=commentli]").find("[name=subject]").val();
					   var str5=$(this).parents("[name=commentli]").find("[name=print_no]").val();
					   var str6=$(this).parents("[name=commentli]").find("[name=print_level]").val();

					   
					   
					   $("[name=checkPwForm3]").find("[name=b_no_comment]").val(str);
					   $("[name=checkPwForm3]").find("[name=comment_count]").val(str2);
					   $("[name=checkPwForm3]").find("[name=b_no]").val(str3);

					   $("[name=checkPwForm3]").find("[name=subject]").val(str4);
					   $("[name=checkPwForm3]").find("[name=print_no]").val(str5);
					   $("[name=checkPwForm3]").find("[name=print_level]").val(str6);
					   
				 });

			 
	/* 		
	
	
<!-- 본문글 비밀번호 확인 For 수정 -->
<div id="layer3" style="display:none">    <!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
    <div id="popup">
        <!-- 팝업창 닫기 버튼 -->
        <h3>비밀번호 입력 댓글 수정</h3> 
      
        <form name="checkPwForm4">
        <!--input 타입  1개일때는 엔터키가 먹지 않음  -->
	        <input type=password id=comment_password name=comment_password  onkeyup="enterkey1();" >
	        <input type=hidden id=b_no_comment name=b_no_comment >
 			<input type="text" style="display: none;">
        <div align=right>
        	  <button class="btn btn-info"   onClick="goCheckCommentPwd()"  type=button >확인</button>&nbsp;&nbsp;&nbsp;  
            <button class="btn btn-info"  type=button   onClick="closeCommentPwd()">닫기</button>&nbsp;&nbsp;&nbsp; 
        </div>
         </form>
    <div>
</div>

*/ 
$('[name=checkPwdForUp]').click(function() {
 
	 
				document.write('<div name="layer3" id="layer3" style="display:inline">');	 
				document.write('<div id="popup">');	
				document.write('<h3>비밀번호 입력 댓글 수정</h3>');
				document.write('<form name="checkPwForm4">');
				document.write('</form>'); 
				document.write('<div>'); 
				document.write('</div>'); 	 
		/* 			 
					 jQuery('#layer3').attr('style','display:inline');
			 
					 $('#layer3').find("#popup").find("[name=checkPwForm4]").find("[name=comment_password]").focus();
						 
					   if( $('#layer3').find("#popup").find("[name=checkPwForm4]").find("[name=comment_password]").val()!=null){
						   $('#layer3').find("#popup").find("[name=checkPwForm4]").find("[name=comment_password]").val('');   
					}
					   $('#layer3').find("#popup").find("[name=checkPwForm4]").find("[name=comment_password]").focus();
 

					   var str=$(this).parents("[name=commentli]").find("[name=b_no_comment]").val();

					   $("[name=checkPwForm4]").find("[name=b_no_comment]").val(str); */
});
 
				 

				 
				//비밀번호 유쵸성 검사 
			    $('#popup').find('[name=pwd]').keyup(function (e){
				    var content = $(this).val();
				    if (content.length > 10){
				        alert("최대 10자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 10));      
				        $('#popup').find('[name=pwd]').focus();
				    } 
				});
				 $('#popup').find('[name=pwd]').blur(function (e){
				    var content = $(this).val();
				    if (content.length > 10){
				        alert("최대 10자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 10));      
				        $('#popup').find('[name=pwd]').focus();
				    } 
				});  
				$('#popup').find('[name=pwd]').focusout(function (e){
				    var content = $(this).val();
				    if (content.length > 10){
				        alert("최대 10자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 10));      
				        $('#popup').find('[name=pwd]').focus();
				    } 
				});
    
				//비밀번호 유쵸성 검사 
			    $("[name=checkPwForm3]").find("[name=comment_password]").keyup(function (e){
				    var content = $(this).val();
				    if (content.length > 10){
				        alert("최대 10자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 10));      
				        $("[name=checkPwForm3]").find("[name=comment_password]").focus();
				    } 
				});
			    $("[name=checkPwForm3]").find("[name=comment_password]").blur(function (e){
				    var content = $(this).val();
				    if (content.length > 10){
				        alert("최대 10자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 10));      
				        $("[name=checkPwForm3]").find("[name=comment_password]").focus();
				    } 
				});  
			    $("[name=checkPwForm3]").find("[name=comment_password]").focusout(function (e){
				    var content = $(this).val();
				    if (content.length > 10){
				        alert("최대 10자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 10));      
				        $("[name=checkPwForm3]").find("[name=comment_password]").focus();
				    } 
				});
    
 
			
				//이름 유효성 검사하기------------------------------------------
				$('.commentTable').find('[name=writer]').keyup(function (e){
				    var content = $(this).val();
				       
				    if(is_empty($('.commentTable').find("[name=writer]"))&&content.length>0){
						alert("작성자를 입력해 주세요.");
						$(this).val(content.substring(0, 0)); 
						$("[name=writer]").focus();
						return;
					}else if(content.length > 10){
						alert("최대 10자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 10));      
				        $('.commentTable').find('[name=writer]').focus();
				        return;
			
					}
					  
				 
				});
			
			
			$('.commentTable').find('[name=writer]').blur(function (e){
			
				 var content = $(this).val();  
			
				if(is_empty($('.commentTable').find("[name=writer]"))&&content.length>0){
					alert("작성자를 입력해 주세요.");
					$(this).val(content.substring(0, 0)); 
					$("[name=writer]").focus();
					return;
				}else if(content.length > 10){
					 alert("최대 10자까지 입력 가능합니다.");
				        $(this).val(content.substring(0, 10));      
				        $('.commentTable').find('[name=writer]').focus();
				        return;
					}   
			
			
			});




			//비밀번호 유효성 검사하기
			$('.commentTable').find('[name=comment_password]').keyup(function (e){
			    var content = $(this).val();
			    if (content.length > 10){
			        alert("최대 10자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 10));      
			        $('.commentTable').find('[name=comment_password]').focus();
			    } 
			});
			 $('.commentTable').find('[name=comment_password]').blur(function (e){
			    var content = $(this).val();
			    if (content.length > 10){
			        alert("최대 10자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 10));      
			        $('.commentTable').find('[name=comment_password]').focus();
			    } 
			});  
			$('.commentTable').find('[name=comment_password]').focusout(function (e){
			    var content = $(this).val();
			    if (content.length > 10){
			        alert("최대 10자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 10));      
			        $('.commentTable').find('[name=comment_password]').focus();
			    } 
			});
	 


			
			//글자수 검사하는 유효성 검사 
			$('.commentTable').find('[name=comment_detail]').keyup(function (e){
	 
			    var content = $(this).val();
			    $('.commentTable').find('[name=counter]').html("("+content.length+" / 최대 300자)");    //글자수 실시간 카운팅
			
			    if (content.length > 300){
			        alert("최대 300자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 300));
			        $('.commentTable').find('[name=counter]').html("(300 / 최대 300자)");
			        
			        $('.commentTable').find('[name=counter]').focus();
				 }
			});
			//글자수 검사하는 유효성 검사끝
			$('.commentTable').find('[name=comment_detail]').mouseover(function (e){
		  
			    var content = $(this).val();
			    $('.commentTable').find('[name=counter]').html("("+content.length+" / 최대 300자)");    //글자수 실시간 카운팅

			    if (content.length > 300){
			        alert("최대 300자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 300));
			        $('.commentTable').find('[name=counter]').html("(300 / 최대 300자)");
			        $('.commentTable').find('[name=counter]').focus();
			    }
			});//글자수 검사하는 유효성 검사끝


		
			 
		 
		});

		function goBoardRegForm(){
			// name=boardDelForm 을 가진 form 태그의 action 값을 URL로 서버에 접속하라
			// post 방식이기 때문에 이렇게 코딩.
			document.boardRegForm.submit();
		}
 
				
	 //본문글 수정 삭제 시 비밀번호 확인 
		function goBoardUpDelForm(){

			if(is_empty("[name=pwd]")){
				alert("비밀번호를 입력해 주세요.");
				$("[name=pwd]").focus();
				return;
			}

			//var pwd1=$("[name=checkPwForm2]").find("[name=writer]").val()
			
			var pwd1=document.getElementById('pwd').value;
			var writer1=document.getElementById('writer').value;
 			var pwd2=document.getElementById('pwd1').value;
			var writer2=document.getElementById('writer1').value;

			 if(pwd1==pwd2&&writer1==writer2){
				 document.boardUpDelForm.submit();
				 
			}else{
				alert("비밀번호가 틀립니다.재입력 바랍니다.")
 				$("[name=pwd]").focus();

			}
 			 
		}

		function goCheckCommentPwd(){
 
			
			if(is_empty($("[name=checkPwForm3]").find("[name=comment_password]"))){
				alert("비밀번호를 입력해 주세요 .");
				$("[name=checkPwForm3]").find("[name=comment_password]").focus();
				return;
			}
				 
			var pwd1=document.getElementById('comment_password1').value;
 			var pwd2=document.getElementById('comment_password').value;
		 
 			 if(pwd1==pwd2){
					 
					goDelComentForm()
					
 			 }else{
 				alert("비밀번호 일치 하지 않음!!!");
				$('#layer2').find("#popup").find("[name=comment_password]").focus();
 	 		}
	 	
			/*  $.ajax({
				// 접속할 서버 쪽 URL 주소 설정
					url : "/z_spring/checkPwdComentProc.do"
					// 전송 방법 설정
					, type : "post"
					// 서버로 보낼 파라미터명과 파라미터값을 설정
					, data : $("[name=checkPwForm3]").serialize()
					// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
					// 매개변수 boardRegCnt 에는 입력 행의 개수가 들어온다.
					, success : function(checkPwComentCnt){
						// 게시판 입력 행 적용 개수가 1개면(=insert가 한번 성공했다는 뜻)
						if(checkPwComentCnt == 1){

							var str ="b_no=" + ${boardDTO.b_no} +"&" +"listNum=" + ${param.listNum}+"&" +"group_no=" + ${boardDTO.group_no}
							location.replace("/z_spring/boardContentForm.do?"+str);
							// name=boardDelForm 을 가진 form 태그의 action 값을 URL로 서버에 접속하라
							 
						}
						// 게시판 새글 입력 행 적용 개수 가 1개가 아니면 경고하기
						else{
							alert("비밀번호 일치 하지 않음!!!");
							$('#layer2').find("#popup").find("[name=comment_password]").focus();
						}
					}
					// 서버의 응답을 못받았을 경우 실행할 익명함수 설정.
					, error : function(request,status,error){
						alert("서버 접속 실패");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						 
					}
				 
			 }); */
			
		}

		function closeCommentPwd(){
			 jQuery('#layer2').attr('style','display:none');
		}
/*  ======================================================================================================= 
		function goBoardUpDelForm(){
			//alert(111)
			
			  var check_pw=prompt("비밀번호 입력 요망");
			//alert(check_pw);
			$("[name=checkPwForm]").find("[name=pwd]").val(check_pw)
		
		alert(check_pw)
		
		if(check_pw!=null){	 
 
		        $.ajax({
						// 접속할 서버 쪽 URL 주소 설정
						url : "/z_spring/checkPwProc.do"
						// 전송 방법 설정
						, type : "post"
						// 서버로 보낼 파라미터명과 파라미터값을 설정
						, data : $("[name=checkPwForm]").serialize()
						// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
						// 매개변수 boardRegCnt 에는 입력 행의 개수가 들어온다.
						, success : function(checkPwdCnt){
							// 게시판 입력 행 적용 개수가 1개면(=insert가 한번 성공했다는 뜻)
							if(checkPwdCnt == 1){
					
								// name=boardDelForm 을 가진 form 태그의 action 값을 URL로 서버에 접속하라
								document.boardUpDelForm.submit();
							}
							// 게시판 새글 입력 행 적용 개수 가 1개가 아니면 경고하기
							else{
								alert("비밀번호 일치 하지 않음!");
		
								//alert($("[name=checkPwForm]").find("[name=pwd]").val())
								 
								goBoardUpDelForm(); 
 
							}
						}
						// 서버의 응답을 못받았을 경우 실행할 익명함수 설정.
						, error : function(request,status,error){
							alert("서버 접속 실패");
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							 
						}
					});  
		}else{
			 return;
		}
			/*  ======================================================================================================= 
		}  */
		//회원가입
		function goJoinForm(){
			location.replace("/z_spring/joinForm.do");
		}	

		//게시판 목록
		function goBoardListForm(){
			location.replace("/z_spring/boardListForm.do");
		}



		function goContentForm(){
			alert('이동')
			location.replace("/z_spring/boardContentForm.do");
		}

		//파일리스트
		function goFileListForm(){
			location.replace("/z_spring/fileListForm.do");
		}

		
		//댓글 등록
		function goComentForm(){
			 
			if(is_empty($("[name=commentForm]").find("[name=writer]"))){
				alert("작성자 입력해주세요.");
				$("[name=commentForm]").find("[name=writer]").focus();
				return;
			}

			
			if(is_empty("[name=comment_password]")){
				alert("비밀번호를 입력해 주세요.");
				$("[name=pwd]").focus();
				return;
			}
			
  
 			if(is_empty("[name=comment_detail]")){
				alert("댓글을 입력해 주세요.");
				$("[name=comment_detail]").focus();
				return;
			}

 	
 			if(is_valid_pattern("[name=comment_password]", /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9]){10}$/) == false){
				alert("6자~10자 사이에 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요.");
				$("[name=pwd]").focus();
				return;
			}

			$.ajax({
				// 접속할 서버 쪽 URL 주소 설정
				url : "/z_spring/comentRegProc.do"
				// 전송 방법 설정
				, type : "post"
				// 서버로 보낼 파라미터명과 파라미터값을 설정
				, data : $("[name=commentForm]").serialize()
				// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
				// 매개변수 boardRegCnt 에는 입력 행의 개수가 들어온다.
				, success : function(commentRegCnt){
					// 게시판 입력 행 적용 개수가 1개면(=insert가 한번 성공했다는 뜻)
					if(commentRegCnt == 1){
						/* alert(boardRegCnt); */
						//alert("댓글 글 등록 성공!");

						var str ="b_no=" + ${boardDTO.b_no}+"&file_cnt="+${file_cnt} +"&listNum=" + ${param.listNum}+"&" +"group_no=" + ${boardDTO.group_no}
						location.replace("/z_spring/boardContentForm.do?"+str);

						
					}
					// 게시판 새글 입력 행 적용 개수 가 1개가 아니면 경고하기
					else{
						alert("댓글 등록 실패! 관리자에게  문의 바랍니다.");
					}
				}
				// 서버의 응답을 못받았을 경우 실행할 익명함수 설정.
				, error : function(request,status,error){
					alert("서버 접속 실패");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					 
				}
			});



		}
 
		function goDelComentForm(){

/* 	     var b_no="b_no="+b_no
		 var delB_no="&b_no_comment="+b_no_comment
		 var delB_code="&b_code="+b_code
		 var delC_code="&c_code="+c_code */
  
		var comment_password="comment_password="+$("[name=checkPwForm3]").find("[name=comment_password]").val();
 		var b_no_comment="&b_no_comment="+$("[name=checkPwForm3]").find("[name=b_no_comment]").val();
		var comment_count="&comment_count="+$("[name=checkPwForm3]").find("[name=comment_count]").val();
		var b_no="&b_no="+$("[name=checkPwForm3]").find("[name=b_no]").val();

		var subject="&subject="+$("[name=checkPwForm3]").find("[name=subject]").val();
		var print_no="&print_no="+$("[name=checkPwForm3]").find("[name=print_no]").val();
		var print_level="&print_level="+$("[name=checkPwForm3]").find("[name=print_level]").val();

	 
  
		 //.serialize()는 form 태그에 적용되는 메소드 
			$.ajax({
				// 접속할 서버 쪽 URL 주소 설정
				url : "/z_spring/comentDelProc.do"
				// 전송 방법 설정
				, type : "post"
				// 서버로 보낼 파라미터명과 파라미터값을 설정
				, data : comment_password+b_no_comment+comment_count+b_no+subject+print_no+print_level
				// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
				// 매개변수 boardRegCnt 에는 입력 행의 개수가 들어온다.
				, success : function(comenDelCnt){ 
					// 게시판 입력 행 적용 개수가 1개면(=insert가 한번 성공했다는 뜻)
					if(comenDelCnt == 1){
						 // alert(boardRegCnt); 
					   //alert(delthis.val());
				 
						  var str ="b_no=" + ${boardDTO.b_no} +"&file_cnt="+${file_cnt} +"&listNum=" + ${param.listNum}+"&" +"group_no=" + ${boardDTO.group_no}
						location.replace("/z_spring/boardContentForm.do?"+str);  
						//$("#commentList").find("[name=b_no_comment], [value="+b_no_comment+"]").parent().remove();
						//$("#commentList:has('[name=b_no_comment], [value=" + b_no_comment + "]')").remove();
 						//$("[name=totalComentCnt]").text("[총 개수] :"+${commentListAllCnt});

 						
						
					}else if(comenDelCnt == 2){
						location.replace("/z_spring/boardListForm.do");
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

		<!-- <div id="top-bar" class="top-bar">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
						<ul class="top-info">
 
						</ul>
					</div>
					/ Top info end

					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 top-social text-right">
						<ul class="unstyled">
							<li>
								 
							</li>
						</ul>
					</div>
					/ Top social end
				</div>
				/ Content row end
			</div>
			/ Container end
		</div> -->
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

<!--    <div id="banner-area" class="banner-area" style="background-image: url('resources/loginBootstrap/images/bg-01.jpg');">
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
				<!-- ModelAndView 객체에 "boardDTO" 라는 키값으로 저장된 BoardDTO 객체의 속성변수 안의 -->
				<!-- 데이터를 꺼내어 출력한다. -->
				<!-- 꺼내는 방법은 EL 문법으로 '$'{boardDTO.속성변수명} 이다. -->
				<!-- ============================================== -->
				<form class="boardContentForm" name="boardContentForm" method="post" action="/z_spring/boardRegForm.do">
					<c:if test="${boardDTO.subject eq ' ' }">
						<span>해당 게시물은 삭제되었습니다.</span></br>
					</c:if>
					<c:if test="${boardDTO.subject ne ' ' }">					
					<!-- value="${boardDTO.b_no} = 중요하다. -->
	 
					 <input type="hidden" name="b_no" value="${boardDTO.b_no}">
					 <input type="hidden" name="max_level" value="${boardDTO.max_level}">
					 <input type="hidden" name="print_level" value="${boardDTO.print_level}">
					 <input type="hidden" name="print_level" value="${boardDTO.group_count}">
					<div align="center"><h3>[ 글 상세보기 ]</h3><div><br><br>
					
					<div class="table-responsive">
					<table class="table">
					<%-- 	<tr>
							<th width=150>글번호
							<td >${boardDTO.b_no}
							 --%>
						<tr>
							<th width="20%"  >순서번호
							<td style="word-break:break-all"><%-- <c:out value="${boardDTO.RNUM}" escapeXml="true" default="${boardDTO.RNUM}"/> --%>
							<c:out value="${param.listNum}" escapeXml="true" default="${param.listNum}"/> 
 						
						<tr>	
							<th width="20%" align=center  >조회수
							<td style="word-break:break-all" ><c:out value="${boardDTO.readcount}" escapeXml="true" default="${boardDTO.readcount}"/>
			
						<tr >
							<th width="20%" align=center >작성자
							<td style="word-break:break-all" ><div style="white-space:pre-wrap;"><c:out value="${boardDTO.writer}" escapeXml="true" default="${boardDTO.writer}"/></div>
						<tr>	
							<th width="20%"  align=center >작성일
							<td style="word-break:break-all" ><c:out value="${boardDTO.reg_date}" escapeXml="true" default="${boardDTO.reg_date}"/>
			
						<tr>
							<th width="20%" align=center  >글제목
							<td style="word-break:break-all" ><div style="white-space:pre-wrap;"><c:out value="${boardDTO.subject}" escapeXml="true" default="${boardDTO.subject}"/></div> 
							
						<tr> 
							<th width="20%" align=center >파일이름<br>(파일 개수 : <c:out value="${file_cnt}" escapeXml="true" default="${file_cnt}"/>개)
							<td name=file_name align=center><b>
							
							<c:forEach items="${onlyFileName}" var="onlyFileName"  varStatus="status">
	 				 	  		<div style='display: flex;' align='left'>
									<c:out value="${onlyFileName}" escapeXml="true" default="${onlyFileName}"/>
							 
									<button type="button" onClick="goFiledownForm('${onlyTempName[status.index]}')">파일 다운받기</button> 
								</div><br>
							</c:forEach> 
		 
							
  						<tr> 
							<th width=100 >글내용
							<td style="word-break:break-all" readonly>
							<div style="white-space:pre-wrap;"><c:out value="${boardDTO.content}" escapeXml="true" default="${boardDTO.content}"/>
						 
							</div>
 						
								<%--  <span readonly>${boardDTO.content}<span>  --%>
					</table>
					</div>
					<br><br>
					<div align="right">
<!-- 					<input type="button" value="댓글쓰기" onClick="goBoardRegForm()">&nbsp;
					<input type="button" value="수정/삭제" onClick="goBoardUpDelForm()">&nbsp;
					<input type="button" value="글 목록 보기" onClick="document.boardListForm.submit();" >
					 -->
					<button class="btn btn-info" type="button" onClick="goBoardRegForm()"  >
						답글쓰기
					</button> 
				<!-- 	<button class="btn btn-info" name="checkPwd" type="button" onClick="goBoardUpDelForm()" >
						수정/삭제
					</button> -->
						<button type=button class="btn btn-info" href="javascript:" onClick="imagePopup('open')" >수정/삭제</button>
					
					</c:if>
					<button class="btn btn-info"  onClick="location.replace('/z_spring/boardListForm.do')"  type="button">
						목록보기
					</button>
				 
					<!--   <input type=button onclick="CheckPwd()" value="Open">  -->
 
					 
<!-- 					  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>
		 -->	
 
<!-- 본문글 비밀번호 확인 -->
<div id="layer" style="display:none">    <!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
    <div id="popup">
        <!-- 팝업창 닫기 버튼 -->
 
        <h3>비밀번호 입력</h3> 
      
        <form name="checkPwForm2">
        <!--input 타입  1개일때는 엔터키가 먹지 않음  -->
	        <input type=password id=pwd name=pwd  onkeyup="enterkey();" >
	        <input type=hidden class="writer" id="writer" name="writer" value="${boardDTO.writer}">
 			<input type="text" style="display: none;">
        <div align=right>
        	<button class="btn btn-info"  onClick="goBoardUpDelForm()"type=button >확인</button>&nbsp;&nbsp;&nbsp;
            <button class="btn btn-info"  type=button   onClick="imagePopup('close')">닫기</button>&nbsp;&nbsp;&nbsp; 
        </div>
         </form>
    <div>
</div>


 
 
 		<!--  <button class="btn btn-info" type=button onclick="CheckPwd()">열기</button> -->
					</div>
					
					</div>
				<!-- onClick="location.replace('/z_spring/boardListForm.do')" = get방식 -->
				<!-- ************************************************************************************** -->
				<!--  게시판 목록  화면으로 이동하는  form 태그 선언 -->
				<!-- form 태그 내부에는  클라이언트가 보낸 파라미터 값을  hidden 양식에 저장하고 있다. -->
				<!-- ************************************************************************************** -->
				
				<!-- Modal -->
 	
				</form>
				<!--댓글창  --> 

 
				  <div class="container">
				    <form id="commentForm" name="commentForm" method="post">
			  
				    <br><br>
				        <div>
				         <table class="commentTable" style="border: 1px" >   
				               <tr>
				               <td>
				                <span style="float:left;"><strong>Comments</strong></span> <span style="float:right;" id="cCnt" name=totalComentCnt>	[총 개수] :${commentListAllCnt}</span>
 											<input type="hidden"   name="b_no" class="form-control" value="${boardDTO.b_no}">  
 											
 											<input type="text" placeholder="작성자를 입력하세요" size="30"  name="writer" class="form-control"> 
 											<input type="password" placeholder="비밀번호를 입력하세요" size="30"  name="comment_password" class="form-control">   
				                           
				                            <textarea style="width: 1100px" rows="3" cols="30" id="comment_detail"class="form-control"  name="comment_detail" placeholder="댓글을 입력하세요"  ></textarea>
				                            <div style="color:#aaa; text-align: right;" name="counter">(0 / 최대 300자)</div>
				                          
				                            <div style="color:#aaa; text-align: right;" class='helpA'><br>"비밀번호는 6자~10자 사이에 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요."</div><div>
				                                <button type="button" class="btn pull-right btn-primary" onClick="goComentForm()" >등록</buttona>
				                            </div>
				                        </td> 
				                    </tr>
				              
				                </table>
				           
				        </div>
				        
				    </form>
				</div>  
			  <br>
		 
					
				
				<c:if test="${not empty commentDTO}">
				<div class="container">
				    <form id="commentListForm" name="commentListForm" method="post">
				         <c:forEach items="${commentDTO}" var="commentDTO" varStatus="loopTagStatus">
				        <div id="commentList">
				    
				        	<table class="table" >
				        	<!-- 차후 리스트로 가져올 예정 boardlistform 참조 -->
				        	<tr name="commentli">
				        		<td style="word-break:break-all"><b><input type="hidden" name=writer value="${commentDTO.writer}"> 작성자:  
				        				<c:out value="${commentDTO.writer}" escapeXml="true" default="${commentDTO.writer}"/>	
<%--  <div style="float:right"><button class="btn btn-light" type="button"  onClick="goDelComentForm(${commentDTO.b_no},${commentDTO.b_no_comment},${commentDTO.c_code},${commentDTO.b_code})"  >삭제  --%>
							 
								<div style="float:right"><!-- <button class="btn btn-light" type="button"  name="checkPwdForUp" >수정</button> -->&nbsp;<button class="btn btn-light" type="button" name="checkCommentPwd"   >삭제</button></div>	
							 	<br><small style="color:#aaa;">
							 			<c:out value="${commentDTO.comment_reg_date}" escapeXml="true" default="${commentDTO.comment_reg_date}"/></small><br><br> 
							 			<div style="white-space:pre-wrap;"><c:out value="${commentDTO.comment_detail}" escapeXml="true" default="${commentDTO.comment_detail}"/></div>
							 	<input type="hidden" name=b_no_comment value="${commentDTO.b_no_comment}"> 
							 	
							 	<input type="hidden" name=subject value="${boardDTO.subject}"> 
							 	<input type="hidden" name=print_no value="${boardDTO.print_no}"> 
							 	<input type="hidden" name=print_level value="${boardDTO.print_level}">
							 	
							 	 
							 	<input type="hidden" name=b_no value="${commentDTO.b_no}"> 
							 	<input type="hidden" name=comment_count value="${commentDTO.comment_count}"> 
							 	<input type="hidden" id=comment_password1 name=comment_password value="${commentDTO.comment_password}"> 
							 	 
					        </table>
				        </div>
				        </c:forEach>
				    </form>
				    
				     
				</div>
	 
 				</c:if>

 				<c:if test="${empty commentDTO}">
					해당 게시글의 댓글이 없습니다.
				</c:if>  
 
 

 
<!--댓글 본문글 비밀번호 확인 -->
<div id="layer2" style="display:none">    <!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
    <div id="popup">
        <!-- 팝업창 닫기 버튼 -->
 
        <h3>비밀번호 입력</h3> 
      
        <form name="checkPwForm3">
        <!--input 타입  1개일때는 엔터키가 먹지 않음  -->
	        <input type=password id=comment_password name=comment_password  onkeyup="enterkey1();" >
	        <input type=hidden id=b_no_comment name=b_no_comment >
	        <input type=hidden id=comment_count name=comment_count >
	        <input type=hidden id=b_no name=b_no >
	        
	        <input type="hidden" id=subject name=subject  > 
		 	<input type="hidden" id=print_no name=print_no  > 
		 	<input type="hidden" id=print_level name=print_level  >
		 	
 			<input type="text" style="display: none;">
        <div align=right>
        	  <button class="btn btn-info"   onClick="goCheckCommentPwd()"  type=button >확인</button>&nbsp;&nbsp;&nbsp;  
            <button class="btn btn-info"  type=button   onClick="closeCommentPwd()">닫기</button>&nbsp;&nbsp;&nbsp; 
        </div>
         </form>
    <div>
</div>


				<!-- *************************************************************************** -->
				<!-- 여기는 게시판 목록 화면으로 이동할 때 사용되는 form 태그. -->
				<!-- [게시판 목록] 화면으로 이동하는 form 태그 선언 -->
				<!-- form 태그 내부에는 클라이언트가 보낸 파라미터값을 입력 양식에 저장하고 있다. -->
				<!-- 파라미터값을 꺼낸 방법은  EL 문법을 이용한다. -->
				<!-- 파라미터값을 꺼내는  EL문법은  '$'{param.파라미터명} 또는 '$'{paramValues.파라미터명} 이다. -->
				<!-- '$'{paramValues.파라미터명}은 배열로서 checkbox 가 파라미터값으로 들어올 때 사용한다. -->
				<!-- *************************************************************************** -->
				<form name="boardListForm" method="post" action="/z_spring/boardListForm.do"  >
					<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
					<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
					<input type="hidden" name="keyword1" value="${param.keyword1}">
					<input type="checkbox" name="date" class="date" value="오늘">오늘
					<input type="checkbox" name="date" class="date" value="어제">어제
					<input type="checkbox" name="date" class="date" value="이번달">이번달
					<input type="checkbox" name="date" class="date" value="이번달이외">이번달이외
					
					<script>
						<c:forEach items="${paramValues.date}" var="date">/* 
								$("[name=boardListForm] [name=date]").filter("[value=${date}]").click() */
								$("[name=boardListForm] [name=date]").filter("[value=${date}]").prop("checked",true);
						</c:forEach>
						$("[name=boardListForm]").hide();
					</script>
				</form>
				<!-- ************************************************************************************************ -->
				<!-- 수정/삭제 화면으로 이동하기 위한 form 태그 선언. -->
				<!-- ************************************************************************************************ -->
				<form name="boardUpDelForm" method="post" action="/z_spring/boardUpDelForm.do">
					<!-- 게시판 상세보기 화면을 구성하는 글의 고유번호를 hidden 태그에 저장 -->
					<!-- 수정/삭제를 하려면 현재 글의 고유번호를 알아야하기 때문 -->
					<input type="hidden" name="b_no" value="${param.b_no}">
					<input type="hidden" name="selectPageNo" value="${param.selectPageNo}">
					<input type="hidden" name="rowCntPerPage" value="${param.rowCntPerPage}">
				</form>
				
				<!-- ************************************************************************************************ -->
				<!-- 이전 페이지에서 온 게시판 선택 페이지 번호를 지정한 hidden 태그 출력하고 게시판목록 화면으로 이동하는 form 태그 선언. -->
				<!-- 엄마의 PK 번호를 가지고 이동을 해야 하기 때문에 다른 form태그를 새로 만들어주는 거임. -->
				<!-- ************************************************************************************************ -->
				<form name="boardRegForm" method="post" action="/z_spring/boardRegForm.do">
					<!-- 게시판 상세보기 화면을 구성하는 글의 고유번호를 hidden 태그에 저장. 댓글을 달려면 주인글의 고유번호를 알아야 하기 때문에 . -->
					<input type="hidden" name="b_no" value="${param.b_no}">
				</form>
				
			 	
				<form name="checkPwForm" method="post" action="/z_spring/checkPwForm.do">
					<input type=hidden id="pwd1" class="pwd"name="pwd" value="${boardDTO.pwd}">
					<input type=hidden class="writer"name="writer" id="writer1" value="${boardDTO.writer}">
	 
					<%--  <input type=hidden class="pwdx"name="pwdx" value="${boardDTO.pwd}"> --%>
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
 