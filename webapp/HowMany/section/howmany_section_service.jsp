<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<style>
	 .font-header {
        font-family: "Arial Black", sans-serif;
        font-size: 36px;
        font-weight: bold;
        color: #ffffff;
        text-shadow: 4px 4px 0px #2e2e2e, 8px 8px 0px #4f4f4f;
      }

	.selectpicker{    
		width: 240px;
	  	height: 40px;
	  	border-radius: 4px;
	  	background-color: #fff;
	  	border: solid 1px #cccccc;
	  	text-align: left;
	  	padding: 7.5px 15px;
	  	color: #000000;
	  	letter-spacing: 0.7px;
	  	margin: 10px;
	}
	
	.selectpicker-box{
		height:auto; 
		width:auto; 
		align-content:center;
   		overflow: hidden;
   		padding: 10px;
	}
	
	.container-box2{
		height:auto; 
		width:auto; 
		margin:0px;
		background:#ebebeb;
		text-align:center;
		padding:0px;
	    box-shadow: 7px 7px 5px 5px gray;
	}
	
	.container-box1{
		height:auto; 
		width:auto; 
		margin:0px;
		background:#ebebeb;
		text-align:center;
		padding:0px;
	    box-shadow: 7px 7px 5px 5px gray;
	}
	
	.button-set{
		padding-top:20px;
		padding-bottom:30px;
	}
	
	.button {
		-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
		margin: auto auto 20px 20px;
		max-width: 200px;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 50px;
		color: rgba(30, 22, 54, 0.6);
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}
	.button:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
</style>

