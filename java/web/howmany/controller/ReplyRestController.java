package web.howmany.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.Setter;
import web.howmany.domain.BoardVO;
import web.howmany.domain.Criteria;
import web.howmany.domain.PageVO;
import web.howmany.domain.ReplyPageVO;
import web.howmany.domain.ReplyVO;
import web.howmany.service.BoardService;
import web.howmany.service.ReplyService;

@RestController
@RequestMapping("/app/rep/*")
public class ReplyRestController {
	
		@Setter(onMethod_ = @Autowired)
		private ReplyService service;
		
		// produce -> 유형에 따라 매핑시켜서 실행하고 이외의 유형은 제외함

		 @CrossOrigin
		 @RequestMapping(value = "/create", method = RequestMethod.POST)
		 public @ResponseBody String createReply(@RequestBody String param) {
		 ReplyVO vo =  new Gson().fromJson(param, ReplyVO.class);
		 
		 if(vo.getReply_content()!= null && vo.getReply_writer() != null) {
			 System.out.println(vo);
			 service.reply_insert(vo);
		 }
		 return "";
		 }


		//게시물 댓글 목록확인
		@CrossOrigin
		@RequestMapping(value = "/pages/{board_no}/{page}", method = RequestMethod.GET) //url 경로를 파라메터로 받기위한 어노테이션 pathvariable
		public ArrayList<JSONObject> reply_list(@PathVariable("page")int page, @PathVariable("board_no")Long board_no){
			Criteria cri = new Criteria(page,100);

			ArrayList<JSONObject> boards = new ArrayList<>();
			ArrayList<ReplyVO> volist = new ArrayList<>();
			
			volist = service.reply_list(cri, board_no).getReply_list();
			
			for(int i = 0; i < volist.size(); i++) {
		         JSONObject board = new JSONObject();
		         
		         board.put("content", volist.get(i).getReply_content());
		         board.put("writer", volist.get(i).getReply_writer());
		         board.put("date", volist.get(i).getReply_date());   
		         boards.add(board);
		       }
		      System.out.println(boards);
		      return boards;
		}
		
		/*
		//게시물 view
		@GetMapping(value ="/{reply_no}",produces = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE
		})
		public ResponseEntity<ReplyVO> reply_view(@PathVariable("reply_no")Long reply_no){
			return new ResponseEntity<>(service.reply_view(reply_no),HttpStatus.OK);
		}
		
		//게시물 삭제
		@DeleteMapping(value = "/{reply_no}",produces = {
				MediaType.TEXT_PLAIN_VALUE
		})
		public ResponseEntity<String> reply_delete(@PathVariable("reply_no")Long reply_no){
			service.reply_delete(reply_no);
			return new ResponseEntity<>("success",HttpStatus.OK);
		}
		
		//게시물 수정
		@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
				value="/{reply_no}",
				consumes = "application/json",
				produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> reply_update(@RequestBody ReplyVO vo, @PathVariable("reply_no")Long reply_no){
			vo.setReply_no(reply_no.toString());
			service.reply_update(vo);
			return new ResponseEntity<>("success",HttpStatus.OK);
		}
		*/
}
