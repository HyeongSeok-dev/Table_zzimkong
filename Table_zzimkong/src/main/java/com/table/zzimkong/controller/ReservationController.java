package com.table.zzimkong.controller;

import java.text.NumberFormat;
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
			ReservationVO res, PreOrderVO pre, CompanyVO com, MemberVO member, MenuVO menu) throws JsonProcessingException {
		
	 // 세션에서 "menuList" 속성 가져오기
	    Object obj = session.getAttribute("menuList");

	    // ObjectMapper 인스턴스 생성
	    ObjectMapper mapper = new ObjectMapper();

	    // obj를 JSON 문자열로 변환
	    String jsonStr = mapper.writeValueAsString(obj);

	    // JSON 문자열을 List<MenuVO>로 변환
	    List<MenuVO> menuList = mapper.readValue(jsonStr, new TypeReference<List<MenuVO>>(){});
	    
	    
	    
	    res = (ReservationVO) session.getAttribute("res");
	    NumberFormat numberFormat = NumberFormat.getInstance();
	    String res_table_price = numberFormat.format(res.getRes_table_price());
//	    session.setAttribute("res", null);
//	    session.setAttribute("menuList", null);
	    
	    //메뉴가격 변수만들기~!
	    int count = 0;
	    int menuTotalPriceInt = 0;
	    int totalPayPriceInt = 0;
	    if(menuList != null) {
	    	for(MenuVO menuP : menuList) {
	    		menuTotalPriceInt = Integer.parseInt(menuP.getMenu_price()) * menuP.getOrder_amount();
	    		totalPayPriceInt += menuTotalPriceInt; // 메뉴의 총 가격을 총 결제 금액에 더함
	    		String menuTotalPrice = numberFormat.format(menuTotalPriceInt);
	    		menuP.setMenuTotalPrice(menuTotalPrice);
	    		count++;
	    		menuP.setMenu_price(numberFormat.format(Integer.parseInt(menuP.getMenu_price())));
	    		System.out.println(menuP.getMenu_price());
	    	}
	    	map.put("menu", menuList);
	    }
	   
	    String totalPayPrice = numberFormat.format(res.getRes_table_price() + totalPayPriceInt);
	    String menuTotalPayPrice = numberFormat.format(totalPayPriceInt);
	    System.out.println(totalPayPrice);
	    
	    map.put("menuTotalPayPrice", menuTotalPayPrice);
	    map.put("totalPayPrice", totalPayPrice);
	    map.put("com", com);
        map.put("res", res);
	    
	    
	    System.out.println("업체정보" + com);
	    System.out.println("예약정보" + res);
	    System.out.println("메뉴" + menuList);
	    
	    
	    //[가게 ]
	    int sIdx = (int)session.getAttribute("sIdx");
	    res.setUser_idx(sIdx);
	    System.out.println(sIdx);
	    
		// 임의의 값 넣어 접근권한 확인
		session.setAttribute("sId", "이재환");
		ModelAndView mav; 
		if(session.getAttribute("sId") == null) {
			map.put("msg", "로그인 후 사용가능!");
			map.put("targetURL", "login");
			mav = new ModelAndView("forward", "map", map);
			return mav;
		}
		
		
		//[가게이름 조회]
        com = service.getCompany(res);
        System.out.println(com);
        map.put("com", com);
        System.out.println("업체정보2" + com);
        
        // [예약선택정보 조회]

		
//		List<PreOrderInfo> poiList = service.getPreInfo(res);
//		
//		//[예약자 정보 조회]
		member = service.getUserInfo(res);
		System.out.println(res);
		map.put("member", member);
		
		
//		res = service.getreservation(res);

		
		
		mav = new ModelAndView("reservation/reservation", "map", map);
		return mav;
	}
	
	@RequestMapping("reservationPro")
	public ModelAndView reservationPro(HttpSession session, ReservationVO res, Map<String, Object> map, PreOrderVO pres, CompanyVO com, MenuVO menu) {
		ModelAndView mav;
		String alphanumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        
        
        for (int i = 0; i < 7; i++) {
            int index = random.nextInt(alphanumeric.length());
            char randomChar = alphanumeric.charAt(index);
            sb.append(randomChar);
        }
        
        String res_num = sb.toString();
        System.out.println(res_num);
        res.setRes_num(res_num);
        
        
        int insertCount = service.registResvation(res);
        
     
        map.put("res", res);
        map.put("com", com);
//        List<MenuVO> menuList = new ArrayList<MenuVO>();
//        menuList = (List<MenuVO>) map.get("menus");
//        session.setAttribute("res", res);
//	    session.setAttribute("menuList", menuList);
        mav = new ModelAndView("redirect:/payment?res_num="+res.getRes_num());
		return mav;
	}
}
