package web.howmany.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import web.howmany.domain.Criteria;
import web.howmany.domain.ReplyPageVO;
import web.howmany.domain.ReplyVO;

public interface ReplyService {

	//view
	public ReplyVO reply_view(long reply_no);
	
	//insert
	public void reply_insert(ReplyVO vo);
	
	//delete
	public void reply_delete(long reply_no);
	
	//update
	public void reply_update(ReplyVO vo);

	//list
	/*
	public ArrayList<ReplyVO> reply_list(Criteria cri, long board_no); 
	*/
	
	//paging with list
	public ReplyPageVO reply_list(Criteria cri, long board_no);
}
