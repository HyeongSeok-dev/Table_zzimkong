package com.table.zzimkong.controller;

import java.io.*;
import java.nio.file.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.table.zzimkong.service.*;
import com.table.zzimkong.vo.*;

@Controller
public class MypageController {
	// MypageService 객체 자동 주입
	@Autowired
	private MypageService service;
	
	// [ 회원정보 조회 ]
	@GetMapping("my/modify/profile")
	public String my_modify_profile(MypageInfo mypage, HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		
		// 현재 세션이 관리자가 아니거나 관리자이면서 id 파라미터가 없을 경우(null 또는 널스트링)
		// MypageInfo 객체의 id 값을 세션 아이디로 교체(덮어쓰기)
		if(!sId.equals("admin") || (sId.equals("admin") && (mypage.getUser_id() == null || mypage.getUser_id().equals("")))) {
			mypage.setUser_id(sId);
		}
		
		// MypageService - getMypage() 메서드 호출하여 회원 상세정보 조회 요청
		// => 파라미터 : MypageInfo 객체 리턴타입 : MypageInfo(dbMypage)
		MypageInfo dbMypage = service.getMypage(mypage);
	
		// 조회 결과 Model 객체에 저장
		model.addAttribute("mypage", dbMypage);
		System.out.println("dbMypage : " + dbMypage);
		
		
		// 회원정보 조회 페이지 포워딩
		return "mypage/my_modify_profile";
		
	}
	
	// 닉네임 중복확인에 대한 비지니스 로직 처리---------------------
	@ResponseBody
	@GetMapping("my/modify/MypageCheckDupNick")
	public String checkDupNick(MypageInfo mypage) {
		System.out.println("mypage1 : " + mypage);
		MypageInfo dbMypage = service.getUserNick(mypage);
		
		if(dbMypage == null) {
			return "false";
		}else {
			return "true";
		}
	} //MypageCheckDupNick()
	
	
	//	[ 회원정보 수정 ]
	// "MyModifyPro" 서블릿 요청에 대한 회원 정보 수정 비즈니스 로직 처리
	// => 추가로 전달되는 새 패스워드(newPasswd) 값을 전달받을 파라미터 변수 1개 추가(Map 사용 가능)
	@PostMapping("my/modify/MyModifyPro")
	public String modifyPro(MypageInfo mypage, String user_passwd1, HttpSession session, Model model) {
		// 세션 아이디가 없을 경우 "fail_back" 페이지를 통해 "잘못된 접근입니다" 출력 처리
		String sId = (String) session.getAttribute("sId");
		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
		
		System.out.println("전달받은 Mypage : " + mypage);
		
		// 만약, 현재 세션이 관리자가 아니거나
		// 관리자이면서 id 파라미터가 없을 경우(null 또는 널스트링)
		// MypageInfo 객체의 id 값을 세션 아이디로 교체(덮어쓰기)
		if(!sId.equals("admin") || (sId.equals("admin") && (mypage.getUser_id() == null || mypage.getUser_id().equals("")))) {
			mypage.setUser_id(sId);
		} 
		
		// 프로필 사진 변경하기
		String uploadDir = "/resources/upload";
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		String subDir = "";
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		saveDir += File.separator + subDir;
		
		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MultipartFile mFile = mypage.getM_file();
		System.out.println("원본파일명 : " + mFile.getOriginalFilename());
		
		mypage.setUser_img("");
		
		String imgName = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile.getOriginalFilename();
		System.out.println(imgName);
		if(!mFile.getOriginalFilename().equals("")) {
			mypage.setUser_img(subDir + "/" + imgName);
		}
		
		System.out.println("실제 업로드 파일명 : " + mypage.getUser_img());
		// 파일이 있으면(mypage.getUser_img()이 널스트링이 아니면("")) 세션에 이미지 넣기 
		if(!mypage.getUser_img().equals("")) {
			session.setAttribute("imgName", mypage.getUser_img()); // 세션에 이미지 넣기
		}
		System.out.println(session.getAttribute("imgName"));
		// MypageService - getMypage() 메서드 호출하여 회원 정보 조회 요청(패스워드 비교용)
		// => 파라미터 : MypageInfo 객체 리턴타입 : MypageInfo(dbMypage)
		MypageInfo dbMypage = service.getMypage(mypage);
		
		// BCryptPasswordEncoder 클래스를 활용하여 입력받은 기존 패스워드와 DB 패스워드 비교
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		// 비밀번호 검증을 위한 변수 선언. 초기값은 true
		boolean passwordValidation = true;

		// 관리자가 아닌 경우, 또는 관리자이지만 수정하려는 회원의 아이디가 없는 경우
		if(!sId.equals("admin") || (sId.equals("admin") && (mypage.getUser_id() == null || mypage.getUser_id().equals("")))) {
		    // 비밀번호가 입력된 경우
		    if (mypage.getUser_passwd() != null && !mypage.getUser_passwd().equals("")) { 
		        // 입력된 비밀번호와 DB에 저장된 비밀번호를 비교
		        if (!passwordEncoder.matches(mypage.getUser_passwd(), dbMypage.getUser_passwd())) {
		            model.addAttribute("msg", "현재 비밀번호가 틀렸습니다.");
		            passwordValidation = false; // 비밀번호가 틀린 경우 passwordValidation을 false로 변경
		        }
		    }
		}

		// passwordValidation이 true인 경우에만 회원 정보 수정 로직 실행
		if (passwordValidation) {
			// 새 패스워드를 입력받았을 경우 BCryptPasswordEncoder 클래스를 활용하여 암호화 처리
			if (user_passwd1 != null && !user_passwd1.equals("")) {
				// 새로운 비밀번호와 현재 비밀번호가 동일한지 체크
				if (passwordEncoder.matches(user_passwd1, dbMypage.getUser_passwd())) {
					model.addAttribute("msg", "새 비밀번호가 현재 비밀번호와 동일합니다.");
					return "fail_back";
				}
				user_passwd1 = passwordEncoder.encode(user_passwd1);
				mypage.setUser_passwd(user_passwd1);
			}

		    try {
		        // MypageService - modifyMypage() 메서드 호출하여 회원 정보 수정 요청
		        // => 파라미터 : MypageInfo 객체, 새 패스워드(newPasswd) 리턴타입 : int(updateCount)
		        int updateCount = service.modifyMypage(mypage, user_passwd1);

		        // 회원 정보 수정 요청 결과 판별
		        // => 실패 시 "fail_back" 페이지 포워딩 처리("회원정보 수정 실패!")
		        // => 성공 시 "MypageInfo" 서블릿 리다이렉트
		        if(updateCount > 0) { // 성공 시
		            session.setAttribute("msg", "회원정보 수정이 완료되었습니다.");
		            if(!mFile.getOriginalFilename().equals("")) {
		                mFile.transferTo(new File(saveDir, imgName));
		            }
		            // 관리자가 다른 회원 정보 수정 시 MypageInfo 서블릿 주소에 아이디 파라미터 결합
		            if(!sId.equals("admin") || (sId.equals("admin") && (mypage.getUser_id() == null || mypage.getUser_id().equals("")))) {
		                return "redirect:/my/modify/profile";
		            } else {
		                return "redirect:/my/modify/profile?id=" + mypage.getUser_id();
		            }
		        } else { // 실패 시
		            model.addAttribute("msg", "회원정보 수정 실패!");
		            return "fail_back";
		        }
		    } catch (Exception e) {
		        model.addAttribute("msg", "회원정보 수정 실패!");
		        return "fail_back";
		    }
		} else { // 비밀번호 검증이 실패한 경우
		    return "fail_back";
		}

	}
	
