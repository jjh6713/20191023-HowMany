package web.howmany.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import web.howmany.domain.BoardVO;
import web.howmany.domain.Camera_statusVO;
import web.howmany.domain.Population_dataVO;
import web.howmany.upso.BigcitysVO;
import web.howmany.upso.BigupjongsVO;
import web.howmany.upso.Local_situationVO;
import web.howmany.upso.SalesVO;
import web.howmany.upso.SmallcitysVO;
import web.howmany.upso.SmallupjongsVO;
import web.howmany.upso.UpsoVO;

public interface UpsoService {

	//list 1
	public ArrayList<BigcitysVO> bigcitys_list();
	
	//list 2
	public ArrayList<BigupjongsVO> bigupjongs_list();
	
	//list 3
	public ArrayList<Local_situationVO> local_situation_list();
	
	//list 4
	public ArrayList<SalesVO> sales_list();
	
	//list 5
	public ArrayList<SmallcitysVO> smallcitys_list(int city_value);
	
	//list 6
	public ArrayList<SmallupjongsVO> smallupjongs_list(int upjong_value);
	
	//list 7
	public ArrayList<UpsoVO> upso_list();
	
	//sales graph 변경
	public ArrayList<SalesVO> change_sales_graph(int city_value,int upjong_value,int cno,int uno);
	

	//upso graph 변경
	public ArrayList<UpsoVO> change_upso_graph(int city_value,int upjong_value,int cno,int uno);
	

	//여러 값을 넘겨줄 때는 mapper 인터페이스 부분에 각각 @Param해주어야함!!!!!!
	//sales graph 변경
	public ArrayList<Local_situationVO> change_local_situation_graph(int city_value, int upjong_value,int cno,int uno);

	
	//get_camera_status
	public ArrayList<Camera_statusVO> get_camera_status();
	
	//get_population_data
	public ArrayList<Population_dataVO> get_population_data();
	
	public ArrayList<Population_dataVO> get_population_list(String camera_id);
}
