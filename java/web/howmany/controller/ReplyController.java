package web.howmany.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.Setter;
import web.howmany.domain.Criteria;
import web.howmany.domain.PageVO;
import web.howmany.domain.ReplyPageVO;
import web.howmany.domain.ReplyVO;
import web.howmany.service.BoardService;
import web.howmany.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
		@Setter(onMethod_ = @Autowired)
		private ReplyService service;
		
		//insert 로 들어오는 요청에대한 rest api 설정
		@PostMapping(value="/insert", 
				consumes = "application/json", 
				produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> reply_insert(@RequestBody ReplyVO vo){
			service.reply_insert(vo);
			return new ResponseEntity<>("success",HttpStatus.OK);
		}

		//게시물 댓글 목록확인
		@GetMapping(value = "/pages/{board_no}/{page}", produces = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE
		}) //url 경로를 파라메터로 받기위한 어노테이션 pathvariable
		public ResponseEntity<ReplyPageVO> reply_list(@PathVariable("page")int page, @PathVariable("board_no")Long board_no){
			Criteria cri = new Criteria(page,10);
			return new ResponseEntity<>(service.reply_list(cri, board_no),HttpStatus.OK);
		}
		
		
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
}
