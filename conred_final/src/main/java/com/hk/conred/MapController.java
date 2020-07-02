package com.hk.conred;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.conred.dtos.CListDto;
import com.hk.conred.dtos.ReplyDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;
import com.hk.conred.dtos.SPhotoDto;
import com.hk.conred.dtos.STimeDto;
import com.hk.conred.dtos.SubwayDto;
import com.hk.conred.service.IMapService;
import com.hk.conred.service.IReplyService;
import com.hk.conred.service.ISService;
import com.hk.conred.service.ISubwayService;
import com.hk.conred.service.SServiceImp;


@Controller
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@Autowired
	private ISService sService; 
	@Autowired 
	private IMapService mapService;
	@Autowired
	private IReplyService replyService;
	@Autowired
	private ISubwayService subwayService;
	
	//얘는 임시 테스트용 - 다른거 하나 만들면 바로 폐기각
	@RequestMapping(value = "map.do", method = RequestMethod.GET)
	public String map(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 {}.", locale);
		
		//map.do를 검색방법에 따라 나눠야하나 ㅇㅇ
		//1.검색창
		//파라미터:seq=검색어
		//2.카테고리검색(+all,내주변=select*(만약 내 위치 허용이 안되어있다면 내 주변 말고 기본지정위치에서 all))
		//파라미터:cate=카테고리
		//3.지도안에서의 검색+카테고리 검색
		//파라미터:seq=검색어&cate=카테고리
		
//		String[] store_seq_list =store_seq.split(",");
//		List<SDto> list = sService.StoreSeqList(store_seq_list);
		
//		model.addAttribute("list",list);
		
//		이 주석들은 지도가 구현되어서 지도안의 매장들의 seq값을가져올 때 사용되는데 아마 map.do에서 가 아니라
//		all/map.jsp에서 ajax로 화면안에 매장들을 뿌려주고
//		그 뿌려준 값들을 오른쪽 매장리스트에 넣을것이다
//		그렇기때문에 아마 쓸일 없을듯하지만 일단은 주석처리해놓음
		
//		가 아니라 모든 store들을 조회해서 가져가기에 seq값은 필요없고
//		대신에
		
		//
		return "all/map"; 
	}
	
	
	//index에서 카테고리로 검색
	@RequestMapping(value = "map_category.do", method = RequestMethod.GET)
	public String map_category(Locale locale, Model model,String category_code) {
		logger.info("맵으로 이동 : 카테고리검색 {}.", locale);//카테고리로 store_seq검색해줌

		model.addAttribute("category_code",category_code);
		
		return "all/map"; 
	}
	
	//index에서 키워드로 검색
	@RequestMapping(value = "map_keyword.do",  method = {RequestMethod.GET,RequestMethod.POST})
	public String map_keyword(Locale locale, Model model, String keyword) {
		logger.info("맵으로 이동 : 키워드검색 {}.", locale);
		//1.검색창(지역명, 지하철역명, 매장명 검색 = 얘네도 각각 따로 나눠줄지? 왜냐하면 연관검색어로 나오는 키워드로만 검색이되기때문에 나눠줄 수 있음)
		//안나눠줄경우 검색의 정확도가 떨어질 가능성이 높다.
		//하지만 나눠줄경우 검색어+카테고리로 검색시 번거로워질 수 있다.(걔도 3개씩짜야할 수 있다는 뜻: 하나하면 나머지는 쉽겠지만.)
		//파라미터:keyword=검색어&myloca=내현재위치(없으면 지정위치)
		//내 현재위치 값은 받지 않는다.
		//파라미터:keyword=검색어
		
		model.addAttribute("keyword",keyword);
		
		return "all/map"; 
	}
	
	//ajax - 키워드검색 : 지역검색성공시 실행될 카테고리전체검색
	//지금 얘는 사용안함. 추후에 사용할일 있을지몰라 지우진않음.
	//map_category.do 를 ajax화시킨것 뿐 
	@ResponseBody
	@RequestMapping(value = "map_category_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String map_category_ajax(Locale locale, Model model,String category_code) {
		logger.info("ajax : 지역검색성공시, 카테고리로 store_seq 검색 {}.", locale);
		System.out.println(category_code);
		model.addAttribute("category_code",category_code);
		
		return category_code; 
	}

	//ajax - 키워드검색 : 지역검색실패시 실행될 지하철검색
	@ResponseBody
	@RequestMapping(value = "map_subway_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> map_subway_ajax(Locale locale, Model model,String keyword) {
		logger.info("ajax : 지하철 정보 검색 {}.", locale);
		String keyword_subway =keyword.replace("역","");
		System.out.println(keyword_subway);
		SubwayDto dto = subwayService.subway_search(keyword_subway);
		System.out.println(dto);
		Map<String, Object> map = new HashMap<>();
		if(dto!=null) {
//			model.addAttribute("subway_info",dto);
			map.put("subway_info", dto);
		}else if(dto==null){
			Map<String, Object> map2 = new HashMap<>();
			map2.put("subway_name", "false");
			map.put("subway_info", map2);
		}
		return map;
	}
	
	//ajax - 키워드검색 : 지하철역검색실패시 실행될 매장검색
	@ResponseBody
	@RequestMapping(value = "map_store_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> map_store_ajax(Locale locale, Model model,String keyword) {
		logger.info("ajax : 매장 정보 검색 {}.", locale);
		System.out.println(keyword);
		SDto dto = mapService.searchKey_ajax(keyword);
		System.out.println(dto);
		Map<String, Object> map = new HashMap<>();
		if(dto!=null) {
			map.put("store_info", dto);
		}else if(dto==null){
			Map<String, Object> map2 = new HashMap<>();
			map2.put("store_name", "false");
			map.put("store_info", map2);
		}
		return map;
	}
	
	//ajax - 키워드검색 : 매장검색 성공시 가져올 특정 매장의 상세정보
	@ResponseBody
	@RequestMapping(value = "map_storedetail_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> map_storedetail_ajax(Locale locale, Model model,int store_seq) {
		logger.info("ajax : 매장 정보 검색_detail {}.", locale);
		System.out.println("매장번호:"+store_seq);
		SDto sdto = new SDto();
		sdto.setStore_seq(store_seq);
		List<SDto> list =new ArrayList<SDto>();
		list.add(sdto);
		System.out.println("과연들어가질까"+list.get(0).getStore_seq());
		List<SPhotoDto> photolist=mapService.getPhotos_ajax(list);
		System.out.println("photolist:"+photolist);
		List<CListDto> catelist=mapService.getCates_ajax(list);
		System.out.println("catelist:"+catelist);
		List<String> catenamelist = new ArrayList<>();
		String box ="";
		for (int i = 0; i < catelist.size(); i++) {
			if(i==0){//처음시작엔 무조건 box안에 값저장
				box=catelist.get(i).getCategory_name_small()+" | ";
			}else if(catelist.get(i).getStore_seq()==catelist.get(i-1).getStore_seq()){//직전 seq와 같다면
				box+=catelist.get(i).getCategory_name_small()+" | ";
			}else if(catelist.get(i).getStore_seq()!=catelist.get(i-1).getStore_seq()){//직전 seq와 틀리다면
				box = box.substring(0, box.length()-3);
				catenamelist.add(box);
				System.out.println("중간끝");
				System.out.println(i+box);
				box="";
				box+=catelist.get(i).getCategory_name_small()+" | ";
			}
			if(i==catelist.size()-1) {//마지막이라면 이제까지것 저장(뒤에세글자제외하고)
				box = box.substring(0, box.length()-3);
				catenamelist.add(box);
				System.out.println("완전끝");
				System.out.println(i+box);
			}
			System.out.println(i+box);
		}
		System.out.println("catenamelist:"+catenamelist);

		List<STimeDto> stimelist= mapService.getStime_ajax(list);
		System.out.println("stimelist:"+stimelist);

		Calendar cal = Calendar.getInstance(); 
		int num = cal.get(Calendar.DAY_OF_WEEK)-1;// 
	    System.out.println(num); 
//	      System.out.println(today); 
//	      System.out.println("오늘의 요일 : " + today ); 
	      
		List<SLocaDto> slocalist=mapService.getSloca_ajax(list);
		System.out.println(slocalist);
		
		Map<String, Object> map = new HashMap<>();
		map.put("today", num);
//		map.put("list", list); 
		map.put("photolist", photolist); 
		map.put("catelist", catenamelist); 
		map.put("stimelist", stimelist); 
		map.put("slocalist", slocalist); 
		
//		if(dto!=null) {
//			map.put("store_info", dto);
//		}else if(dto==null){
//			Map<String, Object> map2 = new HashMap<>();
//			map2.put("store_name", "false");
//			map.put("store_info", map2);
//		}
		
		return map;
	}
	
	//ajax - 카테고리검색 : 카테고리검색 실행(전체카테고리, 개별카테고리)
	@ResponseBody
	@RequestMapping(value = "searchCateAll_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> map_test(Locale locale, Model model,int pnum,String category_code, String nelat, String nelng, String swlat, String swlng) {
		logger.info("맵에서 아작스로 카테고리검색 {}.", locale);
		//2.카테고리검색(대분류 카테고리)(+all,내주변=select*(만약 내 위치 허용이 안되어있다면 내 주변 말고 기본지정위치에서 all))
		//파라미터:category=카테고리&mylocation=내현재위치(없으면 지정위치)
		//기본적으로 내 위치권한이 허용되어있다면 위치대로 / 아니라면 지정위치 
		System.out.println(nelat);
		System.out.println(nelng);
		System.out.println(swlat);
		System.out.println(swlng); 
		System.out.println(category_code); 
		
		List<SDto> list =new ArrayList<SDto>();
		if(category_code.equals("all")||category_code=="") {
			//전체 카테고리 검색
			System.out.println("전체카테고리검색 실행!");
			list=mapService.searchCateAll_ajax(nelat,nelng,swlat,swlng);
		}else {
			//각 카테고리별 검색
			System.out.println("카테고리코드 : '"+category_code+"' 검색 실행!");
			list=mapService.searchCate_ajax(pnum,category_code,nelat,nelng,swlat,swlng);
//			list=mapService.searchCate(category_code);
		}
		System.out.println("1"+list);
		Map<String, Object> map=new HashMap<>();
		System.out.println("2"+list);
		
//		List<SPhotoDto> photolist =new ArrayList<>();
		if(list.isEmpty()) {
			
		}else {
			System.out.println("3");
			System.out.println("list:"+list);
			List<SPhotoDto> photolist=mapService.getPhotos_ajax(list);
			System.out.println("photolist:"+photolist);
			List<CListDto> catelist=mapService.getCates_ajax(list);
			System.out.println("catelist:"+catelist);
			List<String> catenamelist = new ArrayList<>();
			String box ="";
			for (int i = 0; i < catelist.size(); i++) {
				if(i==0){//처음시작엔 무조건 box안에 값저장
					box=catelist.get(i).getCategory_name_small()+" | ";
				}else if(catelist.get(i).getStore_seq()==catelist.get(i-1).getStore_seq()){//직전 seq와 같다면
					box+=catelist.get(i).getCategory_name_small()+" | ";
				}else if(catelist.get(i).getStore_seq()!=catelist.get(i-1).getStore_seq()){//직전 seq와 틀리다면
					box = box.substring(0, box.length()-3);
					catenamelist.add(box);
//					System.out.println("중간끝");
//					System.out.println(i+box);
					box="";
					box+=catelist.get(i).getCategory_name_small()+" | ";
				}
				if(i==catelist.size()-1) {//마지막이라면 이제까지것 저장(뒤에세글자제외하고)
					box = box.substring(0, box.length()-3);
					catenamelist.add(box);
//					System.out.println("완전끝");
//					System.out.println(i+box);
				}
//				System.out.println(i+box);
			}
			System.out.println("catenamelist:"+catenamelist);

			List<STimeDto> stimelist= mapService.getStime_ajax(list);
			System.out.println("stimelist:"+stimelist);
//			List<String> stimelist1=new ArrayList<>();
//			List<List<String>> stimelist2=new ArrayList<>();
//			String stimeString="";
//			for (int i = 0; i < stimelist.size(); i++) {
//				stimeString=stimelist.get(i).getStore_time_day()+" "+
//								stimelist.get(i).getStore_time_open()+" ~ "+
//								stimelist.get(i).getStore_time_close();
//				stimelist1.add(stimeString);
////				if(stimelist.get(i).getStore_time_day().equals("공휴일")) {
////				}
//				
////				System.out.println(stimelist.get(i).getStore_time_day()+" "+
////									stimelist.get(i).getStore_time_open()+" ~ "+
////									stimelist.get(i).getStore_time_close()
////									);
//			}
//			System.out.println("stimelist1"+stimelist1);
			
			String[] weekDay = { "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" };     

			  Calendar cal = Calendar.getInstance(); 
//			  int num = cal.get(Calendar.DAY_OF_WEEK)-1;
		      int num = cal.get(Calendar.DAY_OF_WEEK)-1;// 
		      String today = weekDay[num]; 
		      System.out.println(num); 
//		      System.out.println(today); 
//		      System.out.println("오늘의 요일 : " + today ); 
		      
			List<SLocaDto> slocalist=mapService.getSloca_ajax(list);
			System.out.println(slocalist);
			
			map.put("today", num);
			map.put("list", list); 
			map.put("photolist", photolist); 
			map.put("catelist", catenamelist); 
			map.put("stimelist", stimelist); 
			map.put("slocalist", slocalist); 
		}

		System.out.println("4"+map);
		
		return map; 
	}
	
		
	@RequestMapping(value = "map_keyword_store.do", method = RequestMethod.GET)
	public String map_keyword_store(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 : 키워드검색 {}.", locale);
		//1.검색창(지역명, 지하철역명, 매장명 검색 = 얘네도 각각 따로 나눠줄지? 왜냐하면 연관검색어로 나오는 키워드로만 검색이되기때문에 나눠줄 수 있음)
		//안나눠줄경우 검색의 정확도가 떨어질 가능성이 높다.
		//하지만 나눠줄경우 검색어+카테고리로 검색시 번거로워질 수 있다.(걔도 3개씩짜야할 수 있다는 뜻: 하나하면 나머지는 쉽겠지만.)
		//파라미터:keyword=검색어&myloca=내현재위치(없으면 지정위치)
		return "all/map"; 
	}
	
	@RequestMapping(value = "map_keyword_subway.do", method = RequestMethod.GET)
	public String map_keyword_subway(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 : 키워드검색 {}.", locale);
		//1.검색창(지역명, 지하철역명, 매장명 검색 = 얘네도 각각 따로 나눠줄지? 왜냐하면 연관검색어로 나오는 키워드로만 검색이되기때문에 나눠줄 수 있음)
		//안나눠줄경우 검색의 정확도가 떨어질 가능성이 높다.
		//파라미터:keyword=검색어&myloca=내현재위치(없으면 지정위치)
		return "all/map"; 
	}
	
	@RequestMapping(value = "map_keyword_loca.do", method = RequestMethod.GET)
	public String map_keyword_loca(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 : 키워드검색 {}.", locale);
		//1.검색창(지역명, 지하철역명, 매장명 검색 = 얘네도 각각 따로 나눠줄지? 왜냐하면 연관검색어로 나오는 키워드로만 검색이되기때문에 나눠줄 수 있음)
		//안나눠줄경우 검색의 정확도가 떨어질 가능성이 높다.
		//파라미터:keyword=검색어&myloca=내현재위치(없으면 지정위치)
		return "all/map"; 
	}

	@RequestMapping(value = "map_key_n_cate.do", method = RequestMethod.GET)
	public String map_keycate(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 : 카테고리 + 키워드 검색 {}.", locale);
		//3.지도안에서의 검색+카테고리 검색
		//파라미터:keyword=검색어&category=카테고리
		return "all/map"; 
	}
	
}
