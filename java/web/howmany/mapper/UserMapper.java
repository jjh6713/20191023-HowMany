package web.howmany.mapper;

import java.util.ArrayList;

import web.howmany.domain.UserVO;

public interface UserMapper {

	//login
	public UserVO user_login(UserVO vo);
	
	//register
	public void user_register(UserVO vo);

	//중복 체크
	public UserVO register_valid(String id);
	
	//수정
	public void user_update(UserVO vo);
	
	//읽기
	public UserVO user_profile(String id);
	
	//리스트
	public ArrayList<UserVO> user_list();
	
	//삭제
	public void user_delete(String id);
}
