package com.table.zzimkong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.table.zzimkong.service.PaymentService;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuList;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.PaymentInfo;
import com.table.zzimkong.vo.PaymentVO;
import com.table.zzimkong.vo.PointVO;
import com.table.zzimkong.vo.PreOrderInfo;
import com.table.zzimkong.vo.PreOrderVO;
import com.table.zzimkong.vo.ReservationVO;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
		
	@GetMapping("payment")
	public ModelAndView payment(HttpSession session, Map<String, Object> map,
								 ReservationVO res, CompanyVO company) {
		ModelAndView mav; 
		//세션에 저장된 아이디로 회원정보확인 하기 위해 일단 세션에 임의의 값 넣음
		session.setAttribute("sId", "user2");
		
		// 세션에 로그인이 안되어있다면 접근금지
		if(session.getAttribute("sId") == null) {
			
			map.put("msg", "접근권한이 없습니다!");
			map.put("targetURL", "login");
			
			mav = new ModelAndView("forword", "map", map);
			return mav;
		}
		res.setRes_num("R0002");
		
		
		//[ 예약정보조회 ]
		res = service.getReservation(res);
		//테이블 예약금액에 천단위 쉼표줌
		NumberFormat numberFormat = NumberFormat.getInstance();
		String res_table_price = numberFormat.format(res.getRes_table_price());
		// [예약정보중 사업장정보 조회]
		company = service.getCompany(res);
		
		// [예약정보중 선주문정보 조회]
		// 1. List<Object> 객체로 받아보기 안됨
		//List<PaymentInfo> preList = service.getPreOrder(res);
		
		
		//2. PreOrderVO 객체로받아서 for문으로 불러왔는데 실패함
//		List<PreOrderVO> preList = service.getPreOrder(res);
//		List<MenuVO> menuList = service.getMenu(pre);
		
		// 3. PreOrderInfo객체를 생성해서 join문으로 메뉴테이블 정보까지 받아옴
		List<PreOrderInfo> poiList = service.getPreOrderInfo(res);
		System.out.println(poiList);
		// 각 메뉴의 가격과 갯수를 곱한 결과를 저장함
		int count = 0;
		int eachMenuTotalPriceInt = 0;
		int menuTotalPriceInt = 0;
		for(PreOrderInfo preOrderInfo : poiList) {
			System.out.println("preOrderInfo : " + preOrderInfo);
			// [선주문정보와 메뉴정보를 이용해서 결제할 가격 구하기 ] 
			// [선주문 정보중 메뉴정보 조회]
			// 1. 개수를 곱한 메뉴가격 
			System.out.println(" Integer.parseInt(preOrderInfo.getMenu_price()) : " + Integer.parseInt(preOrderInfo.getMenu_price()));
			System.out.println("preOrderInfo.getPre_num() : " + preOrderInfo.getPre_num());
			eachMenuTotalPriceInt = (Integer.parseInt(preOrderInfo.getMenu_price()) * preOrderInfo.getPre_num());
			menuTotalPriceInt += eachMenuTotalPriceInt;
			String eachMenuTotalPrice = numberFormat.format(eachMenuTotalPriceInt);
			preOrderInfo.setEachMenuTotalPrice(eachMenuTotalPrice);
			count++;
			System.out.println("eachMenuTotalPriceInt : " + eachMenuTotalPriceInt);
			System.out.println("count : " + count);
		}
		
		// 2. 선주문한 총 가격
		System.out.println("menuTotalPriceInt : " + menuTotalPriceInt);
		// 3. paymentInfo 객체로 넣기전에 정수인 수에 천단위로 쉼표를 넣어서 문자열타입으로 만듬
		String totalPrice = numberFormat.format(res.getRes_table_price() + menuTotalPriceInt);
		String menuTotalPrice = numberFormat.format(menuTotalPriceInt);
		System.out.println(poiList);
		//--------------------------------------------------------------------
		//[ 사용가능 포인트 조회 ]
		// 예약정보에서 회원을 확인하기 위한 정보
		// 포인트조회
		int dbPoint = service.getPoint(res);
		String totalPoint = numberFormat.format(dbPoint);
		
		//--------------------------------------------------------------------
		// [ PaymentInfo 객체에 문자열 타입으로 파라미터 전달]
		PaymentInfo paymentInfo = new PaymentInfo(menuTotalPrice,totalPrice,totalPoint,res_table_price);
		// 예약조회, 포인트조회,사업장정보조회,선주문조회 
		map.put("res", res);
		map.put("paymentInfo", paymentInfo);
		map.put("com", company);
		map.put("poi", poiList);

		mav = new ModelAndView("payment/payment", "map", map);
		System.out.println(mav);
		return mav;
	}
	//----------------------------------------------------------------------------------------------------
	@ResponseBody
	@PostMapping("paymentPro")
	public ModelAndView paymentPro(HttpSession session, PaymentVO payment, ReservationVO res, Map<String, Object> map, 
									@RequestParam("discountCoupon") String discountCoupon,
									@RequestParam("discountPoint") String discountPoint,
									@RequestParam("earnedPoints") String earnedPoints,
									@RequestParam("nowPoint") String nowPoint,
									@RequestParam("totalPoint") String totalPoint,
									@RequestParam("totalPayment") String totalPayment,
									@RequestParam("cardSelect") String cardSelect,
									@RequestParam("pay_po_price_String") String pay_po_price_String
									) {
		
		ModelAndView mav; 
		System.out.println("paymentVO : " + payment);
		System.out.println("discountCoupon : " + discountCoupon);
		System.out.println("discountPoint : " + discountPoint);
		System.out.println("earnedPoints : " + earnedPoints);
		System.out.println("nowPoint : " + nowPoint);
		//세션에 저장된 아이디로 회원정보확인 하기 위해 일단 세션에 임의의 값 넣음
		session.setAttribute("sId", "user2");
		session.setAttribute("sIdx", "2");
		
		// 세션에 로그인이 안되어있다면 접근금지
		if(session.getAttribute("sId") == null) {
			
			map.put("msg", "접근권한이 없습니다!");
			map.put("targetURL", "login");
			
			mav = new ModelAndView("forword", "map", map);
			return mav;
		}
		
		res.setRes_num("R0002");
		
		// 0.결제번호 무작위생성
		// 날짜 정보 가지고옴
		LocalDate date = LocalDate.now();
		// 년월일 따로 가지고옴
		int year = date.getYear();
		int month = date.getMonthValue();
		int day = date.getDayOfMonth();
//		System.out.println("year : " + year);
//		System.out.println("month : " + month);
//		System.out.println("day : " + day);
		// 무작위 번호앞에 년월일 붙여서 결제번호생성
		String payNum = year +( month + (day + UUID.randomUUID().toString().substring(0,7)))  ;
		System.out.println("payNum : " + payNum);
		
		
		// 1. 최종 결제정보 insert 
		// payment의 외래키가 user_idx여서 세션에서 불러옴
		int sIdx = Integer.parseInt((String)session.getAttribute("sIdx"));
		// 천단위 쉼표제거 후 형변환뒤 payment객체에 넣어줌
		System.out.println("pay_po_price_String 변환전 : " + pay_po_price_String);
		int pay_po_price; //현장에서 결제
		// controller에서만 판별하기 위한 pay_on_sit =1 : 선주문없음 pay_on_sit = 2 : 선주문있음 
		if(pay_po_price_String.equals("선주문 없음")) {
			pay_po_price = 0;
			payment.setPay_on_sit(1); // 선주문 없음
		} else if(pay_po_price_String.equals("0")) {
			pay_po_price = 0;
			payment.setPay_on_sit(2); // 선주문있는데 현장에서 결제함
		} else {
			pay_po_price = Integer.parseInt(pay_po_price_String.replace(",", "").trim());
			payment.setPay_on_sit(3); // 선주문있는데 선결제함
		}
		payment.setPay_po_price(pay_po_price); 
		System.out.println(pay_po_price);
		System.out.println(payment);
		
		int insertPayment = service.paymentSuccess(res,sIdx,payNum,payment); //res의 res_table_price와pay_per_price같음
		if(insertPayment > 0) {
			// 1-1. 3번 성공시 예약테이블에서 결제완료상태로 표시 변경 update (res_pay_status = 1)
			int updateReservationStatus = service.payStatusChange(res);
			if(updateReservationStatus == 0) {
				map.put("msg", "예약정보에 결제완료 상태표시를 실패했습니다!");
				
				mav = new ModelAndView("fail_back", "map", map);
				return mav;
			}
			
			// 2. 사용한 포인트 insert (point_category = 4)
			int insertSubUsedPoint = service.subUsedPoint(res, discountPoint);
			if(insertSubUsedPoint == 0) {
				map.put("msg", "포인트 사용정보 변경을 실패했습니다!");
				
				mav = new ModelAndView("fail_back", "map", map);
				return mav; 
			}
			
			// 3. 결제로 인한 적립 포인트 insert  (point_category = 1)
			int insertAddPoint = service.addPoint(res, earnedPoints);
			if(insertSubUsedPoint == 0) {
				map.put("msg", "포인트 적립에 실패했습니다!");
				
				mav = new ModelAndView("fail_back", "map", map);
				return mav;
			}
			
			mav = new ModelAndView("redirect:/payment/Info?", "map", map);
			System.out.println(mav);
			return mav;
			
		} else {
			map.put("msg", "결제에 실패했습니다!");
			
			mav = new ModelAndView("fail_back", "map", map);
			return mav;
		}
	}
	//---------------------------------------------------------------------------------------------------------------
	@GetMapping("payment/info")
	public ModelAndView payment_info(HttpSession session, Map<String, Object> map) {
		
		ModelAndView mav; 
		//세션에 저장된 아이디로 회원정보확인 하기 위해 일단 세션에 임의의 값 넣음
		session.setAttribute("sId", "user2");
		
		// 세션에 로그인이 안되어있다면 접근금지
		if(session.getAttribute("sId") == null) {
			
			map.put("msg", "접근권한이 없습니다!");
			map.put("targetURL", "login");
			
			mav = new ModelAndView("forword", "map", map);
			return mav;
		}
		
		
		
		
		mav = new ModelAndView("payment/payment_info", "map", map);
		return mav;
	}
}
