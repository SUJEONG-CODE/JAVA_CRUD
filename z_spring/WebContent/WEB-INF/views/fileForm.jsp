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
<script>
$(document).ready(function(){

/* 	$('[name=newEmpForm]').find("[name=emp_name]").val('1qaz2@')
	$('[name=newEmpForm]').find("[name=emp_email]").val('1qaz2@')
	$('[name=newEmpForm]').find("[name=emp_password]").val('1qaz2@')
	 */

	  $("a[name='file-delete']").on("click", function(e) {
          e.preventDefault();
          deleteFile($(this));
      });

 

//제목 유효성 검사
	$('[name=newEmpForm]').find('[name=emp_name]').keyup(function (e){
	    var content = $(this).val();
	       
	    if(is_empty($('[name=newEmpForm]').find("[name=emp_name]"))&&content.length>0){
			alert("제목를 입력해 주세요.");
			$(this).val(content.substring(0, 0)); 
			$("[name=emp_name]").focus();
			return;
		}else if(content.length > 20){
			alert("최대 20자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 20));      
	        $('[name=newEmpForm]').find('[name=emp_name]').focus();
	        return;

		}
		  
	 
	});


$('[name=newEmpForm]').find('[name=emp_name]').blur(function (e){

	 var content = $(this).val();  

	if(is_empty($('[name=newEmpForm]').find("[name=emp_name]"))&&content.length>0){
		alert("제목를 입력해 주세요.");
		$(this).val(content.substring(0, 0)); 
		$("[name=emp_name]").focus();
		return;
	}else if(content.length > 20){
		 alert("최대 20자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 20));      
	        $('[name=newEmpForm]').find('[name=emp_name]').focus();
	        return;
		}   


});


//작성자 유효성 검사
$('[name=newEmpForm]').find('[name=emp_email]').keyup(function (e){
	    var content = $(this).val();
	       
	    if(is_empty($('[name=newEmpForm]').find("[name=emp_email]"))&&content.length>0){
			alert("작성자를 입력해 주세요.");
			$(this).val(content.substring(0, 0)); 
			$("[name=emp_email]").focus();
			return;
		}else if(content.length > 10){
			alert("최대 10자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 10));      
	        $('[name=newEmpForm]').find('[name=emp_email]').focus();
	        return;

		}
		  
	 
	});


$('[name=newEmpForm]').find('[name=emp_email]').blur(function (e){

	 var content = $(this).val();  

	if(is_empty($('[name=newEmpForm]').find("[name=emp_email]"))&&content.length>0){
		alert("작성자를 입력해 주세요.");
		$(this).val(content.substring(0, 0)); 
		$("[name=emp_email]").focus();
		return;
	}else if(content.length > 10){
		 alert("최대 10자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 10));      
	        $('[name=newEmpForm]').find('[name=emp_email]').focus();
	        return;
		}   


});


//비밀번호 유효성 검사하기
$('[name=newEmpForm]').find('[name=emp_password]').keyup(function (e){
    var content = $(this).val();
    if (content.length > 10){
        alert("최대 10자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 10));      
        $('[name=newEmpForm]').find('[name=emp_password]').focus();
    } 
});
 $('[name=newEmpForm]').find('[name=emp_password]').blur(function (e){
    var content = $(this).val();
    if (content.length > 10){
        alert("최대 10자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 10));      
        $('#regTable').find('[name=emp_password]').focus();
    } 
});  
$('[name=newEmpForm]').find('[name=emp_password]').focusout(function (e){
    var content = $(this).val();
    if (content.length > 10){
        alert("최대 10자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 10));      
        $('[name=newEmpForm]').find('[name=emp_password]').focus();
    } 
});





});	
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

function reset_exceptId(){
	$("[name=emp_name]").val('');
	$("[name=emp_email]").val('');
 

	/*$("input[name=uploadBtn]").value="";
	*document.getElementById("uploadBtn").value = "";
  	$("input[name=uploadBtn]") */ 
}




function goJoinMember(){ 

	if(is_empty("[name=emp_name]")){
		alert("제목을 입력해 주세요.");
		$("[name=emp_name]").focus();
		return;
	}

	if(is_empty("[name=emp_email]")){
		alert("작성자를 입력해 주세요.");
		$("[name=emp_email]").focus();
		return;
	}

	if(is_empty("[name=emp_password]")){
		alert("비밀번호를 입력해 주세요.");
		$("[name=emp_password]").focus();
		return;
	}


	if(is_valid_pattern("[name=emp_password]", /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9]){10}$/) == false){
		alert("6자~10자 사이에 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요.");
		$("[name=emp_password]").focus();
		return;
	}
	 var fileCheck = document.getElementById("uploadBtn").value;
	 if(!fileCheck){
		alert("파일을 등록해주세요.");
		 
		return false;
	}
	 
	 
 
	
    var form = $('[name=newEmpForm]')[0];
     
    var formData = new FormData(form);

     
    $.ajax({
        url: "/z_spring/newEmpInfoProc.do",
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                success: function(result){
                    alert("완료되었습니다.");
                
                    location.replace("/z_spring/fileListForm.do");
                    

                }
               //서버의 응답을 못 받았을 경우 실행할 익명함수 설정
           , error : function(){
              alert("서버 접속 실패");
           }
    });
 
	
}

 
 
function addFile() {

	 
	if($("input[name=uploadBtn]").length<5){
		
		     var str = "<div style='display: flex;' class='form-group'><input type='file' id='uploadBtn' class='uploadBtn' name='uploadBtn'><span style='text-align: left;'><a style='text-decoration: none; color: blue;' href='#this' name='file-delete'>삭제</a></div> ";
		     $("#file-list").append(str);
		    
		     
		     $("[name='file-delete']").on("click", function(e) {
		     
		    	    e.preventDefault();
		    	    deleteFile($(this));		    	   
		    	});
	   

	}else{

		alert("파일 업로드 횟수가 초과하였습니다.");
		  
	}
}
		
 


		function deleteFile(obj) {
	 
		    obj.parent().parent().remove();
		  
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
          <form name="newEmpForm" class="contact-form php-mail-form" role="form" action="/z_spring/newEmpInfoProc.do" method="POST" enctype="multipart/form-data">

              <div class="form-group">
       <!--        <input type="hidden" name="emp_no" class="form-control" id="contact-no"  > -->
                <input type="text" name="emp_name" class="form-control" id="contact-name" placeholder="제목">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" name="emp_email" class="form-control" id="contact-email" placeholder="작성자">
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="password" name="emp_password" class="form-control" id="emp_password" placeholder="비밀번호">
                <div style="color:#aaa; text-align: left;" class='helpA'><br>"6자~10자 사이에 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요."</div>
                
                <div class="validate"></div>
              </div>
              <br>
 
 
 
               <div class="form-group">
                  <table width="100%">
                     <tr>  <div style="color:#aaa; text-align: left;" class='helpA'><br>"파일업로드는 최대 5개까지 가능합니다"</div> 
                        <td width="100%">
                          
                           <div class="form-group" id="file-list">
                          
 								  <div align='right'><a style='text-decoration: none; color: blue;' href="#this" onclick="addFile()">파일추가 </a></div>  
 	 
 							 <div class="file-group">
					           <input type="file" id="uploadBtn" class="uploadBtn" name="uploadBtn"> 
					        </div>  
					        <br>
 						 </div>
                          
                 
                        </td>
                     </tr>
                     <!-- <label class="col-sm-2 col-sm-2 control-label">Placeholder</label> -->
                  </table>
                  <div class="validate"></div>
               </div>
     
 
          </form>
    <br><br>
              <div align="right" class="form-send">
                <button type="button" class="btn btn-theme" onclick="goJoinMember();"><b><i class="fa fa-check-square"></i> 등록하기<b></button>
                <button type="button" class="btn btn-theme" onClick="reset_exceptId();"><i class='fa fa-rotate-right'></i> 다시쓰기</button>
                <button type="button" class="btn btn-theme" onClick="goFileListForm();"><i class='fa fa-rotate-right'></i> 목록보기</button>
                <!-- <button type="submit" class="btn btn-large btn-primary" onclick="goLogin();">메인으로</button> -->
              </div>
               
               
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