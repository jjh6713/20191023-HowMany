package web.howmany.domain;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageVO {

	private int reply_count;
	private ArrayList<ReplyVO> reply_list;
}