<script>
	//그래프용
	var ctx = document.getElementById('myChart').getContext('2d');
	
	//지도용
	var mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일
	var map = null;
	
	//지도 옵션
	/*
	var mapOptions = {
		    center: new naver.maps.LatLng(37.500478, 126.867770),
		    zoom: 10
	}*/
	

	function arrayCheck(info, marker) {
		return function(e) {
			if (info.getMap()) {
				info.close();
			} else {
				info.open(map, marker);
			}
		}
	}
	
	 function onMarkerClick(population_count,population_date,i){
	      return function(e) {
	         console.log("click");
	      var dataArr = [];
	      for (var j = 0 ; j < i ; j++){
	         dataArr[j] = { Time: population_date[j], Count: population_count[j] };
	      }
	      $("#map_chart").empty();
	      
	      Morris.Line({
	              element: 'map_chart',
	              data: dataArr,
	            xkey: 'Time',
	            ykeys: ['Count'],
	            labels: ['Count']
	         });
	      
	      }
	   }
	//map 생성
	function initMap() {
		//리스너 적용하기위한 배열과 변수
		var population_count=[];
		var population_date=[];
		var i = 0;
		
        map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.500627, 126.867791),
            zoomControl: true,
            zoom: 10
        });

        <c:forEach items="${camera_status}" var="camera_status">
        	population_count = [];
        	population_date = [];
        	i = 0;
        	
        	//마커부분
	        marker = new naver.maps.Marker({
	     	    position: new naver.maps.LatLng("${camera_status.camera_position01}", "${camera_status.camera_position02}"),
	     	    map: map
	     	});

			<c:forEach items="${population_data}" var="population_data">
				<c:if test="${population_data.camera_id eq camera_status.camera_id}">
					population_count[i] = ${population_data.population_count};
					population_date[i] = ${population_data.population_date};
					i++;
				</c:if>
			</c:forEach>
			naver.maps.Event.addListener(marker, "click", onMarkerClick(population_count,population_date,i));
		</c:forEach>

    }

	///////////////////////////////////////
	
	//이 밑으로 전부 그래프 변화
	function change_city(){
		$.ajax({
			url:'/upso/smallcitys_list.do',
			type:"post",
			data:{"city_value":$("#big_city option:selected").val()},
			dataType:'json',
			success:function(data){
				$("#small_city").empty();
				$.each(data, function(idx,obj){
					  $("#small_city").get(0).options[idx] = new Option(obj.name, obj.cno);
				});
			}
		}); // ajax 통신으로 값이 변경되면 big_cit_str 을 넘겨주고 smallcitys_list를 받아온다. 이후 small_city 값 출력
	};
		

	function change_upjong(){
		$.ajax({
			url:'/upso/smallupjongs_list.do',
			type:"post",
			data:{"upjong_value":$("#big_upjong option:selected").val()},
			dataType:'json',
			success:function(data){
				$("#small_upjong").empty();
				$.each(data, function(idx,obj){
					  $("#small_upjong").get(0).options[idx] = new Option(obj.name, obj.uno);
				});
			}
		});
	};
	
	//sales graph 변경
	function change_sales_graph(){
		$.ajax({
			url:'/upso/change_sales_graph.do',
			type:"post",
			data:{"city_value":$("#big_city option:selected").val(),
				  "upjong_value":$("#big_upjong option:selected").val(),
				  "cno":$("#small_city option:selected").val(),
				  "uno":$("#small_upjong option:selected").val()
				  },
			dataType:'json',
			success:function(data){
				//그래프 초기화
				$("#dount_graph1").empty();
				$("#dount_graph2").empty();
				$("#bar_graph1").empty();
				$("#bar_graph2").empty();
				
				//bar char1
				Morris.Bar({
					  element: 'bar_graph1',
					  data: [
					    { y: '상반기 월 평균매출', a: data[0].sales1},
					    { y: '하반기 월 평균매출', a: data[0].sales2}
					  ],
					  xkey: 'y',
					  ykeys: ['a'],
					  labels: ['2018년도 월 평균매출 정보']
				});//bar chart1 끝

				//bar char1
				Morris.Bar({
					  element: 'bar_graph2',
					  data: [
					    { y: '상반기 건 단가', a: data[0].unitcost1},
					    { y: '하반기 건 단가', a: data[0].unitcost2}
					  ],
					  xkey: 'y',
					  ykeys: ['a'],
					  labels: ['2018년도 건 단가 정보']
				});//bar chart2 끝
				
				//도넛 차트1
				Morris.Donut({
					  element: 'dount_graph1',
					  data: [
					    {label: "상반기 월 평균매출", value: data[0].sales1},
					    {label: "하반기 월 평균매출", value: data[0].sales2}
					  ]
				});
				//도넛 차트 1끝
				
				//도넛 차트2
				Morris.Donut({
					  element: 'dount_graph2',
					  data: [
					    {label: '상반기 건 단가', value: data[0].unitcost1},
					    {label: '하반기 건 단가', value: data[0].unitcost2}
					  ]
				});
				//도넛 차트 2끝
				
			}//sucess 끝
		});
	};//sales graph 끝
	
	//upso graph 변경
	function change_upso_graph(){
		$.ajax({
			url:'/upso/change_upso_graph.do',
			type:"post",
			data:{"city_value":$("#big_city option:selected").val(),
				  "upjong_value":$("#big_upjong option:selected").val(),
				  "cno":$("#small_city option:selected").val(),
				  "uno":$("#small_upjong option:selected").val()
				  },
			dataType:'json',
			success:function(data){
				//그래프 초기화
				$("#dount_graph1").empty();
				$("#dount_graph2").empty();
				$("#bar_graph1").empty();
				$("#bar_graph2").empty();
				//bar chart 생성
				Morris.Bar({
					  element: 'dount_graph2',
					  data: [
					    { y: '상반기 데이터', a: data[0].half1},
					    { y: '하반기 데이터', a: data[0].half2}
					  ],
					  xkey: 'y',
					  ykeys: ['a'],
					  labels: ['Upso data']
				});//bar chart 끝
				//도넛 차트
				Morris.Donut({
					  element: 'dount_graph1',
					  data: [
					    {label: "상반기 데이터", value: data[0].half1},
					    {label: "하반기 데이터", value: data[0].half2}
					  ]
					});
				//도넛 차트 끝
				
			}//sucess 끝
		});
	};//upso graph 끝
	
	//local_situation graph 변경
	function change_local_situation_graph(){
		$.ajax({
			url:'/upso/change_local_situation_graph.do',
			type:"post",
			data:{"city_value":$("#big_city option:selected").val(),
				  "upjong_value":$("#big_upjong option:selected").val(),
				  "cno":$("#small_city option:selected").val(),
				  "uno":$("#small_upjong option:selected").val()
				  },
			dataType:'json',
			success:function(data){
				//그래프 초기화
				$("#dount_graph1").empty();
				$("#dount_graph2").empty();
				$("#bar_graph1").empty();
				$("#bar_graph2").empty();
				//bar chart 생성
				Morris.Bar({
					  element: 'dount_graph1',
					  data: [
					    { y: '총 가구수', a: data[0].t_household},
					    { y: '총 인구수', a: data[0].t_population},
					    { y: '주요 시설수', a: data[0].k_facility},
					    { y: '집객 시설수', a: data[0].landmark},
					    { y: '면적당 기준시가', a: data[0].standard_mp},
					    { y: '업소수', a: data[0].num_upso},
					    { y: '업소당 가구수', a: data[0].u_household},
					    { y: '업소당 시설물수', a: data[0].u_facility}
					  ],
					  xkey: 'y',
					  ykeys: ['a'],
					  labels: ['local_situation data']
				});//bar chart 끝
				//도넛 차트
				Morris.Donut({
					  element: 'dount_graph2',
					  data: [
					    {label: "총 가구수", value: data[0].t_household},
					    {label: "총 인구수", value: data[0].t_population},
					    {label: "주요 시설수", value: data[0].k_facility},
					    {label: "집객 시설수", value: data[0].landmark},
					    {label: "면적당 기준시가", value: data[0].standard_mp},
					    {label: "업소수", value: data[0].num_upso},
					    {label: "업소당 가구", value: data[0].u_household},
					    {label: "업소당 시설물수", value: data[0].u_facility}
					  ]
					});
				//도넛 차트 끝
				
			}//sucess 끝
		});
	};//local_situation graph 끝
