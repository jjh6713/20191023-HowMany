<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회 원  가 입</title>
<link rel="stylesheet" href="/resources/css/LoginRegisterStyleSheet.css" />
<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
<!-- alert!! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">

		//가입성공
		/*
		var registerInfo = $("#registerInfo");
	
		$("#register_submit").on("click",function(e){
			e.preventDefault();
	        swal("성공!","가입 완료 감사합니다!","success");
	        registerInfo.submit();
		});
		*/	
		//값 입력 체크
	    function checkInsert()
	    {
		        if(!document.registerInfo.user_id.value){
		        	document.registerInfo.user_id.focus();
	            	swal("잠시만요!","아이디를 입력해주세요.","warning");
		            return false;
		        }
		        if(!$("#valid_check").val()){
	            	swal("잠시만요!","중복검사를 해주세요.","warning");
		            return false;
		        }
		        if(!document.registerInfo.user_password.value){
		        	document.registerInfo.user_password.focus();
	            	swal("잠시만요!","비밀번호를 입력해주세요.","warning");
		            return false;
		        }
		        if(!document.registerInfo.user_name.value){
		        	document.registerInfo.user_name.focus();
	            	swal("잠시만요!","이름을 입력해주세요.","warning");
		            return false;
		        }
		        if(!document.registerInfo.user_tel.value){
		        	document.registerInfo.user_tel.focus();
	            	swal("잠시만요!","전화번호를 입력해주세요.","warning");
		            return false;
		        }
		        if(!document.registerInfo.user_location.value){
		        	document.registerInfo.user_location.focus();
	            	swal("잠시만요!","지역을 입력해주세요.","warning");
		            return false;
		        }
	    }

		//중복검사
	    function checkValid()
	    {
	    	if(!document.registerInfo.user_id.value){
	        	document.registerInfo.user_id.focus();
            	swal("잠시만요!","아이디를 입력해주세요.","warning");
	            return false;
	        }else{
		    	$.ajax({
					url:'/user/register_valid.do',
					type:"post",
					data:{"user_id":$("#user_id").val()},
					dataType:'json',
					success:function(data){
						var ck = JSON.stringify(data);
						if(ck==="1"){
							//1일경우 중복값이 없으니 val 변경
							$("#valid_check").val("true");
				        	swal("성공!","중복검사 완료!","success");
						}else{
				        	swal("실패!","중복되는 계정입니다!","warning");
						}
					}
				}); 
	        }
	    }// 중복검사 끝
	</script>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card" style="height:410px;">
				<div class="card-header">
					<h3>회원가입</h3>
				</div>
				<div class="card-body" >
				<!-- form start!! -->
					<form action="/user/register.do" id="registerInfo" name="registerInfo" method="post" onsubmit="return checkInsert();">
						<div class="input-group form-group">
						<!-- id, pw, name, tel -->
							<input type="text" class="form-control" id="user_id" name="user_id" placeholder="id">
							<button type="button" id="valid_check" class="btn float-right login_btn" onClick="checkValid()">중복검사</button>
						</div>
						<div class="input-group form-group">
							<input type="password" class="form-control" name="user_password" placeholder="password">
						</div>
						<div class="input-group form-group">
							<input type="text" class="form-control" name="user_name" placeholder="name">
						</div>
						<div class="input-group form-group">
							<input type="text" class="form-control" name="user_tel" placeholder="tel">
						</div>
						<div class="input-group form-group">
							<input type="text" class="form-control" name="user_location" placeholder="location">
						</div>
						<div class="form-group d-flex justify-content-center">
							<input type="submit" id="register_submit" value="가입하기" class="btn float-right login_btn ">
							<input type="button" style="margin-left:10px;" class="btn float-right login_btn" value="돌아가기" onClick="location.href='/HowMany/login/howmany_login.jsp'">
						</div>
					</form>
					<!-- fomr end!! -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>