	//---------- 나의 내역 조회 ----------------
	@GetMapping("my/list")
	public String my_list(MypageInfo mypage, HttpSession session, Model model, HttpServletResponse response) {
		
		String sId = (String)session.getAttribute("sId"); // 세션에 아이디값을 가져오는거
		mypage.setUser_id(sId);//검색할 아이디를 마이페이지에 넣기 
		MypageInfo dbMypage = service.getMypage(mypage);
		session.setAttribute("user_nick", dbMypage.getUser_nick()); // String~session: 마이페이지 눌렀을때 닉네임 계속 보이게 세션에 저장
		session.setAttribute("imgName", dbMypage.getUser_img());
		
		int sIdx = (int)session.getAttribute("sIdx"); //세션 인덱스 가져오기
		//---- 예약조회(간략히 보기) --------------------
		List<Map<String, Object>> resList = service.getResList(sIdx);
		System.out.println("resList : " + resList);
		// Model 객체에 회원 목록 조회 결과 저장(resList 문자열을 "resList"라는 속성명으로 저장)
		model.addAttribute("resList", resList);
		
		//---- 북마크(간략히 보기) --------------------
		List<BookmarkVO> bookmarkList = service.getBookmarkList(sIdx);
		System.out.println("북마크 : " + sIdx); 
		model.addAttribute("bookmarkList", bookmarkList);
		
		return "mypage/my_list";
	}
	
	// => AJAX 요청에 대한 응답 처리를 위해 @ResponseBody 적용
	@ResponseBody
	@PostMapping("my/listPro")
	public String my_listPro(BookmarkVO bookmark, HttpSession session, Model model) {
		
		// 하트 클릭시 북마크 삭제
	    int deleteCount = service.bookmarkDel(bookmark);
	    
	    if(deleteCount > 0) { // 성공시
	        return "{\"result\": \"success\"}";
	    } else { // 실패시
	        return "{\"result\": \"fail\"}";
	    }
	}
	
