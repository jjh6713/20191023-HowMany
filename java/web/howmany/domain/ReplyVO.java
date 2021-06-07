package web.howmany.domain;

import lombok.Data;

@Data
public class ReplyVO {

	private String reply_no;
	private String board_no;
	private String reply_content;
	private String reply_writer; 
	private String reply_date;
	private String reply_update_date; 
}
