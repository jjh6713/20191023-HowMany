<%@page import="javax.swing.text.View"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<style>
	 .font-header {
        font-family: "Arial Black", sans-serif;
        font-size: 36px;
        font-weight: bold;
        color: #ffffff;
        text-shadow: 4px 4px 0px #2e2e2e, 8px 8px 0px #4f4f4f;
      }

	.container-box{
		height:auto; 
		width:auto; 
		margin:0px;
		background: #ebebeb;
		text-align:center;
		padding:50px 10px 50px 10px;
	    box-shadow: 7px 7px 5px 5px gray;
	}
	
	.form-group{
		padding-top:15px;
	}
</style>
<div class="container" style="padding-top:200px; padding-bottom:100px; margin:0 auto;">
	<div class="container-box">
		<p class="font-header"> User Profile </p>
		
		<table class="table table-hover">
			<thead>
			<tr>
				<th>아이디</th>
				<th>패스워드</th>	
				<th>이름</th>	
				<th>전화번호</th>
				<th>유저지역</th>
				<th>유저계급</th>
			</tr>
			</thead>
			<tbody>
				<!-- 임시 글 표기-->
					<tr>
						<td>${profile.user_id}</td>
						<td>${profile.user_password}</td>
						<td>${profile.user_name}</td>
						<td>${profile.user_tel}</td>
						<td>${profile.user_location}</td>
						<td>${profile.user_lv}</td>
					</tr>
			</tbody>
		</table>
		
		<div style="text-align:center; padding-top:10px;">
			<p class="font-header"> Change Profile </p>
			<form action="/user/user_update.do"  method="post">
		       	<div >
			       	<label for="user_id" class="col-sm-2 col-form-label">유저 아이디</label>
					<input type="text" style="margin-top:10px;" readonly class="col-sm-4" name="user_id" id="user_id" value="${profile.user_id}"></input>
				</div>
		       	<div >
			       	<label for="user_password" class="col-sm-2 col-form-label">유저 비밀번호</label>
					<input type="text" style="margin-top:10px;" class="col-sm-4" name="user_password" id="user_password" value="${profile.user_password}"></input>
				</div>
				<div >
			       	<label for="user_name" class="col-sm-2 col-form-label">유저 이름</label>
					<input type="text"  style="margin-top:10px;"class="col-sm-4" name="user_name" id="user_name" value="${profile.user_name}"></input>
				</div>
				<div >
			       	<label for="user_tel" class="col-sm-2 col-form-label">유저 전화번호</label>
					<input type="text" style="margin-top:10px;" class="col-sm-4" name="user_tel" id="user_tel" value="${profile.user_tel}"></input>
				</div>
				<div >
			       	<label for="user_location" class="col-sm-2 col-form-label">유저 지역</label>
					<input type="text" style="margin-top:10px;" class="col-sm-4" name="user_location" id="user_location" value="${profile.user_location}"></input>
				</div>
				<div class="button-group" style="padding-top:40px;">
					<button type="submit" class="btn btn-danger disabled"><font color="white">계정수정</font></button>
					<button type="button" class="btn btn-danger disabled"><a href="/user/user_delete.do?user_id=${profile.user_id}"><font color="white">계정삭제</font></a></button>
				</div>
			</form>
		</div>
	</div>
</div>
	