package web.howmany.domain;

import lombok.Data;

//VO(Value Object)
@Data
public class UserVO {
	
	private String user_id ;
	private String user_password ;
	private String user_name ;
	private String user_tel ;
	private String user_location ;
	private String user_lv ;
}