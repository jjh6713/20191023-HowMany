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
</style>

<%
	String board_writer = (String)session.getAttribute("loginId"); 	
%>
<script>
	$("#write_form_submit").on("click",function(e){
	    swal("작성 완료!","감사합니다!","success");
		return false;
	});
</script>

<div class="container" style="padding-top:250px; padding-bottom:100px;">
	<div class="container-box">
		<p class="font-header"> Forums Write </p>
		<form action="/board/board_insert.do?board_writer=<%=board_writer%>" id="write_form" method="post">
			<div class="form-group row">
				<label for="title" class="col-sm-2 col-form-label">title</label> 
				<input type="text" class="col-sm-9"  rows="1" name="board_name" id="title"></textarea>
			</div>
		
			<div class="form-group row">
				<label for="content" class="col-sm-2 col-form-label">Comment</label> 
				<textarea class="col-sm-9"  rows="12" name="board_content" id="content"></textarea>
			</div>
			
			<div class="button-set">
				<button type="submit" class="button" id="write_form_submit" style=""><font color="black">작성완료</font></button>
				<button type="button" class="button" style=""><a href="/board/board_list.do"><font color="black">작성취소</font></a></button>
			</div>
		</form>
	</div>
</div>
	