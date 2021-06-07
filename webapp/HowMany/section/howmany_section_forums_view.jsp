<%@page import="javax.swing.text.View"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
<script type="text/javascript" src="/resources/js/reply.js"></script>   

<!-- 댓글관련 -->
<link rel="stylesheet" href="../resources/css/panel.css"> <!-- panel관련 -->
<link rel=”stylesheet” href=”http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css“>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

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
		background:#ebebeb;
		text-align:center;
		padding:50px 10px 50px 10px;
	    box-shadow: 7px 7px 5px 5px gray;
	}
	
	.button-set{
		padding-top:30px;
	}
	
	.button {
		-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		margin: auto auto 20px 20px;
		max-width: 200px;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 50px;
		color: rgba(30, 22, 54, 0.6);
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}
	.button:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
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
		var board_no = ${view.board_no};
		var replyUL = $(".chat");
		showList(1);
		
		function showList(page){
			replyService.list({board_no:board_no,page:page||1},function(reply_count,list){
				
				var str="";
				
				if(page==-1){
					pageNum = Math.ceil(reply_count/10.0);
					showList(pageNum);
					return;
				}
				
				if(list==null||list.length==0){
					replyUL.html("");
					return;
				}
			
				for(var i = 0, len = list.length || 0 ; i <len; i++){
					str +="<li style='list-style:none; border-bottom:1px solid gray; border-width:thin;' class='left clearfix' data-reply_no='"+list[i].reply_no+"'>";
					str +="	<div style='text-align:left;'><div class='header'><strong class='primary-font'>"+list[i].reply_writer+"</strong>";
					str +="		<small class='pull-right text-muted'>&nbsp; &nbsp; 작성 시간|"+replyService.displayTime(list[i].reply_date)+"</small></div>";
					str +="		<p>"+list[i].reply_content+"</p></div></li>";
				}
				replyUL.html(str);
				showReplyPage(reply_count);
			});
		}//end showlist
		
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply_content']");
		var modalInputReplyer = modal.find("input[name='reply_writer']");
		var modalInputReplyDate = modal.find("input[name='reply_date']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		var modalCloseBtn = $("#modalCloseBtn");
		

		//댓글추가 버튼 누를경우
		$("#addReplyBtn").on("click",function(e){
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			//close 외 버튼 다 안보이게
			modal.find("button[id!='modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		})
		
		//닫기 버튼 누를경우
		modalCloseBtn.on("click",function(e){

			modal.modal("hide");
		})
		
		//댓글등록 버튼 누를경우
		modalRegisterBtn.on("click",function(e){
			var reply={
				reply_content:modalInputReply.val(),
				reply_writer:modalInputReplyer.val(),
				board_no:board_no
			};
			replyService.insert(reply,function(result){
				alert(result);
				modal.find("input").val("");
				modal.modal("hide");
				
				//댓글갱신
				showList(-1);
			})
		})
		
		//댓글 view 댓글클릭시 적용
		$(".chat").on("click","li",function(e){
			var reply_no = $(this).data("reply_no");
		
			replyService.view(reply_no,function(reply){
				modalInputReply.val(reply.reply_content);
				modalInputReplyer.val(reply.reply_writer);
				modalInputReplyDate.val(replyService.displayTime(reply.reply_date)).attr("readonly","readonly");
				modal.data("reply_no",reply.reply_no);
				
				modal.find("button[id!='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				modal.modal("show");
			})
			
		})
		
			
		//댓글 수정
		modalModBtn.on("click",function(e){
			var reply_no = modal.data("reply_no");
			var reply = {reply_no:reply_no,reply_content:modalInputReply.val()};
			replyService.update(reply,function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			})
		})
			
			
		//댓글 삭제
		modalRemoveBtn.on("click",function(e){
			var reply_no = modal.data("reply_no");
			console.log(reply_no);
			replyService.del(reply_no,function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			})
		})
		
		//paging
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(reply_count){
			var endNum = Math.ceil(pageNum/10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= reply_count){
				endNum = Math.ceil(reply_count/10.0);
			}
			if(endNum * 10 < reply_count){
				next = true;
			}
			var str = "<ul style='margin:0px; padding-top:10px;' class='pagination pull-right justify-content-center'>";
			if(prev){
				str+="<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
			}
			for(var i = startNum;i<=endNum;i++){
				var active = pageNum == i ? "active" : "" ;
				str+="<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			if(next){
				str+="<li class='page-item'><a class='page-link' href='"+(endNum +1)+"'>Next</a></li>";
			}
			str+="</ul></div>";
			replyPageFooter.html(str);
		}
		
		replyPageFooter.on("click","li a",function(e){
			e.preventDefault();
			var targetNum = $(this).attr("href");
			
			pageNum = targetNum;
			showList(pageNum);
		})
	})
</script>

<div class="container" style="padding-top:200px; padding-bottom:100px;">
<!-- 원래 페이지로 돌아가기 -->
	<form id="actionForm" action='/board/board_list.do' method='get'>
		<input type='hidden' name='pageNum' value="${pageList.cri.pageNum}">
		<input type='hidden' name='amount' value="${pageList.cri.amount}">
		<input type='hidden' name="keyword" value='${pageList.cri.keyword}'>
		<input type='hidden' name="type" value='${pageList.cri.type}'>
	</form>

	<div class="container-box">
		<p class="font-header"> Forums View </p>
		<form action="/board/board_update.do?board_no=${view.board_no}" style="margin:auto;" method="post">
	       	<div class="form-group row">
		       	<label for="board_name" class="col-sm-2 col-form-label">글 제목</label>
				<input type="text" readonly class="col-sm-9" rows="1" name="board_name" id="board_name" value="${view.board_name}"></input>
			</div>
	       	<div class="form-group row">
				<label for="board_writer" class="col-sm-2 col-form-label">작성자</label>
				<input type="text" readonly class="col-sm-9" rows="1" name="board_writer" id="board_writer" value="${view.board_writer}"></input>
			</div>
	       	<div class="form-group row">
				<label for="board_date" class="col-sm-2 col-form-label">작성일</label>
				<input type="text" readonly class="col-sm-9" rows="1" name="board_date" id="board_date" value="${view.board_date}"></input>
			</div>
			<div class="form-group row">
				<label for="board_content" class="col-sm-2 col-form-label">글 내용</label>
				<textarea rows="10" class="col-sm-9" name="board_content" id="board_content">${view.board_content}</textarea>
	       </div>
	       
			<%
			//현재 세션네임과 db에서 받아온 이름이 같으면 버튼 표시 아니면 표시안함!
				if(session.getAttribute("loginId")!=null){
					if(session.getAttribute("loginId").equals(request.getAttribute("post_writer"))){
						out.println("<div class=\"button-set\">");
						out.println("<button type=\"submit\" class=\"button\"><font color=\"black\">글 수정</font></button>");
						out.println("</form>");
						out.println("<button type=\"button\" class=\"button\"><a href=\"/board/board_delete.do?board_no=");%><%=request.getAttribute("post_no")%>
						<%out.println("\"><font color=\"black\">글 삭제</font></a></button>");
						out.println("<button type=\"button\" class=\"button\"><a class=\"moveList\" href=\"/board/board_list.do\"><font color=\"black\">돌아가기</font></a></button>");
						out.println("</div>");
					}else if(session.getAttribute("loginLv").equals("2")){
						out.println("</form>");
						out.println("<div class=\"button-set\">");
						out.println("<button type=\"button\" class=\"button\"><a href=\"/board/board_delete.do?board_no=");%><%=request.getAttribute("post_no")%>
						<%out.println("\"><font color=\"black\">글 삭제</font></a></button>");
						out.println("<button type=\"button\" class=\"button\"><a class=\"moveList\" href=\"/board/board_list.do\"><font color=\"black\">돌아가기</font></a></button>");
						out.println("</div>");
					}else{
						out.println("</form>");
						out.println("<div class=\"button-set\">");
						out.println("<button type=\"button\" class=\"button\"><a class=\"moveList\" href=\"/board/board_list.do\"><font color=\"black\">돌아가기</font></a></button>");
						out.println("</div>");
					}
				}else{
					out.println("</form>");
					out.println("<div class=\"button-set\">");
					out.println("<button type=\"button\" class=\"button\"><a class=\"moveList\" href=\"/board/board_list.do\"><font color=\"black\">돌아가기</font></a></button>");
					out.println("</div>");
				}%>
			<!-- 댓글창부분 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div style="text-align:left; "><i class="fa fa-comments fa-fw" ></i> 댓글 리스트</div>
							<div style="text-align:right; "><button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 작성</button></div>
						</div>
						<div class="panel-body">
							<ul class="chat">
							<!-- 이 부분 댓글 표시 -->
								
							</ul>
						</div>
						<div class="panel-footer">
						</div>
					</div><!-- end panel -->
				</div><!-- end col -->
			</div><!-- end row -->
			
			<!-- Modal 부분 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">댓글</h4>
						</div>
						<div class="modal-body" style="text-align:left;">
							<div class="form-group">
								<label for="reply_content">댓글 내용</label>
								<input class="form-control" id="reply_content" name="reply_content" value="reply_content">
							</div>
							<div class="form-group">
								<label for="reply_writer">댓글 작성자</label>
								<input class="form-control" id="reply_writer" name="reply_writer" value="reply_writer">
							</div>
							<div class="form-group">
								<label for="reply_date">댓글 날짜</label>
								<input class="form-control" id="reply_date" name="reply_date" value="reply_date">
							</div>
						</div>
						<div class="modal-footer">
							<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
							<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
							<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
							<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
						</div>
					</div>
				</div>
			</div><!-- end modal -->
	</div><!-- end container-box -->
</div>
	