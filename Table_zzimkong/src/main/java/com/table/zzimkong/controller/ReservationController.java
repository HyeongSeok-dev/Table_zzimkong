package com.table.zzimkong.controller;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.table.zzimkong.service.ReservationService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PreOrderVO;
import com.table.zzimkong.vo.ReservationVO;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	
	@RequestMapping("reservation")
	public ModelAndView reservation(HttpSession session, Map<String, Object> map,
			ReservationVO res, CompanyVO com, MemberVO member) throws JsonProcessingException {
		ModelAndView mav;
		
		// 세션에서 "menuList" 속성 가져오기
	    Object obj = session.getAttribute("menuList");

	    // ObjectMapper 인스턴스 생성
	    ObjectMapper mapper = new ObjectMapper();

	    // obj를 JSON 문자열로 변환
	    String jsonStr = mapper.writeValueAsString(obj);

	    // JSON 문자열을 List<MenuVO>로 변환
	    List<MenuVO> menuList = mapper.readValue(jsonStr, new TypeReference<List<MenuVO>>(){});
	    System.out.println("메뉴리스트" + menuList);
	    
	    //예약정보 세션으로 받기
	    res = (ReservationVO) session.getAttribute("res");
	    
	    //금액에 천단위 쉼표줌
	    NumberFormat numberFormat = NumberFormat.getInstance();
	    
	    //메뉴가격합계, 총 결제금액 변수만들기
	    int count = 0;
	    int menuTotalPriceInt = 0;
	    int totalPayPriceInt = 0;
	    if(menuList != null) {
	    	//menuList에있는 각메뉴에 반복문 실행
	    	for(MenuVO menuP : menuList) {
	    		menuTotalPriceInt = Integer.parseInt(menuP.getMenu_price()) * menuP.getOrder_amount();
	    		totalPayPriceInt += menuTotalPriceInt; // 메뉴의 총 가격을 총 결제 금액에 더함
	    		String menuTotalPrice = numberFormat.format(menuTotalPriceInt);
	    		menuP.setMenuTotalPrice(menuTotalPrice);
	    		count++;
	    		menuP.setMenu_price(numberFormat.format(Integer.parseInt(menuP.getMenu_price())));
	    		System.out.println(menuP.getMenu_price());
	    	}
	    	//map객체에 menuList저장
	    	map.put("menu", menuList);
	    }
	    //메뉴가격합계, 총 결제금액, 예약금액에 천단위 쉼표줌
	    String totalPayPrice = numberFormat.format(res.getRes_table_price() + totalPayPriceInt);
	    String menuTotalPayPrice = numberFormat.format(totalPayPriceInt);
	    String res_table_price_str = numberFormat.format(res.getRes_table_price());
//	    System.out.println("총결제금액" + totalPayPrice);
//	    System.out.println("메뉴총결제금액" + menuTotalPayPrice);
//	    System.out.println("예약금" + res_table_price_str);
	    map.put("menuTotalPayPrice", menuTotalPayPrice);
	    map.put("totalPayPrice", totalPayPrice);
	    map.put("res_table_price_str", res_table_price_str);
        map.put("res", res);
	    
	    System.out.println("예약정보" + res);
	    System.out.println("메뉴" + menuList); //리스트 들어있음
	    
	    //세션에 저장된 sIdx값 user_idx값에 저장
	    int sIdx = (int)session.getAttribute("sIdx");
	    res.setUser_idx(sIdx);
//	    System.out.println(sIdx);
	    
		//[접근권한 확인]
		if(session.getAttribute("sId") == null) {
			map.put("msg", "로그인 후 사용가능!");
			map.put("targetURL", "login");
			mav = new ModelAndView("forward", "map", map);
			return mav;
		}
		
		//[가게이름 조회]
        com = service.getCompany(res);
        map.put("com", com);
        System.out.println("업체정보2" + com);
        
		//[예약자 정보 조회]
		member = service.getUserInfo(res);
		System.out.println(res);
		
		map.put("member", member);
		map.put("res", res);
		map.put("menu", menuList);
			
		System.out.println("메뉴체크" + menuList);
		
		mav = new ModelAndView("reservation/reservation", "map", map);
		return mav;
	}
	
	@RequestMapping("reservationPro")
	public ModelAndView reservationPro(HttpSession session, ReservationVO res, PreOrderVO pre, CompanyVO com, MenuVO menu) {
		
		String alphanumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    StringBuilder sb = new StringBuilder();
	    Random random = new Random();
	    
	    List<MenuVO> menuList = (List<MenuVO>) session.getAttribute("menuList");
	    
	    System.out.println("cccccccccccc");
	    for (int i = 0; i < 7; i++) {
	        int index = random.nextInt(alphanumeric.length());
	        char randomChar = alphanumeric.charAt(index);
	        sb.append(randomChar);
	    }
	    
	    String res_num = sb.toString();
	    System.out.println(res_num);
	    res.setRes_num(res_num);
	    
	    
	    int insertCount = service.registResvation(res);
	    System.out.println("제발" + res);
	    System.out.println("메뉴!" + menu);
	    
	    res = service.getResIdx(res);
	    System.out.println("플리즈!!!" + res.getRes_idx());
	    
//	    List<MenuVO> menuList = createMenuList();
		System.out.println("메뉴리스트" + menuList);
		if (menuList != null) {
			//pre insert!!!!!!!!!!!!
			int insertPre = service.getPreOrder(res.getRes_idx(), menuList);
			System.out.println("선" + pre);
		
			    Map<String, Object> map = new HashMap<String, Object>();
			    map.put("res", res);
			    System.out.println("제발!!!!!!" + res);
			    
			    map.put("com", com);
		//	        List<MenuVO> menuList = new ArrayList<MenuVO>();
		//	        menuList = (List<MenuVO>) map.get("menus");
		//	        session.setAttribute("res", res);
		//		    session.setAttribute("menuList", menuList);
		}
		    ModelAndView mav = new ModelAndView("redirect:/payment?res_num="+res.getRes_num());
		    return mav;
//		    mav = new ModelAndView("redirect:/payment?res_num="+res.getRes_num());
//	    return mav;
	}
       
}
	
