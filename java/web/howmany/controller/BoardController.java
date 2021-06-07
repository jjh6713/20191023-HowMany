package web.howmany.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import web.howmany.domain.BoardVO;
import web.howmany.domain.Criteria;
import web.howmany.domain.PageVO;
import web.howmany.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
		@Setter(onMethod_ = @Autowired)
		private BoardService service;
		
		/*
		//리스트
		@RequestMapping("/board_list.do")
		public String board_list(Model model) {
			model.addAttribute("boardList",service.board_list());
			return "howmany_main.jsp?CONTENTPAGE=section/howmany_section_forums";
		}*/
		
		//리스트 페이징 처리
		@RequestMapping("/board_list.do")
		public String board_list(Criteria cri, Model model) {
			//cri 는 자동으로 매핑 처음의 경우에야 1,10으로 고정이지만 후에 get방식으로 pageNum이나 amount를 받아오면 자동으로 매핑되서 cri에 들어감!!
			model.addAttribute("boardList",service.board_list(cri));
			model.addAttribute("pageList",new PageVO(cri, service.board_count(cri)));
			return "howmany_main.jsp?CONTENTPAGE=section/howmany_section_forums";
		}
	
		//보기
		@RequestMapping("/board_view.do")
		public ModelAndView board_view(ModelAndView mav,@RequestParam("board_no")long board_no, HttpServletRequest request, @ModelAttribute("cri") Criteria cri) {
			
			BoardVO temp = service.board_view(board_no);
			mav.addObject("view",temp);
			mav.setViewName("howmany_main.jsp?CONTENTPAGE=section/howmany_section_forums_view");
			//글 작성자 post_writer에다가 받고 세션에 설정
			request.setAttribute("post_writer", temp.getBoard_writer());
			request.setAttribute("post_no", temp.getBoard_no());
			return mav;
		}
		
		//삽입
		@RequestMapping("/board_insert.do")
		public String board_insert(BoardVO board) {
			service.board_insert(board);
			return "redirect:/board/board_list.do";
		}
		
		//삭제
		@RequestMapping("/board_delete.do")
		public String board_delete(long board_no) {
			service.board_delete(board_no);
			return "redirect:/board/board_list.do";
		}
		
		//갱신
		@RequestMapping("/board_update.do")
		public String board_update(BoardVO board) {
			service.board_update(board);
			return "redirect:/board/board_list.do";
		}
}
