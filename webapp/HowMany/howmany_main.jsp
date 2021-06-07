<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<% 
		request.setCharacterEncoding("utf-8");
		String contentPage = request.getParameter("CONTENTPAGE");
		if(contentPage == null){
			contentPage="section/howmany_section_main.jsp";
		}

		//id lv 설정
		String loginId = (String)session.getAttribute("loginId");
		String loginLv = (String)session.getAttribute("loginLv");

	%>
</head>

<body>
	<c:import url="howmany_header.jsp" charEncoding="UTF-8"/>
	<jsp:include page='<%=contentPage %>' flush="false" />
	<c:import url="howmany_footer.jsp" charEncoding="UTF-8"/>
</body>
</html>