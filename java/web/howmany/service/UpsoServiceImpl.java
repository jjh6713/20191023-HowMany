package web.howmany.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.howmany.domain.Camera_statusVO;
import web.howmany.domain.Population_dataVO;
import web.howmany.mapper.UpsoMapper;
import web.howmany.upso.BigcitysVO;
import web.howmany.upso.BigupjongsVO;
import web.howmany.upso.Local_situationVO;
import web.howmany.upso.SalesVO;
import web.howmany.upso.SmallcitysVO;
import web.howmany.upso.SmallupjongsVO;
import web.howmany.upso.UpsoVO;
import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor //모든 파라메터를 받는 생성자를 생성해주는 코드라 합니다.
public class UpsoServiceImpl implements UpsoService {

	@Setter(onMethod_ = @Autowired)
	private UpsoMapper mapper;

	//list 1
	@Override
	public ArrayList<BigcitysVO> bigcitys_list() {
		// TODO Auto-generated method stub
		ArrayList<BigcitysVO> temp = mapper.bigcitys_list();
		return temp;
	}

	//list 2
	@Override
	public ArrayList<BigupjongsVO> bigupjongs_list() {
		// TODO Auto-generated method stub
		ArrayList<BigupjongsVO> temp = mapper.bigupjongs_list();
		return temp;
	}

	//list 3
	@Override
	public ArrayList<Local_situationVO> local_situation_list() {
		// TODO Auto-generated method stub
		ArrayList<Local_situationVO> temp = mapper.local_situation_list();
		return temp;
	}

	//list 4
	@Override
	public ArrayList<SalesVO> sales_list() {
		// TODO Auto-generated method stub
		ArrayList<SalesVO> temp = mapper.sales_list();
		return temp;
	}

	//list 5
	@Override
	public ArrayList<SmallcitysVO> smallcitys_list(int city_value) {
		// TODO Auto-generated method stub
		ArrayList<SmallcitysVO> temp = mapper.smallcitys_list(city_value);		
		return temp;
	}

	//list 6
	@Override
	public ArrayList<SmallupjongsVO> smallupjongs_list(int upjong_value) {
		// TODO Auto-generated method stub
		ArrayList<SmallupjongsVO> temp = mapper.smallupjongs_list(upjong_value);
		return temp;
	}

	//list 7
	@Override
	public ArrayList<UpsoVO> upso_list() {
		// TODO Auto-generated method stub
		ArrayList<UpsoVO> temp = mapper.upso_list();
		return temp;
	}

	@Override
	public ArrayList<SalesVO> change_sales_graph(int city_value,int upjong_value,int cno, int uno) {
		// TODO Auto-generated method stub
		ArrayList<SalesVO> temp = mapper.change_sales_graph(city_value,upjong_value,cno,uno);
		return temp;
	}

	@Override
	public ArrayList<UpsoVO> change_upso_graph(int city_value, int upjong_value, int cno, int uno) {
		// TODO Auto-generated method stub
		ArrayList<UpsoVO> temp = mapper.change_upso_graph(city_value,upjong_value,cno,uno);
		return temp;
	}

	@Override
	public ArrayList<Local_situationVO> change_local_situation_graph(int city_value, int upjong_value, int cno,
			int uno) {
		// TODO Auto-generated method stub
		ArrayList<Local_situationVO> temp = mapper.change_local_situation_graph(city_value, upjong_value, cno, uno);
		return temp;
	}

	//camera status
	@Override
	public ArrayList<Camera_statusVO> get_camera_status() {
		// TODO Auto-generated method stub
		ArrayList<Camera_statusVO> temp = mapper.get_camera_status();
		return temp;
	}

	//population data
	@Override
	public ArrayList<Population_dataVO> get_population_data() {
		// TODO Auto-generated method stub
		ArrayList<Population_dataVO> temp = mapper.get_population_data();
		return temp;
	}
	
	@Override
	public ArrayList<Population_dataVO> get_population_list(String camera_id) {
		// TODO Auto-generated method stub
		ArrayList<Population_dataVO> temp = mapper.get_population_list(camera_id);
		return temp;
	}


}
