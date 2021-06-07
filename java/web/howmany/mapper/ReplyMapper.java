package web.howmany.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import web.howmany.domain.*;

public interface ReplyMapper {

	//view
	public ReplyVO reply_view(long reply_no);
	
	//insert
	public void reply_insert(ReplyVO vo);
	
	//delete
	public void reply_delete(long reply_no);
	
	//update
	public void reply_update(ReplyVO vo);

	//paging with list ???
	public ArrayList<ReplyVO> reply_list(@Param("cri") Criteria cri, @Param("board_no") long board_no); 

	//reply count
	public int reply_count(Long board_no);
}
