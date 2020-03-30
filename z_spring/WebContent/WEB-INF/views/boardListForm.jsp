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



  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script>
   		//**********************************************************
   		// body 태그 안의 모든 태그를 읽어들인 후 실행할 자스 코딩 설정
   		//**********************************************************
   		$(document).ready(function(){

   	   		

   			$('[name=keyword1]').keyup(function (e){
   			    var content = $(this).val();
   			       
   			    if(is_empty("[name=keyword1]") &&content.length>0){
   					alert("검색어를 입력해 주세요.");
   					$(this).val(content.substring(0, 0)); 
   					$("[name=keyword1]").focus();
   					return;
   				}else if(content.length > 10){
   		   			alert("최대 10자까지 입력 가능합니다.");
   			        $(this).val(content.substring(0, 10));      
   			        $('[name=keyword1]').focus();
   			        return;
   	 
   				}
   				  
   			 
   			});

   	 
   	   		$('[name=keyword1]').blur(function (e){
   			    var content = $(this).val();
   			       
   			    if(is_empty("[name=keyword1]")&&content.length>0){
   					alert("검색어를 입력해 주세요.");
   					$(this).val(content.substring(0, 0)); 
   					$("[name=keyword1]").focus();
   					return;
   				}else if(content.length > 10){
   		   			alert("최대 10자까지 입력 가능합니다.");
   			        $(this).val(content.substring(0, 10));      
   			        $('[name=keyword1]').focus();
   			        return;
   	 
   				}
   				  
   			 
   			});	

   	   		$('[name=keyword2]').keyup(function (e){
   			    var content = $(this).val();
   			       
   			    if(is_empty("[name=keyword2]")&&content.length>0){
   					alert("검색어를 입력해 주세요.");
   					$(this).val(content.substring(0, 0)); 
   					$("[name=keyword2]").focus();
   					return;
   				}else if(content.length > 10){
   		   			alert("최대 10자까지 입력 가능합니다.");
   			        $(this).val(content.substring(0, 10));      
   			        $('[name=keyword2]').focus();
   			        return;
   	 
   				}
   				  
   			 
   			});

   	 
   	   		$('[name=keyword2]').blur(function (e){
   			    var content = $(this).val();
   			       
   			    if(is_empty("[name=keyword2]")&&content.length>0){
   					alert("검색어를 입력해 주세요.");
   					$(this).val(content.substring(0, 0)); 
   					$("[name=keyword2]").focus();
   					return;
   				}else if(content.length > 10){
   		   			alert("최대 10자까지 입력 가능합니다.");
   			        $(this).val(content.substring(0, 10));      
   			        $('[name=keyword2]').focus();
   			        return;
   	 
   				}
   				  
   			 
   			});	


   			
/* 
     			//크롬에선 한글이 한글자 더 많이 나오므로 처리 해줘야 한다. 
   			$('.keyword1').keyup(function(e){ if ($(this).val().length > 5) { alert('10자 제한길이 초과'); $(this).val($(this).val().substr(0,10)); } });
   			$('.keyword2').keyup(function(e){ if ($(this).val().length >5) { alert('10자 제한길이 초과'); $(this).val($(this).val().substr(0,10)); } });
 
   			$('.keyword1').blur(function(e){ if ($(this).val().length >5) { alert('10자 제한길이 초과'); $(this).val($(this).val().substr(0,10)); } });
   			$('.keyword2').mouseover(function(e){ if ($(this).val().length >5) { alert('10자 제한길이 초과'); $(this).val($(this).val().substr(0,10)); } });
   		 
      		  */
      		 
/* 
   		  //************************************************************
            // 첫번째 tr 태그 내부의 th 태그를 클릭하면 발생할 일을 설정
            //************************************************************
            $('.boardTable thead:eq(0) tr:eq(0) td').click( function() {
                // 클릭한 th 태그를 관리하는 JQuery 객체 메위주를 얻어 변수에 저장.
                var thisThObj = $(this);
                // ASC, DESC 여부를 저장할 변수 선언.
                var ascDesc = "";
                // 클릭한 th 형제의 th 태그안의 문자열에 ▲,▼ 제거
                thisThObj.siblings().each( 
                    function() {
                        // i 번째 th 태그 안의 문자열을 얻자
                        var txt = $(this).text();
                        // 앞 뒤 공백 제거.
                        txt = $.trim(txt);
                        // ▲ 제거하기.
                        txt = txt.replace("▲","");
                        // ▼ 제거하기.
                        txt = txt.replace("▼","");
                        // i 번째 th 태그 안에 ▲,▼ 제거한 문자열을 넣기.
                        $(this).text( txt );
                    }   
                );
                //************************************************************
                // 클릭한 th 안의 문자열 뒤에 ▲ or ▼ 붙이기.
                //************************************************************
                //  클릭한 th 안의 문자열을 얻어 변수 txt 에 저장하기.
                var txt = thisThObj.text();
                // txt 변수 안의 문자열에 ▲ 이 있으면 ▼로 바꾸고 ascDesc 변수에 'desc' 저장하기.
                if ( txt.indexOf("▲") >= 0 ) {
                    txt = txt.replace("▲","▼");
                    ascDesc = "desc";
                    
                // txt 변수 안의 문자열에 ▼ 이 있으면 ▲로 바꾸고 ascDesc 변수에 'asc' 저장하기.
                } else if(txt.indexOf("▼") >= 0 ) {
                    txt = txt.replace("▼","▲");
                    ascDesc = "asc";
                    // text 변수 안의 문자열에 ▼ 도 없고 ▲도 없을 경우
                    // ▲ 로 넣어주고 ascDesc 변수에 "asc" 저장하기.
                } else {
                    txt = txt + " ▲";
                    ascDesc = "asc";
                }

                // txt 안의 데이터를 클릭한 th 안의 문자열로 갱신
                thisThObj.text( txt );
                
                //************************************************************
                // Array 객체에 각각의 tr을 관리하는 JQuery 객체들을 생성해서 저장.
                // 원하는 정렬 기준으로JQuery 객체의 위치를 바꾼다.
                //************************************************************
                    // 정렬 대상이 되는 모든 tr 태그를 관리하는 JQuery 객체 생성해 저장. 
                var allTrObj = $('.boardTable tbody:eq(0)').children();
                // 각각의 tr을 관리하는 JQuery 객체들을 생성하여 Array 객체에 저장.
                var trObjs = [];
                allTrObj.each(
                    function() {
                        trObjs.push( $(this) );
                    }
                );
                // 클릭한 th의 인덱스 번호를 저장.
                var thIndex = thisThObj.index();
                //
                for(var j=0; j<trObjs.length-1; j++) {
                    for(var k=j+1; k<trObjs.length; k++){
                        var td1Text = trObjs[j].children('td').eq(thIndex).text();
                        td1Text = ($.trim(td1Text)).toLowerCase();
                        if( thIndex == 0 | thIndex == 4) {
                            td1Text = parseInt(td1Text,10);
                        }
                        var td2Text = trObjs[k].children('td').eq(thIndex).text();
                        td2Text = ($.trim(td2Text)).toLowerCase();
                        if( thIndex == 0 | thIndex == 4) {
                            td2Text = parseInt(td2Text,10);
                        }
                        //===========================
                        if (ascDesc == "desc" && td1Text<td2Text) {
                            var tmp = trObjs[j];
                            trObjs[j] = trObjs[k];
                            trObjs[k] = tmp;
                        } else if(ascDesc == "asc" && td1Text>td2Text) {
                            var tmp = trObjs[j];
                            trObjs[j] = trObjs[k];
                            trObjs[k] = tmp;
                        }
                    }
                }
                $('.boardTable tbody:eq(0)').empty();
                for(var j=0; j<trObjs.length; j++) {
                    $('.boardTable tbody:eq(0)').append( trObjs[j] );
                }
            });
 */
            
   			//--------------------------------------------------------------
   			// name="rowCntPerPage" 에 change 이벤트가 발생하면 실행할 코드 설정하기.
   			//--------------------------------------------------------------
   			$('[name=rowCntPerPage]').change(function(){
   				goSearch();	
   			});
   			
   			//================================================================
   				// 페이징 처리 관련 HTML 소스를 class=pagingNumber 가진 태그 안에 삽입하기.
   			//================================================================
   			$(".pagingNumber").html(
   				getPagingNumber(
   					"${boardListAllCnt}"				//검색 결과 총 행 개수
   					,"${boardSearchDTO.selectPageNo}"	//선택된 현재 페이지 번호
   					,"${boardSearchDTO.rowCntPerPage}"	//페이지 당 출력행의 개수
   					,"10"								//페이지당 보여줄 페이지번호 개수
   					,"goSearch();"						//페이지 번호 클릭 후 실행할 자스코드
   				)		
   			);
   			
   			//------------------------------------------------------------------
   			// 게시판 몰록을 보여주는 table 의 헤더행, 짝수행, 홀수행, 마우스온 일 때 배경색 설정하기.
   			//------------------------------------------------------------------
   		/* 	setTableBgColor(
   				"boardTable"		//테이블  class 값
   				, "${headerColor}"			//헤더 tr 배경색
   				, "${oddTrColor}"			//홀수행 배경색
   				, "${evenTrColor}"		//짝수행 배경색
   				, "${mouseOverColor}"			//마우스 온 시 배경색
   			);
   			
   			 */
   			// 클라이언트가 보낸 검색 조건을 입력 양식에 넣어주기.
   			// 검색 후에 검색한 조건들 웹페이지에 표시해주기.
   			/* 
   			$('[name=rowCntPerPage]').val("${boardSearchDTO.rowCntPerPage}");
            $('[name=keyword1]').val("${boardSearchDTO.keyword1}");
            $('[name=orAnd]').val("${boardSearchDTO.orAnd}");
            $('[name=keyword2]').val("${boardSearchDTO.keyword2}");
            $('[name=selectPageNo]').val("${boardSearchDTO.selectPageNo}");
            <c:forEach items="${boardSearchDTO.date}" var="date">
            	$('[name=date]').filter("[value='${date}']").prop("checked",true);
           	</c:forEach>
           	<c:forEach items="${boardSearchDTO.viewCnt}" var="viewCnt">
        		$('[name=viewCnt]').filter("[value='${viewCnt}']").prop("checked",true);
       		</c:forEach>  
       		*/
       		inputData( "[name=selectPageNo]", "${boardSearchDTO.selectPageNo}" );
       		inputData( "[name=rowCntPerPage]", "${boardSearchDTO.rowCntPerPage}" );
       		inputData( "[name=keyword1]", "${boardSearchDTO.keyword1}" );
       		inputData( "[name=keyword2]", "${boardSearchDTO.keyword2}" );
       		inputData( "[name=orAnd]", "${boardSearchDTO.orAnd}" );
       		<c:forEach items="${boardSearchDTO.date}" var="date">
       			inputData( "[name=date]","${date}" );
       		</c:forEach>
       		<c:forEach items="${boardSearchDTO.viewCnt}" var="viewCnt">
   				inputData( "[name=viewCnt]","${viewCnt}" );
   			</c:forEach>

   		 	inputData("[name=sort]","${boardSearchDTO.sort}");
       		
   		});
			//--------------------------------------------------------------
   			// 게시판 목록 으로 이동하는 함수 선언
   			//--------------------------------------------------------------
   		function goSearch(){
				// 만약 키워드가 공백 또는 길이가 없다면 길이 없는 데이터로 세팅하기
				// 공백 상태에서 서버로 전송되면 공백을 가지고 DB 검색한다.
				// 이 현상을 막기 위해 공백 또는 길이가 없다면 길이 없는 데이터로 통일해서 세팅한다.
			 
				
			if($("[name=date]").filter(":checked").length==0 & $("[name=viewCnt]").filter(":checked").length==0 )	{



	   			$('[name=keyword1]').keyup(function (e){
	   			    var content = $(this).val();
	   			       
	   			    if(is_empty("[name=keyword1]") &&content.length>0){
	   					alert("검색어를 입력해 주세요.");
	   					$(this).val(content.substring(0, 0)); 
	   					$("[name=keyword1]").focus();
	   					return;
	   				}else if(content.length > 10){
	   		   			alert("최대 10자까지 입력 가능합니다.");
	   			        $(this).val(content.substring(0, 10));      
	   			        $('[name=keyword1]').focus();
	   			        return;
	   	 
	   				}
	   				  
	   			 
	   			});

	   	 
	   	   		$('[name=keyword1]').blur(function (e){
	   			    var content = $(this).val();
	   			       
	   			    if(is_empty("[name=keyword1]")&&content.length>0){
	   					alert("검색어를 입력해 주세요.");
	   					$(this).val(content.substring(0, 0)); 
	   					$("[name=keyword1]").focus();
	   					return;
	   				}else if(content.length > 10){
	   		   			alert("최대 10자까지 입력 가능합니다.");
	   			        $(this).val(content.substring(0, 10));      
	   			        $('[name=keyword1]').focus();
	   			        return;
	   	 
	   				}
	   				  
	   			 
	   			});	

	   	   		$('[name=keyword2]').keyup(function (e){
	   			    var content = $(this).val();
	   			       
	   			    if(is_empty("[name=keyword2]")&&content.length>0){
	   					alert("검색어를 입력해 주세요.");
	   					$(this).val(content.substring(0, 0)); 
	   					$("[name=keyword2]").focus();
	   					return;
	   				}else if(content.length > 10){
	   		   			alert("최대 10자까지 입력 가능합니다.");
	   			        $(this).val(content.substring(0, 10));      
	   			        $('[name=keyword2]').focus();
	   			        return;
	   	 
	   				}
	   				  
	   			 
	   			});

	   	 
	   	   		$('[name=keyword2]').blur(function (e){
	   			    var content = $(this).val();
	   			       
	   			    if(is_empty("[name=keyword2]")&&content.length>0){
	   					alert("검색어를 입력해 주세요.");
	   					$(this).val(content.substring(0, 0)); 
	   					$("[name=keyword2]").focus();
	   					return;
	   				}else if(content.length > 10){
	   		   			alert("최대 10자까지 입력 가능합니다.");
	   			        $(this).val(content.substring(0, 10));      
	   			        $('[name=keyword2]').focus();
	   			        return;
	   	 
	   				}
	   				  
	   	   		});



	   			
					 
			}


			 
				
				if(is_empty("[name=boardListForm] [name=keyword1]") ){
					$("[name=boardListForm] [name=keyword1]").val("");
				}
				//-------------------------------------------------------------------------------------------
				// 키워드의 앞뒤에 공백이 있으면 공백 제거 후 재 입력 해줘야 한다.
				//-------------------------------------------------------------------------------------------
				var keyword1 = $("[name=boardListForm] [name=keyword1]").val();
				keyword1 = $.trim(keyword1);
				$("[name=boardListForm] [name=keyword1]").val(keyword1);
				
				//-------------------------------------------------------------------------------------------
				// 위의 코딩은 아래의 코딩으로 대체할 수 있다.
				// $("[name=boardListForm] [name=keyword1]").val(
				//		$.trim( $("[name=boardListForm] [name=keyword1]").val() );		
				// );
				//-------------------------------------------------------------------------------------------
				if(is_empty("[name=boardListForm] [name=keyword2]") ){
					$("[name=boardListForm] [name=keyword2]").val("");
				}
				//-------------------------------------------------------------------------------------------
				// 키워드의 앞뒤에 공백이 있으면 공백 제거 후 재 입력 해줘야 한다.
				//-------------------------------------------------------------------------------------------
				var keyword2 = $("[name=boardListForm] [name=keyword2]").val();
				keyword2 = $.trim(keyword2);
				$("[name=boardListForm] [name=keyword2]").val(keyword2);
		
				
	   			//name=boardListForm 을 가진 form 태그의 action 값의 url로 웹서버에 접속하기
	   			// boardListForm를 이름으로 가지고있는 form태크에 있는 모든 입력양식을 파라미터명으로 만들어서 action오늘쪽 주소의 웹서버에 올려라.
	   			document.boardListForm.submit();
   		}
		// [ 모두 검색 ] 버튼 누르면 호출되는 함수 선언.
		function goSearchAll(){
			//================================================================================
			// [name=boardListForm] 을 가진 form 태그의 내부의 입력 양식 중에 
			// 체크박스나 라디오박스는 체크를 풀고 그 외 입력 양식은 value 속성값을 비운다.
			//================================================================================
			document.boardListForm.reset();
			//================================================================================
				// 선택페이지 번호와 페이지당 보여지는 행의 개수는 비우면 안되므로
				// 기본값을 넣어준다. 이게 없으면 DB연동을 할 수 없기 때문이다.
			//================================================================================
			$("[name=boardListForm] [name=selectPageNo]").val("1");
			$("[name=boardListForm] [name=rowCntPerPage]").val("15");
			if(is_empty("[name=boardListForm] [name=keyword1]") ){
				$("[name=boardListForm] [name=keyword1]").val("");
			}

			//goserch함수로 갈수 있지만 button이 ture일때 만드른 메소드를 지정못함
			//-------------------------------------------------------------------------------------------
			// 키워드의 앞뒤에 공백이 있으면 공백 제거 후 재 입력 해줘야 한다.
			//-------------------------------------------------------------------------------------------
			var keyword1 = $("[name=boardListForm] [name=keyword1]").val();
			keyword1 = $.trim(keyword1);
			$("[name=boardListForm] [name=keyword1]").val(keyword1);
			
			//-------------------------------------------------------------------------------------------
			// 위의 코딩은 아래의 코딩으로 대체할 수 있다.
			// $("[name=boardListForm] [name=keyword1]").val(
			//		$.trim( $("[name=boardListForm] [name=keyword1]").val() );		
			// );
			//-------------------------------------------------------------------------------------------
			if(is_empty("[name=boardListForm] [name=keyword2]") ){
				$("[name=boardListForm] [name=keyword2]").val("");
			}
			//-------------------------------------------------------------------------------------------
			// 키워드의 앞뒤에 공백이 있으면 공백 제거 후 재 입력 해줘야 한다.
			//-------------------------------------------------------------------------------------------
			var keyword2 = $("[name=boardListForm] [name=keyword2]").val();
			keyword2 = $.trim(keyword2);
			$("[name=boardListForm] [name=keyword2]").val(keyword2);
	
			
   			//name=boardListForm 을 가진 form 태그의 action 값의 url로 웹서버에 접속하기
   			// boardListForm를 이름으로 가지고있는 form태크에 있는 모든 입력양식을 파라미터명으로 만들어서 action오늘쪽 주소의 웹서버에 올려라.
   			document.boardListForm.submit();
		}
		
		function goBoardRegForm(){
			// GET방식 & 파라미터값 또한 없다. 괄호 안에 있는 URL 주소로 접근해서 서버가 주는 HTML 태그를 열어주겠다는 뜻.
			//http://localhost:8088/z_spring/boardListForm.do >> http://localhost:8088/z_spring/boardRegForm.do
				// 보면 URL 주소 뒤에 ?가 안붙었다. 따라서 이말은 주소이동을 할 때 같이 전송되는 파라미터 값이 없다는 의미 이다.
						
			location.replace("/z_spring/boardRegForm.do");
		}
		
		//***************************************************************************************
		// 1개의 게시판 내용물을 보여주는 게시판 상세 보기 화면 으로 이동하는 함수 선언.
		//***************************************************************************************
		function goBoardContentForm(b_no,file_cnt,listNum,group_no){

			/* var selectPageNo = $("[name=boardListForm] [name=selectPageNo]").val();
			var rowCntPerPage = $("[name=boardListForm] [name=rowCntPerPage]").val(); */
			// 상세보기 화면으로 이동할 때 가져갈 파라미터 값을 만든다.
			// b_no는 필수이고 나머지는 검색조건 관련 파라미터값이다.
			// 검색조건 파라미터값을 가지고 가야 다시 돌아올때 검색 조건들을 넣어 줄 수 있다.(검색조건유지하기위해서.)
			var str = "b_no=" + b_no +"&" +"file_cnt="+file_cnt+"&listNum=" + listNum +"&" +"group_no=" + group_no+"&"+ $("[name=boardListForm]").serialize(); 
			/* var str = "b_no=" + b_no; */
			// url 주소로 접속할 테니깐 상세보기화면에 대한 HTML을 달라.
			//2가지 방법 FORM 태그를 상요해서 전달하거나, URL 주소 뒤에 붙여서 보내기(get 방식).
			
			/* 넘어가는 파라미터값을 보고싶을 경우 사용하는 방법.
			$(".xxx").remove();
			$("body").prepend("<div class=xxx><hr>"+str+"<hr></div>");
			return;
			*/
			
			// get 방식
			// "/z_spring/boardContentForm.do?b_no="+b_no
			//								(파라미터명)매개변수=데이터값
			location.replace("/z_spring/boardContentForm.do?"+str
		 	/* location.replace("/z_spring/boardContentForm.do?"+b_no 
					+ "&selectPageNo=" + selectPageNo 
							+ "&rowCntPerPage=" + rowCntPerPage */
			); 
			
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

		//엑셀저장(현재페이지)
		function goToExcelForm(){
			var str= $("[name=boardListForm]").serialize(); 
			location.replace("/z_spring/excelForm.do?"+str);
		}	 

		//엑셀저장(전체페이지)
		function goToExcelAllForm(){
 
			location.replace("/z_spring/goToExcelAllForm.do");
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
				<center><form name="boardListForm" method="post" action="/z_spring/boardListForm.do">
					 
					<div style="width:100" class=keywordCheck>	
						<!-- ============================================== -->
						<!-- 키워드 검색 입력 양식 표현하기. -->
						<!-- ============================================== -->
						<label class="form-check-label">[키워드] :</label> <input type="text" maxlength=10 name="keyword1" class="keyword1"  >&nbsp;&nbsp;&nbsp;
								<select name="orAnd">
										<option value="or">or
										<option value="and">and
								</select>
								&nbsp;&nbsp;&nbsp;
								<input type="text"maxlength=10 name="keyword2" class="keyword1" >&nbsp;&nbsp;&nbsp;
						
						<button class="btn btn-light" type="button" onClick="goSearch()"  >
							검색
						</button>
						<button class="btn btn-light" id=allCheck name="allCheck" type="button" onClick="goSearchAll()"  >
							목록보기
						</button>
						
						<%-- [키워드] : <input type="text" name="keyword1" 
						class="keyword1"
						value="${boardSearchDTO.keyword1}">&nbsp;&nbsp;&nbsp; --%>
						
						
					
						<!-- ============================================== -->
						<!-- 어제 또는 오늘 게시판 글을 검색하는 조건 표현하기 -->
						<!-- ============================================== -->
						<br><br>
						<label class="form-check-label">[등록일] :</label> 
						<input type="checkbox" name="date" class="date" value="오늘" class="form-check-input">오늘
						<input type="checkbox" name="date" class="date" value="어제" class="form-check-input">어제
						<input type="checkbox" name="date" class="date" value="이번달" class="form-check-input">이번달
						<input type="checkbox" name="date" class="date" value="이번달 이외" class="form-check-input">이번달이외&nbsp;&nbsp;&nbsp;
						 
						 <label class="form-check-label">[조회수] :</label> 
						<input type="checkbox" name=viewCnt class="form-check-input"  value="조회수">조회수 100이상&nbsp;&nbsp;&nbsp;
						
						<!-- ============================================== -->
						
						
						
						
						<!-- 버튼 표현하기. -->
						<!-- ============================================== -->
						
						<!-- <input type="button" value="   검색   " class="contactSearch" onClick="goSearch();">&nbsp;
						<input type="button" value="   모두 검색   " onClick="goSearchAll();">&nbsp;
						<input type="button" value="   새글쓰기  " onClick="goBoardRegForm();">&nbsp;
						 -->
						<br><br>
				 
						
					 
						<!-- <a href="contact.html" onClick="goBoardRegForm();">[새글쓰기]</a>&nbsp;&nbsp; -->
						
						<!-- ============================================== -->
						<!-- 선택한 페이지번호가 저장되는 입력양식 표현하기 -->
						<!-- 선택한 페이지번호는 DB연동시 아주 중요한 역할을 한다. -->
						<!-- ============================================== -->
						<!-- <input type="hidden" 을 <input type="text" 개발시 변경해 놓으면 편하다. -->
			
						<input type="hidden" name="selectPageNo" >
					 <input type="hidden" name="sort" value="null">  
						
					</div><br>
					<div align="right" style="width:800">
 
								<!-- ============================================== -->
								<!-- EL 문법으로 게시판 검색 총 개수 출력하기 -->
								<!-- '$'{boardListAllCnt}는 컨트롤러 클래스인 BoardController 클래스 내부에 -->
								<!-- ModelAndView 객체에 boardListAllCnt 라는 키값으로 저장된 -->
								<!-- 데이터를 EL 로 표현하여 삽입 하라는 뜻이다. -->
								<!-- ============================================== -->
								[총 개수] : ${boardListAllCnt}&nbsp;&nbsp;&nbsp; [파일 총 개수] : ${fileListBoardAllCnt}
								<!-- ============================================== -->
								<!-- 한 페이지에서 보이는 행의 개수가 저장되는 입력양식 표현하기. -->
								<!-- 행의 개수는 db연동시 아주 중요한 역할을 한다. -->
								<!-- ============================================== -->
								<select style='width:50px;' name="rowCntPerPage">
									<option value="10">10
									<option value="15">15
									<option value="20">20
									<option value="25">25
									<option value="30">30	
								</select> 행보기
					 	<br><br>
							<button class="btn btn-light"  onClick="goBoardRegForm();"  type="button">
								새글쓰기
							</button>
							&nbsp; 
							<button type="button" class="btn btn-light" onClick="goToExcelForm()">
								엑셀저장(현재페이지)
							</button>
							&nbsp; 
							<button type="button" class="btn btn-light" onClick="goToExcelAllForm()">
								엑셀저장(전체페이지)
							</button>
  
		 
					</div>
					<br>
			 
					<div style="width:800">
						
				 
				<!-- *************************************************************************************************** -->
				<!-- 게시판 검색 목록 출력하기 -->
				<!-- *************************************************************************************************** -->
 
				<div>  
				<table class="boardTable table">
					<thead><tr bgcolor="${headerColor}">
					<td width="5%" align=center><b>번호
					<c:choose>
							<c:when test="${param.sort=='subject desc'}">
								<th width="40%" style="cursor: pointer"
									onclick="$('[name=sort]').val('subject asc'); goSearch();">▼제목
							</c:when>
							<c:when test="${param.sort=='subject asc'}">
								<th width="40%" style="cursor: pointer"
									onclick="$('[name=sort]').val('subject desc'); goSearch();">▲제목
								
							</c:when>
							<c:otherwise>
								<th width="40%" style="cursor: pointer"
									onclick="$('[name=sort]').val('subject asc'); goSearch();">제목
							</c:otherwise>
					</c:choose> 
					

				 
				 <c:choose>
							<c:when test="${param.sort=='writer desc'}">
								<th width="10%" style="cursor: pointer"
									onclick="$('[name=sort]').val('writer asc'); goSearch();">▼작성자
							</c:when>
							<c:when test="${param.sort=='writer asc'}">
								<th width="10%" style="cursor: pointer"
									onclick="$('[name=sort]').val('writer desc'); goSearch();">▲작성자
								
							</c:when>
							<c:otherwise>
								<th width="10%" style="cursor: pointer"
									onclick="$('[name=sort]').val('writer asc'); goSearch();">작성자
							</c:otherwise>
					</c:choose> 
				 <c:choose>
							<c:when test="${param.sort=='reg_date desc'}">
								<th width="10%" style="cursor: pointer"
									onclick="$('[name=sort]').val('reg_date asc'); goSearch();">▼등록일
							</c:when>
							<c:when test="${param.sort=='reg_date asc'}">
								<th width="10%" style="cursor: pointer"
									onclick="$('[name=sort]').val('reg_date desc'); goSearch();">▲등록일
								
							</c:when>
							<c:otherwise>
								<th width="10%" style="cursor: pointer"
									onclick="$('[name=sort]').val('reg_date asc'); goSearch();">등록일
							</c:otherwise>
					</c:choose> 
				 
				 
				 <c:choose>
							<c:when test="${param.sort=='readcount desc'}">
								<th width="5%" style="cursor: pointer"
									onclick="$('[name=sort]').val('readcount asc'); goSearch();">▼조회수
							</c:when>
							<c:when test="${param.sort=='readcount asc'}">
								<th width="5%" style="cursor: pointer"
									onclick="$('[name=sort]').val('readcount desc'); goSearch();">▲조회수
								
							</c:when>
							<c:otherwise>
								<th width="5%" style="cursor: pointer"
									onclick="$('[name=sort]').val('readcount asc'); goSearch();">조회수
							</c:otherwise>
					</c:choose> 
				 
				 
				 </thead>
					<!-- ================================================================================== -->
					<!-- 사용자 정의 태그인 JSTL C코어 태그를 사용하여  ModelAndView 객체에  boardList 라는 키값으로 저장된 -->
					<!-- List<Map<String, String>> 객체 안의 데이터를 출력하기 -->
					<!-- ================================================================================== -->
					<%-- <%-- <c:forEach> 태그 속성 설명  --%>
					<!-- ================================================================================== -->
					<%-- <c:forEach 
							items="${boardList}"  =  에는 EL 표현으로  ModelAndView 객체에 저장한 키값명으로 됨. 주로 List 객체의 키값명이 삽입됨.
							var="board" 		=  items 속성에 설정한 List 객체 안의  i번째 데이터가 저장될 지역변수명
							varStatus="loopTagStatus"
						> 
					--%>
					<tbody>
					 
					<c:forEach items="${boardList}" var="board" varStatus="loopTagStatus">
						<!-- foreach 태그 상태 속성이다. 속성을 이용해서 제어하면 좀더 쉽게 제어, 순서와 관련 제어할때 사용 -->
							 
							<tr style="cursor:pointer"
								<%-- bgcolor="${loopTagStatus.index%2==0?'white':'lightblue'}"  --%>
							onClick="goBoardContentForm(${board.b_no},${board.file_cnt},${ boardListAllCnt -(boardSearchDTO.selectPageNo*boardSearchDTO.rowCntPerPage-boardSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1},${board.group_no});">
								<td align=center> 
								 
								<!-- ============================================== -->
								<!-- 게시판 검색 목록 중에 각 행의 역순 일련번호 출력 -->
								<!-- ============================================== -->
								<!-- 
										 한 화면에 보여줄 행의 갯수   = rowCntPerPage
										 선택한 페이지 번호	  = selectPageNo
										 시작행의 번호		  = beginRowNo
										 끝 행의 번호		  = endRowNo
										 
										----------------------------------------------------------------------- 
										 문제 1) rowCntPerPage 가  10이고,  selectPageNo가  1이면 
										-----------------------------------------------------------------------
										beginRowNo ? = selectPageNo * rowCntPerPage - rowCntPerPage +1;
										endRowNo ? = selectPageNo * rowCntPerPage;
										-----------------------------------------------------------------------
										endRowNo ? = selectPageNo * rowCntPerPage;
										beginRowNo ? = endRowNo - rowCntPerPage + 1;
										-----------------------------------------------------------------------
										문제 2) 
										 
									 -->
									<input type=hidden name="listNum" value="<c:out value="${ boardListAllCnt - 
										(boardSearchDTO.selectPageNo*boardSearchDTO.rowCntPerPage-boardSearchDTO.rowCntPerPage+1+loopTagStatus.index)
										+1
									} "  escapeXml="true"/>"/>${  boardListAllCnt-(boardSearchDTO.selectPageNo*boardSearchDTO.rowCntPerPage-boardSearchDTO.rowCntPerPage+1+loopTagStatus.index)+1
										
									} 
									<!-- 정순 번호 출력 시 아래 코드로 대체할 것 -->
									<%-- ${boardSearchDTO.selectPageNo*boardSearchDTO.rowCntPerPage-boardSearchDTO.rowCntPerPage+1+loopTagStatus.index} --%>
								
						 
								<td maxlength=30>	
								 
										<!-- --------------------------------------------- -->
										<!-- 만약 들여쓰기 레벨번호가 0 보다 크면 -->
										<!-- 레벨번호 개수 만큼의 &nbsp;&nbsp; 를 삽입하라. -->
										<!-- --------------------------------------------- -->
										<c:if test="${board.subject eq ' ' && board.print_no==0}">
											<span style="color:darkgrey;">해당 게시물은 삭제되었습니다.</span>
										</c:if>
										
										 
										 <c:if test="${board.print_level>0 && board.subject eq ' '}">
										  
													<c:forEach begin="0" end="${board.print_level}">
														&nbsp;&nbsp;  
													</c:forEach>
													ㄴ
											 
											<span style="color:darkgrey;">해당 게시물은 삭제되었습니다.</span>
										 </c:if>
										 
										 
										 
										 
										 
										
										<c:if test="${board.comment_count==0 && board.subject ne ' '}">
										
												<c:if test="${board.print_level>0}">
													<c:forEach begin="0" end="${board.print_level}">
														&nbsp;&nbsp;  
													</c:forEach>
													ㄴ
												</c:if>
												<c:out value="${board.subject}" escapeXml="true" default="${board.subject}"/> 

										</c:if>
										
										
										
										
										
										
										<c:if test="${board.comment_count>0}">
										<!-- ============================================== -->
										<!-- 게시판 검색 목록 중에 각 행의 제목 출력. -->
										<!-- ============================================== -->
											<c:if test="${board.print_level>0}">
													<c:forEach begin="0" end="${board.print_level}">
														&nbsp;&nbsp;  
													</c:forEach>
													ㄴ
											</c:if>
											<c:out value="${board.subject}" escapeXml="true" default="${board.subject}"/> 
											<span style="color:blue;">(${board.comment_count})</span>
								 
										</c:if>
										
								
							
							   
								<!-- ============================================== -->
								<!-- 게시판 검색 목록 중에 각 행의 글쓴이 출력 -->
								<!-- ============================================== -->
								<td maxlength=20 align=center><input type=hidden readonly name="writer" value='${board.writer}'><c:out value="${board.writer}" escapeXml="true" default="${board.writer}"/> </td>
								<!-- ============================================== -->
								<!-- 게시판 검색 목록 중에 각 행의 등록일 출력 -->
								<!-- ============================================== -->
								<td align=center><c:out value="${board.reg_date}" escapeXml="true" default="${board.reg_date}"/>  
								<!-- ============================================== -->
								<!-- 게시판 검색 목록 중에 각 행의 조회수 출력 -->
								<!-- ============================================== -->
								<td align=center><c:out value="${board.readcount}" escapeXml="true" default="${board.readcount}"/>  
				 
						</c:forEach>
							 
						<% /*
						// JAVA를 사용하여 게시판 데이터를 불러오는 방법.
							List<Map<String, String>> list = 
								(List<Map<String,String>>)request.getAttribute("boardList");
							for(int i=0; i<=list.size(); i++){
								Map<String, String> map = list.get(i);
								out.print("<tr>");
								out.print("<td>" + map.get("b_no"));
								out.print("<td>" + map.get("subject"));
								out.print("<td>" + map.get("writer"));
								out.print("<td>" + map.get("reg_date"));
								out.print("<td>" + map.get("readcount"));
							}*/
						%>
			</tbody>
				
				</table>
					</div> 
				 
				</form>
				</div> 
				
				<!-- *************************************************************************************************** -->
				<!-- 페이징 번호를 삽입할 span 태그 선언-->
				<!-- *************************************************************************************************** -->
				<div>&nbsp;<span class="pagingNumber"></span>&nbsp;</div>
 
				
				
				<%-- ${boardListAllCnt==0?'검색 결과가 없습니다.':''} --%>
				<%-- <c:if test="${boardListAllCnt==0}">
					검색 결과가 없습니다.
				</c:if> --%>
				<!-- EL의 연산자로 서 {empty boardList} boardList(키값명) 가 null 값을 가질 때  true를 리턴한다. -->
				<!-- List<Map<String, String> 리스트 객체를 만들었어도 List 내부에 쓸만한 데이터가 없을 때 null을 리턴하기 때문에 좋다. -->
				<!-- 만약 검색된 게시판의 총개수가 0 개이면 검색 결과가 없습니다를 출력. -->
				<!-- c:if test="'$'{empty boardList}" test 오른쪽엔 무조건 EL 문법이 와야함. 그리고 EL문법은 true or false를 리턴한다. -->
				<c:if test="${empty boardList}">
					검색 결과가 없습니다.
				</c:if>  
				<%--
					위 코드는 아래 2개의 코드로 대체가 가능하다.
					${boardListAllCnt==0?"검색 결과가 없습니다."}
					
					<c:if test="${boardListAllCnt}"
					
				 --%>
			               
               
                   
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