<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>    
<!-- alert!! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/LoginRegisterStyleSheet.css" />
<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
	
	<script type="text/javascript">
	        function checkInsert()
	        {
	            if($("#user_id").val()==""){
	            	$("#user_id").focus();
	            	swal("잠시만요!","아이디를 입력해주세요.","warning");
	                return false;
	            }
	            
	            if($("#user_password").val()==""){
	            	$("#user_password").focus();
	            	swal("잠시만요!","비밀번호를 입력해주세요!","warning");
	                return false;
	            }
	        }
	</script>
</head>

<body>
<!-- 로그인 실패 확인 부분 -->
<c:if test="${login_pass=='failure'}">
	<script>
	swal("로그인 실패!", "계정을 확인해주세요!", "warning");
	</script>
</c:if>
<!-- 로그인 실패 확인 부분끝 -->
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>로그인</h3>
				</div>
				<div class="card-body">
				<!-- fomr start!! id pw -->
				<!-- 액션 이 부분 수정해야함 -->
					<form action="/user/login.do" method="post" name="userInfo" onsubmit="return checkInsert();">
						<!-- 폼 그룹 -->
						<div class="input-group form-group">
							<!-- 아이콘 영역임 -->
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<!-- 아이콘 영역임 -->
							<input type="text" class="form-control" id="user_id" name="user_id" placeholder="id">
						</div>
						<!-- 폼 그룹 -->
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" id="user_password" name="user_password" placeholder="password">
						</div>
						<div class="form-group d-flex justify-content-center">
							<input type="submit" value="Login" class="btn float-right login_btn">
						</div>
					</form>
				<!-- fomr end!! -->
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center links">
						Don't have an account?<a href="/HowMany/register/howmany_register.jsp" >회원가입</a>
						/<a href="/HowMany/howmany_main.jsp" >돌아가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>