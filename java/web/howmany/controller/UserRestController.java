package web.howmany.controller;

import java.util.Map;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import lombok.Setter;
import web.howmany.domain.UserVO;
import web.howmany.service.UserService;

@RestController
@RequestMapping("/app")
public class UserRestController {
	
	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	// POST방식으로 데이터 받음.
		@CrossOrigin
		@RequestMapping(value="/login", method=RequestMethod.POST)
		//Map에 전송된 파라미터 이름은 id, password임.
		//@RequestParam은 GET용, @RequestBody는 POST용
		public UserVO login(@RequestBody String data) throws ParseException {
			//Gson = Json Text를 자동으로 VO로 할당해주는 라이브러리
			//단, 변수명이 동일해야함.
			UserVO userVO = new Gson().fromJson(data, UserVO.class);
			
			if(service.user_login(userVO) != null) {
				System.out.println("서비스 통과완료");
				return service.user_profile(userVO.getUser_id());
			} else {
				System.out.println("서비스 통과실패");
				return null;
			}
		}

	
	@CrossOrigin
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public UserVO register(@RequestBody String data) {
		
		UserVO userVO = new Gson().fromJson(data, UserVO.class);
		
		service.user_register(userVO);
		return userVO;
	}
}
