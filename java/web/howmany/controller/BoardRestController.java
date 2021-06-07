package web.howmany.controller;

import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import lombok.Setter;
import web.howmany.domain.BoardVO;
import web.howmany.service.BoardService;
import web.howmany.domain.Criteria;

@RestController
@RequestMapping("/app")
public class BoardRestController {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	private Criteria cri = new Criteria(1, 100);

	@CrossOrigin
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public ArrayList<JSONObject> boardList(Locale locale, Model model) {
		
		ArrayList<JSONObject> boards = new ArrayList<>();
		ArrayList<BoardVO> volist = new ArrayList<>();

		volist = service.board_list(cri);

		for(int i = 0; i < volist.size(); i++) {
	         JSONObject board = new JSONObject();
	         
	         board.put("title", volist.get(i).getBoard_name());
	         board.put("number", volist.get(i).getBoard_no());
	         board.put("username", volist.get(i).getBoard_writer());   
	         boards.add(board);
	       }
	      System.out.println(boards);
	      return boards;
	 }
	
	@CrossOrigin
	@RequestMapping(value="/detail/{key}", method=RequestMethod.GET)
	public @ResponseBody JSONObject boardDetail(@PathVariable(value = "key") String key) {
		System.out.println(key);
		JSONObject board = new JSONObject();
		
		BoardVO vo = service.board_view(Integer.parseInt(key));
		
		board.put("title", vo.getBoard_name());
		board.put("content", vo.getBoard_content());
		board.put("writer", vo.getBoard_writer());
		
		return board;
	 }
	
	 @CrossOrigin
	 @RequestMapping(value = "/create", method = RequestMethod.POST)
	 public @ResponseBody String createBoard(@RequestBody String param) {
     System.out.println(param);
	 BoardVO vo =  new Gson().fromJson(param, BoardVO.class);
	 System.out.println(vo);
	 if(vo.getBoard_content() != null && vo.getBoard_name() != null) {
		 service.board_insert(vo);
	 }
	 return "/";
	 }
}
