<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<style>
	th{
    	background-color: #f44336;
    	color:white;
    	font-weight: bold;
    }
    td{
    	font-weight: bold;
    }
</style>

<div class="container" style="padding-top:200px; padding-bottom:100px; text-align:center;">
	<hr>
	<table class="table table-hover">
		<thead>
		<tr>
			<th>아이디</th>
			<th>패스워드</th>	
			<th>이름</th>	
			<th>전화번호</th>
			<th>유저지역</th>
			<th>유저계급</th>
			<th>계정삭제</th>
		</tr>
		</thead>
		<tbody>
			<!-- 임시 글 표기-->
			<c:forEach items="${userList}" var="userList">
				<tr>
					<td>${userList.user_id}</td>
					<td>${userList.user_password}</td>
					<td>${userList.user_name}</td>
					<td>${userList.user_tel}</td>
					<td>${userList.user_location}</td>
					<td>${userList.user_lv}</td>
					<td><button type="button" class="btn btn-danger disabled" onclick="location.href='/user/user_delete.do?user_id=${userList.user_id}'" >유저 삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr/>
</div>