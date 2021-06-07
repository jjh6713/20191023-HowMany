package web.howmany.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import web.howmany.domain.BoardVO;
import web.howmany.domain.Criteria;
import web.howmany.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor //모든 파라메터를 받는 생성자를 생성해주는 코드라 합니다.
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	//보기
	@Override
	public BoardVO board_view(long board_no) {
		// TODO Auto-generated method stub
		BoardVO temp = mapper.board_view(board_no);
		return temp;
	}

	//리스트
	/*
	@Override
	public ArrayList<BoardVO> board_list() {
		// TODO Auto-generated method stub
		ArrayList<BoardVO> temp = mapper.board_list();
		return temp;
	}*/

	//삽입
	@Override
	public void board_insert(BoardVO board) {
		// TODO Auto-generated method stub
		mapper.board_insert(board);
	}

	//삭제
	@Override
	public void board_delete(long board_no) {
		// TODO Auto-generated method stub
		mapper.board_delete(board_no);
	}

	//업데이트
	@Override
	public void board_update(BoardVO board) {
		// TODO Auto-generated method stub
		mapper.board_update(board);
	}

	//리스트와 페이징처리
	@Override
	public ArrayList<BoardVO> board_list(Criteria cri) {
		// TODO Auto-generated method stub
		//System.out.println("/////////////////////////////////////"+mapper.getListWithPaging(cri).get(0));
		ArrayList<BoardVO> temp = mapper.board_list(cri);
		if(temp.isEmpty()) {
			BoardVO temp2 = new BoardVO();
			temp2.setBoard_content("글이 없습니다.");
			temp.add(temp2);
			return temp;
		}else {
			return temp;	
		}
	}

	//게시물 전체 수
	@Override
	public int board_count(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.board_count(cri);
	}

}