	//----------------나의 예약 더보기 페이지--------------------
	@GetMapping("my/reservation")
	public String my_reservation(MypageInfo mypage, HttpSession session, Model model, HttpServletResponse response)	{
		
		int sIdx = (int)session.getAttribute("sIdx"); //세션 인덱스 가져오기
//		
		List<Map<String, Object>> resList2 = service.getResList2(sIdx);
				
		// Model 객체에 회원 목록 조회 결과 저장(resList2 문자열을 "resList2"라는 속성명으로 저장)
		model.addAttribute("resList2", resList2);

		return "mypage/my_reservation";
	}
	
	@PostMapping("my/resPro")
	public String my_resPro(MypageInfo mypage, HttpSession session, Model model, HttpServletResponse response) {
		
		// 예약 취소 버튼
		int updateCount = service.myResCancel(mypage);
		
		if(updateCount > 0) { // 성공시
			
			return "redirect:/my/reservation";
			
		} else { // 실패시
		
			return "fail_back";
		}
	}	
	
	//----------------나의 북마크 더보기 페이지------------------
	@GetMapping("my/bookmark")
	public String my_bookmark(BookmarkVO bookmark, HttpSession session, Model model) {
		int sIdx = (int)session.getAttribute("sIdx"); //세션 인덱스 가져오기 (회원번호)
		List<BookmarkVO> bookmarkList2 = service.getBookmarkList2(sIdx);
		System.out.println("북마크 : " + sIdx); 
		model.addAttribute("bookmarkList2", bookmarkList2);
		
		return "mypage/my_bookmark";
	}
	
	// => AJAX 요청에 대한 응답 처리를 위해 @ResponseBody 적용
	@ResponseBody
	@PostMapping("my/bookmark/del")
	public String my_bookmark_del(BookmarkVO bookmark, HttpSession session, Model model) {
		
		// 하트 클릭시 북마크 삭제
	    int deleteCount = service.bookmarkDel2(bookmark);
	    System.out.println("북마크2 : " + bookmark);
	    
	    if(deleteCount > 0) { // 성공시
	        return "{\"result\": \"success\"}";
	    } else { // 실패시
	        return "{\"result\": \"fail\"}";
	    }
	}
	// --------------나의 리뷰----------------------------------------------------
	@GetMapping("my/review")
	public String my_review(ReviewVO review, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId"); //세션 아이디 가져오기
		List<ReviewVO> myReview = service.getMyReview(sId);
		System.out.println("myReview : " + myReview);
		
		model.addAttribute("myReviewList", myReview);
		
		return "mypage/my_review";
	}
	
	//--------------가게 신고 - 방문한 가게 조회하기-----------------------------------
	@GetMapping("my/report/shop")
	public String my_report_shop(MypageInfo mypage, HttpSession session, Model model) {
		int sIdx = (int)session.getAttribute("sIdx"); //세션 인덱스 가져오기 (회원번호)
		List<MypageInfo> visitedShop = service.getVisitedShop(sIdx);
//		System.out.println(sIdx);
		
		// Model 객체에 회원 목록 조회 결과 저장(visitedShop 문자열을 "visitedShopList"라는 속성명으로 저장)
		model.addAttribute("visitedShopList", visitedShop);
		
		return "mypage/my_report_shop";
	}
	
	//------------가게 신고하기-------------------
	@GetMapping("my/report/reason")
	public String my_report_reason(HttpSession session, Model model) {
		
		if(session.getAttribute("sIdx") == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("targetURL", "../../login");
			return "forward";
		}
		
		model.addAttribute(model);
		
//		MypageInfo 
		
		return "mypage/my_report_reason";
	}
	
	// "report/reason2" 서블릿 요청에 대한 글쓰기 비즈니스 로직 처리
	@PostMapping("my/report/reason2")
	public String my_report_reason2(ReportVO report, HttpSession session, Model model) {
		
		int insertCount = service.registShopReport(report);
		System.out.println(report);
		return "mypage/my_report_reason";
	}

	
	@GetMapping("my/unregister")
	public String my_unregister() {
		return "mypage/my_unregister";
	}
	
	@GetMapping("my/check/passwd")
	public String my_check_passwd() {
		return "mypage/my_check_passwd";
	}
	
	@GetMapping("my/qna")
	public String my_qna() {
		return "mypage/my_qna";
	}
	
	@GetMapping("my/point")
	public String my_point() {
		return "mypage/my_point";
	}
	
	
	@GetMapping("my/edit/reservation")
	public String my_edit_reservation() {
		return "mypage/my_edit_reservation";
	}
	
	
	

}
