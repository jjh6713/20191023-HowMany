package web.howmany.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import web.howmany.domain.Camera_statusVO;
import web.howmany.domain.Population_dataVO;
import web.howmany.service.UpsoService;
import web.howmany.upso.Local_situationVO;
import web.howmany.upso.SalesVO;
import web.howmany.upso.SmallcitysVO;
import web.howmany.upso.SmallupjongsVO;
import web.howmany.upso.UpsoVO;

@Controller
@RequestMapping("/upso/*")
public class UpsoController {
	
		@Setter(onMethod_ = @Autowired)
		private UpsoService service;

		
		//리스트 전부 가지고 service로 돌아간다.
		@RequestMapping("/upso_list.do")
		public String upso_list(Model model) {
			
			model.addAttribute("bigcitys_list",service.bigcitys_list());
			model.addAttribute("bigupjongs_list",service.bigupjongs_list());
			model.addAttribute("camera_status",service.get_camera_status());
			model.addAttribute("population_data",service.get_population_data());
			return "howmany_main.jsp?CONTENTPAGE=section/howmany_section_service";
			
		}
		
		//service 중에서 collection 데이터 부분

		@RequestMapping("/get_camera_status.do")
		@ResponseBody
		public ArrayList<Camera_statusVO> get_camera_status(Model model, HttpServletRequest request) {
			ArrayList<Camera_statusVO> temp = service.get_camera_status();
			return temp;
		}

		@RequestMapping("/get_population_data.do")
		@ResponseBody
		public ArrayList<Population_dataVO> get_population_data(Model model, HttpServletRequest request) {
			ArrayList<Population_dataVO> temp = service.get_population_data();
			return temp;
		}
		
		
		//////////////////////////////////////////////////////////////
		

		@RequestMapping("/smallcitys_list.do")
		@ResponseBody
		public ArrayList<SmallcitysVO> smallcitys_list(Model model, HttpServletRequest request) {
			String str = request.getParameter("city_value");
			int city_value = Integer.parseInt(str);
			ArrayList<SmallcitysVO> temp = service.smallcitys_list(city_value);
			return temp;
		}

		@RequestMapping("/smallupjongs_list.do")
		@ResponseBody
		public ArrayList<SmallupjongsVO> smallupjongs_list(Model model, HttpServletRequest request) {
			String str = request.getParameter("upjong_value");
			int upjong_value = Integer.parseInt(str);
			ArrayList<SmallupjongsVO> temp = service.smallupjongs_list(upjong_value);
			return temp;
		}
		
		@RequestMapping("/change_sales_graph.do")
		@ResponseBody
		public ArrayList<SalesVO> change_sales_graph(Model model, HttpServletRequest request) {
			String str1 = request.getParameter("city_value");
			String str2 = request.getParameter("upjong_value");
			String str3 = request.getParameter("cno");
			String str4 = request.getParameter("uno");
			int city_value = Integer.parseInt(str1);
			int upjong_value = Integer.parseInt(str2);
			int cno = Integer.parseInt(str3);
			int uno = Integer.parseInt(str4);
			ArrayList<SalesVO> temp = service.change_sales_graph(city_value,upjong_value,cno,uno);

			return temp;
		}
		

		@RequestMapping("/change_upso_graph.do")
		@ResponseBody
		public ArrayList<UpsoVO> change_upso_graph(Model model, HttpServletRequest request) {
			String str1 = request.getParameter("city_value");
			String str2 = request.getParameter("upjong_value");
			String str3 = request.getParameter("cno");
			String str4 = request.getParameter("uno");
			int city_value = Integer.parseInt(str1);
			int upjong_value = Integer.parseInt(str2);
			int cno = Integer.parseInt(str3);
			int uno = Integer.parseInt(str4);
			ArrayList<UpsoVO> temp = service.change_upso_graph(city_value,upjong_value,cno,uno);

			return temp;
		}
		

		

		@RequestMapping("/change_local_situation_graph.do")
		@ResponseBody
		public ArrayList<Local_situationVO> change_local_situation_graph(Model model, HttpServletRequest request) {
			String str1 = request.getParameter("city_value");
			String str2 = request.getParameter("upjong_value");
			String str3 = request.getParameter("cno");
			String str4 = request.getParameter("uno");
			int city_value = Integer.parseInt(str1);
			int upjong_value = Integer.parseInt(str2);
			int cno = Integer.parseInt(str3);
			int uno = Integer.parseInt(str4);
			ArrayList<Local_situationVO> temp = service.change_local_situation_graph(city_value, upjong_value, cno, uno);

			return temp;
		}
		
		
		
		
		
		
		
		
		
		/*
	
		//보기
		@RequestMapping("/board_view.do")
		public ModelAndView board_view(ModelAndView mav, long board_no, HttpServletRequest request) {
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
		}*/
}