</script>

<div class="container" style="text-align:center; padding-top:200px; padding-bottom:200px;">
	<!-- 컨테이너박스 1 지도와 수집 데이터 뿌려주는곳  -->
	<p class="font-header"> Collection Data </p>
	<div class="container-box1">
		<div id="map" style="width:100%;height:400px;"></div>
		<div id='map_chart'  style="width:100%;height:400px;"></div>
	</div>
	<p class="font-header"> Crawling Data </p>
	<!-- 컨테이너박스 2 크롤링 데이터 뿌려주는곳  -->
	<div class="container-box2">
		<!-- 선택 박스 부분 -->
		<div class="selectpicker-box">
			<select id="big_city" class="selectpicker" onchange="change_city()">
			    <option value="" selected disabled>선택해주세요.</option>
			    <c:forEach items="${bigcitys_list}" var="bigcitys_list">
			        <option value="${bigcitys_list.city_value}">${bigcitys_list.name}</option>
			    </c:forEach>
			</select>
			<select id="big_upjong" class="selectpicker" onchange="change_upjong()">
			    <option value="" selected disabled>선택해주세요.</option>
			    <c:forEach items="${bigupjongs_list}" var="bigupjongs_list">
			        <option value="${bigupjongs_list.upjong_value}">${bigupjongs_list.name}</option>
			    </c:forEach>
			</select>
			<select id="small_city" class="selectpicker">
			</select>
			<select id="small_upjong" class="selectpicker">
			</select>
			<div class="button-set">
				<button class="button" onclick="change_sales_graph()">매출 현황</button>
				<button class="button" onclick="change_upso_graph()">업소 현황</button>
				<button class="button" onclick="change_local_situation_graph()">지역 현황</button>
			</div>
		</div>
		
		<!-- 그래프 표시하는 부분 -->
		<div style="width:auto; height:auto;">
			<table>		
				<tr>
					<td>
						<!-- 상반기 -->
						<div id="dount_graph1"></div>
					</td>
					<td>
						<!-- 하반기 -->
						<div id="dount_graph2"></div>
					</td>
				</tr>
			</table>
			<table>	
				<tr>
					<td>
						<!-- 상반기 -->
						<div id="bar_graph1"></div>
					</td>
					<td>
						<!-- 하반기 -->
						<div id="bar_graph2"></div>
					</td>
				</tr>
			</table>
		</div><!-- 그래프표시 부분 끝 -->
	</div><!-- 컨테이너박스2 끝 -->
</div>

