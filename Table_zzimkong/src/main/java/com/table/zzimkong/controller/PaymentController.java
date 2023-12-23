package com.table.zzimkong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.table.zzimkong.service.PaymentService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PointVO;
import com.table.zzimkong.vo.PreOrderVO;
import com.table.zzimkong.vo.ResTablePrice;
import com.table.zzimkong.vo.ReservationVO;
import com.table.zzimkong.vo.TotalPoint;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
		
	@GetMapping("payment")
	public ModelAndView payment(HttpSession session, Model model
								,Map<String, Object> map, ReservationVO res, PreOrderVO pre, MenuVO menu,CompanyVO company, PointVO point) {
		ModelAndView mav; 
		//세션에 저장된 아이디로 회원정보확인 하기 위해 일단 세션에 임의의 값 넣음
		session.setAttribute("sId", "user2");
		
		// 세션에 로그인이 안되어있다면 접근금지
		if(session.getAttribute("sId") == null) {
			
			map.put("msg", "접근권한이 없습니다!");
			map.put("targetURL", "login");
			
			mav = new ModelAndView("payment/payment", "map", map);
			return mav;
		}
		res.setUser_idx(2);
		res.setRes_num("R0002");
		
		
		//[ 예약정보조회 ]
		res = service.getReservation(res);
		//정보중 테이블 예약금액에 천단위 쉼표줌
		NumberFormat numberFormat = NumberFormat.getInstance();
		ResTablePrice res_table_price = new ResTablePrice(numberFormat.format(res.getRes_table_price()));
		
		// [예약정보중 사업장정보 조회]
		company = service.getCompany(res);
		
//		// [예약정보중 선주문정보 조회]
//		pre = service.getPreOrder(res);
//		
//		// [선주문 정보중 메뉴정보 조회]
//		menu = service.getMenu(pre);
		
		//--------------------------------------------------------------------
		//[ 사용가능 포인트 조회 ]
		// 예약정보에서 회원을 확인하기 위한 정보
		// 포인트조회
		TotalPoint totalPoint = service.getPoint(res);
		
		//--------------------------------------------------------------------
		
		// 예약조회, 포인트조회,사업장정보조회,선주문조회 
		map.put("res", res);
		map.put("tablePrice", res_table_price);
		map.put("point", totalPoint);
		map.put("com", company);

		mav = new ModelAndView("payment/payment", "map", map);
		return mav;
	}
	
	@PostMapping("paymentPro")
	public String paymentPro(HttpSession session, Model model) {
		
		session.setAttribute("sId", "user2");
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			return "forward";
		}
		
		return"";
	}

	@GetMapping("payment/info")
	public String payment_info(HttpSession session, Model model) {
		
		session.setAttribute("sId", "user2");
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "접근권한이 없습니다!");
			model.addAttribute("targetURL", "login");
			return "forward";
		}
		
		
		return "payment/payment_info";
	}
}
