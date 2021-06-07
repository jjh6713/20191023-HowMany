package web.howmany.controller;

import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
import web.howmany.domain.Camera_statusVO;
import web.howmany.domain.Population_dataVO;
import web.howmany.service.UpsoService;
import web.howmany.upso.Local_situationVO;
import web.howmany.upso.SalesVO;
import web.howmany.upso.SmallcitysVO;
import web.howmany.upso.SmallupjongsVO;
import web.howmany.upso.UpsoVO;

@RestController
@RequestMapping("/app")
public class UpsoRestController {
	@Setter(onMethod_ = @Autowired)
	private UpsoService service;

	@CrossOrigin
	@RequestMapping(value="/local/{key}", method=RequestMethod.GET)
	public @ResponseBody ArrayList<JSONObject> localList(@PathVariable(value = "key") String key) {
		
		ArrayList<JSONObject> boards = new ArrayList<>();
		ArrayList<SmallcitysVO> volist = new ArrayList<>();

		volist = service.smallcitys_list(Integer.parseInt(key));

		for(int i = 0; i < volist.size(); i++) {
			JSONObject board = new JSONObject();
			
			board.put("local_name", volist.get(i).getName());
			board.put("local_no", volist.get(i).getCno());
			boards.add(board);
		 }
		return boards;
	 }
	
	@CrossOrigin
	@RequestMapping(value="/detail_upso/{key}", method=RequestMethod.GET)
	public @ResponseBody ArrayList<JSONObject> interList(@PathVariable(value = "key") String key) {
		
		ArrayList<JSONObject> boards = new ArrayList<>();
		ArrayList<SmallupjongsVO> volist = new ArrayList<>();
		
		volist = service.smallupjongs_list(Integer.parseInt(key));

		for(int i = 0; i < volist.size(); i++) {
			JSONObject board = new JSONObject();

			board.put("detail_name", volist.get(i).getName());
			board.put("detail_no", volist.get(i).getUno());
			boards.add(board);
		 }
		return boards;
	 }
	
	@CrossOrigin
	@RequestMapping(value="/ldata/{key}", method=RequestMethod.GET)
	public @ResponseBody JSONObject localDataPost(@PathVariable(value = "key") String key) {
		
		JSONObject data = new JSONObject();
		
		// 데이터 매핑 객체
		ArrayList<Local_situationVO> volist = new ArrayList<>();

		String city = key.split("_")[0];
		String local = key.split("_")[1];
		String inter = key.split("_")[2];
		String detail = key.split("_")[3];
		
		volist = service.change_local_situation_graph
				(Integer.parseInt(city), Integer.parseInt(inter), 
				Integer.parseInt(local), Integer.parseInt(detail));
		
		if(volist.isEmpty()) {
			data.put("noData", "true");
		} else {
			data.put("tPopul", volist.get(0).getT_population());
			data.put("tHousehold", volist.get(0).getT_household());
			data.put("landmark", volist.get(0).getLandmark());
			
			data.put("standardMP", volist.get(0).getStandard_mp());
			
			data.put("uFacility", volist.get(0).getU_facility());
			data.put("kFacility", volist.get(0).getK_facility());
		}
		return data;
	 }
	
	@CrossOrigin
	@RequestMapping(value="/income/{key}", method=RequestMethod.GET)
	public @ResponseBody JSONObject incomeDataPost(@PathVariable(value = "key") String key) {
		
		JSONObject data = new JSONObject();
		
		// 데이터 매핑 객체
		ArrayList<SalesVO> volist = new ArrayList<>();
		
		String city = key.split("_")[0];
		String local = key.split("_")[1];
		String inter = key.split("_")[2];
		String detail = key.split("_")[3];
		
		volist = service.change_sales_graph
				(Integer.parseInt(city), Integer.parseInt(inter), 
				Integer.parseInt(local), Integer.parseInt(detail));
		
		if(volist.isEmpty()) {
			data.put("noData", "true");
		} else {
			// 상, 하반기 평균매출
			data.put("sales1", volist.get(0).getSales1());
			data.put("sales2", volist.get(0).getSales2());
			
			// 상 하반기 단가
			data.put("unitcost1", volist.get(0).getSales1());
			data.put("unitcost2", volist.get(0).getSales2());
		}

		return data;
	 }
	
	@CrossOrigin
	@RequestMapping(value="/upso/{key}", method=RequestMethod.GET)
	public @ResponseBody JSONObject upsoDataPost(@PathVariable(value = "key") String key) {
		
		JSONObject data = new JSONObject();
		
		// 데이터 매핑 객체
		ArrayList<UpsoVO> volist = new ArrayList<>();
		
		String city = key.split("_")[0];
		String local = key.split("_")[1];
		String inter = key.split("_")[2];
		String detail = key.split("_")[3];
		
		
		volist = service.change_upso_graph
				(Integer.parseInt(city), Integer.parseInt(inter), 
				 Integer.parseInt(local), Integer.parseInt(detail));

		if(volist.isEmpty()) {
			data.put("noData", "true");
		} else {
			data.put("upsoH1", volist.get(0).getHalf1());
			data.put("upsoH2", volist.get(0).getHalf2());
			data.put("percent", volist.get(0).getPercent());
		}
		return data;
	 }
	
	@CrossOrigin
	@RequestMapping(value="/camerastatus", method=RequestMethod.POST)
	public @ResponseBody ArrayList<Camera_statusVO> getCameraStatus() {
		
		ArrayList<Camera_statusVO> volist = service.get_camera_status();
		return volist;
	 }
	
	@CrossOrigin
	@RequestMapping(value="/populationlist", method=RequestMethod.POST)
	public @ResponseBody ArrayList<Population_dataVO> getPopulationList(@RequestBody String camera_id) throws ParseException {
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = (JSONObject) parser.parse(camera_id);
		String camera = (String) jsonObj.get("camera_id");
		ArrayList<Population_dataVO> volist = service.get_population_list(camera);
		
		return volist;
	 }
}
