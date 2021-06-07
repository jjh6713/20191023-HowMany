<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    

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
		background:#ebebeb;
		text-align:center;
		padding:0px;
	    box-shadow: 7px 7px 5px 5px gray;
	}
	
	.button {
		-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		margin: auto auto 20px 20px;
		max-width: 200px;
		border-radius: 4px;
		padding: 10px 50px;
		color: rgba(30, 22, 54, 0.6);
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}
	
	.button:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
	}

	/* 검색창 !! */
	.input-group{
		padding-top:10px;
		padding-bottom:10px;
		padding-left:700px;
	}
	#searchform{
		width:auto;
	}
	.one{
		height:40px;
		width:82px;
		float:left;
		display:block;}
	.two{
		height:40px;
		width: 184px;
		float:left;
		display:block;}
	.three{
		height:40px;
		width: 130px;
		float:left;
		display:block;}
	.search-input {
		height:40px;
		width: 184px;
		padding:0px;
		margin:0px;
	}
	.search-submit{
		height:40px;
		width: 130px;
	    background-color: gray;
		border: none;
		box-shadow: none;
		color: #fff;
		cursor: pointer;
		text-transform: uppercase;
	}
	.search-select{
		height:40px;
		width:82px;
		font-size:15px;
	}
	/*페이징*/
	.pagination{
	  padding-bottom: 10px;
	}
	/*페이지 색상*/
	.page-item.active .page-link {
	  z-index: 1;
	  color: white;
	  background-color: gray;
	  border-color: black;
	}
	.page-item .page-link {
	  z-index: 1;
	  color: black;
	  background-color: white;
	  border-color: black;
	}
</style>

<script>
	$(document).ready(function(){
		var actionForm = $("#actionForm");
		var searchForm = $("#searchForm");
		
		$(".page-item a").on("click",function(e){
			
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".moveView").on("click",function(e){

			e.preventDefault();
			actionForm.append("<input type='hidden' id='board_no' name='board_no' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/board_view.do");
			actionForm.submit();
		})
		
		$("#searchForm button").on("click",function(e){
			if(!searchForm.find("option:selected").val()){
			    swal("잠시만요!","검색 종류를 선택하세요!","info");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
			    swal("잠시만요!","검색 키워드를 선택하세요!","info");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		})
	});
</script>


<div class="container" style="padding-top:250px; padding-bottom:200px;">
	<div class="container-box">
		<p class="font-header" ><a href="/board/board_list.do"><font color="white">Forums</font>  </a> </p>
		
		<!-- 검색 부분 -->		
		<div class="input-group" >
				<form id="searchForm"  action="/board/board_list.do" method="get">
					<div class="one">
						<select class="search-select"  name='type'>
							<!-- <option value="" <c:out value="${pageList.cri.type == null?'selected':''}"/>>--</option> -->
							<option value="T" <c:out value="${pageList.cri.type eq 'T'?'selected':''}"/>>Title</option>
							<option value="C" <c:out value="${pageList.cri.type eq 'C'?'selected':''}"/>>Content</option>
							<option value="W" <c:out value="${pageList.cri.type eq 'W'?'selected':''}"/>>Writer</option>
							<!-- <option value="TC" <c:out value="${pageList.cri.type eq 'TC'?'selected':''}"/>>제목 내용</option>
							<option value="TW" <c:out value="${pageList.cri.type eq 'TW'?'selected':''}"/>>제목 작성자</option>
							<option value="TWC" <c:out value="${pageList.cri.type eq 'TWC'?'selected':''}"/>>제목 내용 작성자</option>  -->
						</select>
					</div>
					<div  class="two" >
						<input class="search-input" type="text" aria-label="" aria-describedby="basic-addon1" name="keyword" value="${pageList.cri.keyword}" placeholder="Search"/>
						<input type='hidden' name='pageNum' value="${pageList.cri.pageNum}">
						<input type='hidden' name='amount' value="${pageList.cri.amount}">
					</div>
					<div class="three">
						<button class='search-submit' type="button">Search</button>
					</div>
				</form>
		</div>
		<!-- 검색부분끝 -->
		<!-- 테이블부분 -->
		<hr>
		<table class="table table-hover">
			<thead>
			<tr>
				<th>No</th>
				<th>작성자</th>	
				<th>글 제목</th>	
				<th>작성일</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="boardList">
					<tr>
						<td>${boardList.board_no}</td>
						<td>${boardList.board_writer}</td>
						<td><a class="moveView" style="color:black" href="<c:out value='${boardList.board_no}'/>">
								${boardList.board_name}</a></td>
						<td>${boardList.board_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr/>
		<!-- 테이블부분 끝-->
		<!-- 페이징 -->
		<div class="pull-right">
			<ul class="pagination justify-content-center">
	       		<c:if test="${pageList.prev}">
	       			<li class="page-item">
	       				<a class="page-link" href="${pageList.startPage -1}">◀</a>
					</li>
				</c:if>
				
				<c:forEach var="num" begin="${pageList.startPage}" end="${pageList.endPage}">
					<li class="page-item ${pageList.cri.pageNum == num? 'active':''}"><a class="page-link" href="${num}">${num}</a></li>
				</c:forEach>
				
	       		<c:if test="${pageList.next}">
	       			<li class="page-item">
	       				<a class="page-link" href="${pageList.endPage +1}">▶</a>
					</li>
				</c:if>
			</ul>
			<form id="actionForm" action='/board/board_list.do' method='get'>
				<input type='hidden' name='pageNum' value='${pageList.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageList.cri.amount}'>
				<input type='hidden' name="keyword" value='${pageList.cri.keyword}'>
				<input type='hidden' name="type" value='${pageList.cri.type}'>
			</form>
		</div> <!-- pager end -->
	</div><!-- container-box end -->
	<!-- 글쓰기 버튼 -->
	
	
		<%
			if(session.getAttribute("loginId") != null){
				out.print(
						"<button type=\"button\" class=\"button\" style=\"margin-top:20px; float:right;\"><a href=\"/HowMany/howmany_main.jsp?CONTENTPAGE=/HowMany/section/howmany_section_forums_write.jsp\"><font color=\"black\">글쓰기</font></a></button>"
				);
			}else{
				
			}
		%>
</div>