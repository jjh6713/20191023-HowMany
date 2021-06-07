package web.howmany.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import web.howmany.domain.BoardVO;
import web.howmany.domain.Criteria;
import web.howmany.domain.ReplyPageVO;
import web.howmany.domain.ReplyVO;
import web.howmany.mapper.BoardMapper;
import web.howmany.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor //모든 파라메터를 받는 생성자를 생성해주는 코드라 합니다.
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	//view
	@Override
	public ReplyVO reply_view(long reply_no) {
		// TODO Auto-generated method stub
		
		return mapper.reply_view(reply_no);
	}

	//insert
	@Override
	public void reply_insert(ReplyVO vo) {
		// TODO Auto-generated method stub
		mapper.reply_insert(vo);
	}

	//delete
	@Override
	public void reply_delete(long reply_no) {
		// TODO Auto-generated method stub
		mapper.reply_delete(reply_no);
	}

	//update
	@Override
	public void reply_update(ReplyVO vo) {
		// TODO Auto-generated method stub
		mapper.reply_update(vo);
	}

	
	//list paging
	/*
	@Override
	public ArrayList<ReplyVO> reply_list(Criteria cri, long board_no) {
		// TODO Auto-generated method stub
		return mapper.reply_list(cri, board_no);
	}*/

	@Override
	public ReplyPageVO reply_list(Criteria cri, long board_no) {
		// TODO Auto-generated method stub
		return new ReplyPageVO(mapper.reply_count(board_no),mapper.reply_list(cri, board_no));
	}


}
