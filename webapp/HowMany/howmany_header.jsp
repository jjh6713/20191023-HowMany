<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<!-- lang 태그 ? 스크린리더가 읽는데 있어서 영향 -->
<html lang="ko">
<head>
    <title>How Many?</title>

    <!-- 메타 태그 모음 -->
    <meta charset="utf-8">  <!-- utf-8로 설정 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  <!-- 반응형 웹 페이지 관련 메타 태그 / shrink-to-fit=no 애플의 사파리 어플에서 영향을 끼친다 합니다. 사이즈 관련 -->

  	<!-- map 관련 -->
  	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=gbh3jbd6pf&callback=initMap"></script>

   <!-- 폰트와 아이콘 애니메이션 -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">    <!-- 구글에서폰트-->
    <link rel="stylesheet" href="../resources/css/open-iconic-bootstrap.min.css">    <!-- 아이콘이미지 -->
    <link rel="stylesheet" href="../resources/css/icomoon.css">
    <link rel="stylesheet" href="../resources/css/animate.css"> <!-- 애니메이션관련 -->
 	<link href="https://fonts.googleapis.com/css?family=Gloria+Hallelujah&display=swap" rel="stylesheet">
    <!-- 화면 구성관련 css -->    
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css"> <!-- carousel -->
    <link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/css/magnific-popup.css"> <!-- 다이얼로그 팝업 -->
    <link rel="stylesheet" href="../resources/css/aos.css"> <!-- 튀어나오는거 애니메이션 -->
    <link rel="stylesheet" href="../resources/css/ionicons.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="../resources/css/style.css?after"> <!-- 부트스트랩 -->
    
    <!-- service 관련 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <!-- alert!! -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <!-- chart 관련 -->
  	<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
  	
</head>

<body>
    <!-- 메뉴 부분 -->
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <a class="navbar-brand" href="/HowMany/howmany_main.jsp">How Many?</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a href="/HowMany/howmany_main.jsp" class="nav-link">Home</a></li>
                    <!--서비스 페이지-->
                    <li class="nav-item"><a href="/upso/upso_list.do" class="nav-link">Services</a></li>
                    <!--게시판 페이지-->
                    <!-- 여기수정해야함!!!!!!!!!!!!!!! -->
                    <li class="nav-item"><a href="/board/board_list.do" class="nav-link">Forums</a></li>
                    <!--다운로드 페이지-->
                    <li class="nav-item"><a class="nav-link" href="/HowMany/howmany_main.jsp?CONTENTPAGE=/HowMany/section/howmany_section_download.jsp">Download</a></li>
                    <!--매니저 모드용-->
                    <%
                    	if(session.getAttribute("loginLv")!=null){
                    		if(((String)session.getAttribute("loginLv")).equals("1")){  
                           		out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"/user/user_profile.do?user_id=");%><%=session.getAttribute("loginId") %>
                           		<%out.println("\">"+(String)session.getAttribute("loginId")+" Profile</a></li>");	
                    		}else if(((String)session.getAttribute("loginLv")).equals("2")){
                        		out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"/user/user_list.do\">Manager</a></li>");	           			
                    		}
                    	}
                    %>
                    <!--로그인링크 -->
                    <%
                    	if(session.getAttribute("loginId")==null){
                    		out.println("<li class=\"nav-item cta\"><a href=\"/HowMany/login/howmany_login.jsp\" class=\"nav-link\"><span>Login</span></a></li>");
                    	}else{
                    		//logout.do 호출
                     		out.println("<li class=\"nav-item cta\"><a href=\"/user/logout.do\" class=\"nav-link\"><span>Logout</span></a></li>");               		
                    	}
                    %>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 메뉴 부분 끝 -->