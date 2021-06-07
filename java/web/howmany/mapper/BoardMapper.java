package web.howmany.mapper;

import java.util.ArrayList;

import web.howmany.domain.*;

public interface BoardMapper {

	//view
	public BoardVO board_view(long board_no);
	
	//list
	//public ArrayList<BoardVO> board_list();
	
	//insert
	public void board_insert(BoardVO board);
	
	//delete
	public void board_delete(long board_no);
	
	//update
	public void board_update(BoardVO board);
	
	//paging with list
	public ArrayList<BoardVO> board_list(Criteria cri);
	
	//paging용 혹은 게시물 전체 수
	public int board_count(Criteria cri);
}
