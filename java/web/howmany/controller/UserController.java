package web.howmany.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import web.howmany.domain.UserVO;
import web.howmany.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
		@Setter(onMethod_ = @Autowired)
		private UserService service;
		
		//로그인
		@RequestMapping("/login.do")
		public ModelAndView login(UserVO vo, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			if (service.user_login(vo) != null) {
				//login session 설정
				session.setAttribute("loginId", service.user_login(vo).getUser_id());
				session.setAttribute("loginLv", service.user_login(vo).getUser_lv());
				mav.setViewName("howmany_main");
			}else {
				//로그인 실패
				mav.addObject("login_pass","failure");
				mav.setViewName("login/howmany_login");
			}
			return mav;
		}
	
		//로그아웃
		//이 부분 resolver에서 수정함
		
		@RequestMapping("/logout.do")
		public ModelAndView logout(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			session.invalidate();
			mav.setViewName("howmany_main");
			return mav;
		}
	
	
		//가입
		@RequestMapping("/register.do")
		public ModelAndView register(UserVO vo) {
			
			ModelAndView mav = new ModelAndView();
			
			service.user_register(vo);
			
			mav.setViewName("redirect:/HowMany/login/howmany_login.jsp");
			
			return mav;
		}
		

		//중복검사
		@RequestMapping("/register_valid.do")
		@ResponseBody
		public String register_valid( HttpServletRequest request) {
			String user_id = request.getParameter("user_id");
			String ck;
			UserVO temp = service.register_valid(user_id);
			//비어있을경우
			if(temp==null) { 
				//1이면 중복되는 값이 없다!
				ck="1";	
			}else {
				//2면 중복되는 값이 있따!!
				ck="2";	
			}
			return ck;
		}

		//리스트
		@RequestMapping("/user_list.do")
		public String user_List(Model model) {
			model.addAttribute("userList",service.user_list());
			//경로
			return "howmany_main.jsp?CONTENTPAGE=section/howmany_section_manager";
		}
		
		//유저갱신
		@RequestMapping("/user_update.do")
		public String user_update(UserVO vo, HttpSession session) {
			//경로 두가지로 나누어야함! 1일 경우 일반 유저 2 일경우 매니저모드
			UserVO temp = service.user_profile(vo.getUser_id());
			if(session.getAttribute("loginLv").equals("1")) {
				service.user_update(vo);
				return "redirect:/user/user_profile.do?user_id="+temp.getUser_id();
			}else{
				service.user_update(vo);
				return "redirect:/user/user_list.do";
			}
			
		}
		
		//유저삭제
		@RequestMapping("/user_delete.do")
		public String user_delete(String user_id, HttpSession session) {
			//경로 두가지로 나누어야함! 1일 경우 일반 유저 2 일경우 매니저모드
			if(session.getAttribute("loginLv").equals("1")) {
				service.user_delete(user_id);
				session.invalidate();
				return "howmany_main.jsp?CONTENTPAGE=section/howmany_section_main";
			}else{
				service.user_delete(user_id);
				return "redirect:/user/user_list.do";
			}
		}
		
		//유저정보
		@RequestMapping("/user_profile.do")
		public ModelAndView user_profile(ModelAndView mav, String user_id) {
			UserVO temp = service.user_profile(user_id);
			mav.addObject("profile",temp);
			mav.setViewName("howmany_main.jsp?CONTENTPAGE=section/howmany_section_profile");
			return mav;
		}
		
		
		//경로는 여기가 핵심
		/*
		@RequestMapping("/HowMany/login/login.do")
		public String login(UserVO vo, UserDAO userDAO) {
			if (userDAO.getUser(vo) != null) {
				System.out.print("성공 :" + vo.getUser_id());
				// 테스트용
				return "howmany_main";
			}else {
				return "login.jsp";
			}
			//resolver 쓰면 css 적용이 안댐!
		}
		*/
}
