package web.howmany.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import web.howmany.domain.UserVO;
import web.howmany.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor //모든 파라메터를 받는 생성자를 생성해주는 코드라 합니다.
public class UserServiceImpl implements UserService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	
	//로그인
	@Override
	public UserVO user_login(UserVO vo) {
		// TODO Auto-generated method stub
		UserVO userData = mapper.user_login(vo);
		return userData;
	}
	
	//가입
	@Override
	public void user_register(UserVO vo) {
		// TODO Auto-generated method stub
		vo.setUser_lv("1");
		mapper.user_register(vo);
		
	}

	//정보수정
	@Override
	public void user_update(UserVO vo) {
		// TODO Auto-generated method stub
		mapper.user_update(vo);
	}

	//개인정보 불러오기
	@Override
	public UserVO user_profile(String id) {
		// TODO Auto-generated method stub
		UserVO temp = mapper.user_profile(id);
		return temp;
	}

	//리스트
	@Override
	public ArrayList<UserVO> user_list() {
		// TODO Auto-generated method stub
		ArrayList<UserVO> temp = mapper.user_list();
		return temp;
	}

	//삭제
	@Override
	public void user_delete(String id) {
		// TODO Auto-generated method stub
		mapper.user_delete(id);
	}

	//중복검사
	@Override
	public UserVO register_valid(String id) {
		// TODO Auto-generated method stub
		return mapper.register_valid(id);
	}

	

}
