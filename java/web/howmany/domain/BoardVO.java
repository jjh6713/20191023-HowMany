package web.howmany.domain;

import lombok.Data;

@Data
public class BoardVO {

	private String board_no;
	private String board_writer; 
	private String board_name;
	private String board_content ; 
	private String board_date ; 
}
