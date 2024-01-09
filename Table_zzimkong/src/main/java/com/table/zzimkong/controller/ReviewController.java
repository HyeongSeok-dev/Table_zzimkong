package com.table.zzimkong.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.table.zzimkong.service.ReviewService;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReviewCategoryCountVO;
import com.table.zzimkong.vo.ReviewCountVO;
import com.table.zzimkong.vo.ReviewMenuVO;
import com.table.zzimkong.vo.ReviewVO;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	// ===================================================================
	// [ 리뷰 상세 페이지 ]
	@GetMapping("review/redetail")
	public String reviewDetail(@RequestParam("com_id") int comId, 
//								@RequestParam("review_num") int reviewNum, 	
//								@RequestParam("user_id") String userId, 
								@RequestParam(value = "sortType", required = false, defaultValue = "newest") String sortType,
	                            @RequestParam(value = "photoOnly", required = false, defaultValue = "false") boolean photoOnly,
	                            @RequestParam(value = "menuName", required = false) String menuName,
								HttpSession session,
	                            Model model,
	                            HttpServletResponse response,
	                            ReviewVO review) {		

		// 세션 값 저장해두기
		String sId = (String) session.getAttribute("sId");
		
		session.setAttribute("com_id", comId);
//	    session.setAttribute("review_num", reviewNum);
	    session.setAttribute("user_id", sId);
	    		
		// 업체 이름 불러오기
		String comName = service.getCompanyName(comId);
	    model.addAttribute("comId", comId);
		model.addAttribute("comName",comName);
//		System.out.println("작성페이지 comid>>>>>>>" + comId);
//		System.out.println("작성페이지 comname>>>>>>>" + comName);
		
		// 리뷰 갯수
		int reviewCount = service.getReviewCount(comId);
		model.addAttribute("reviewCount",reviewCount);
		
		// 리뷰 별점 평균
		Double reviewAverage = service.getReviewAverage(comId);
		model.addAttribute("reviewAverage",reviewAverage);

		// 리뷰 리스트 불러오기
		List<ReviewVO> reviews = service.getAllReviews(comId);
//		System.out.println("리뷰리스트 불러오기>>>>>>>>>>>>>>>>>" + reviews);

		// 이런 점이 좋았어요 차트 수정
        List<ReviewCountVO> reviewCounts = service.getReviewCountsByComId(comId);
        String reviewCountsJson = new Gson().toJson(reviewCounts);
        model.addAttribute("reviewCountsJson", reviewCountsJson);		
		model.addAttribute("reviews", reviews);

		if (!photoOnly && menuName != null && !menuName.isEmpty()) {
		    // 메뉴 이름으로 리뷰 필터링
		    reviews = service.getReviewsByMenuName(comId, menuName);
		} else {
		    // sortType에 따라 리뷰 정렬
		    switch (sortType) {
		        case "highest":
		            reviews = service.getReviewsSortedByScore(comId, true);
		            break;
		        case "lowest":
		            reviews = service.getReviewsSortedByScore(comId, false);
		            break;
		        case "newest":
		        default:
		            reviews = service.getAllReviews(comId); // 기본적으로 모든 리뷰 가져옴
		            break;
		    }
		}
        // 카테고리별 리뷰 개수 가져오기
        ReviewCategoryCountVO categoryCount = service.categoryCount(comId);
        model.addAttribute("categoryCount",categoryCount);
        
        // 이런 곳 좋아요 출력
        int likeCount = service.getLikeCount(comId);
        model.addAttribute("likeCount", likeCount);
        
        model.addAttribute("reviews", reviews);
        
        // 예약 완료 0번일 시 리뷰 작성 불가 메세지 출력 및 리뷰작성 
        if (sId != null) {
            Integer userIdx = service.findUserIdx(sId);
            int visitCount = service.getReservationCount(userIdx, comId);
            model.addAttribute("visitCount", visitCount);
        } else {
            model.addAttribute("visitCount", 0);
        }
        
        
        
        return "review/review_detail";
	}
	// ===================================================================
    // [ AJAX 요청 처리: 정렬된 리뷰 목록 출력 ]
    @GetMapping("/review/redetail/sortedReviews")
    @ResponseBody
    public List<ReviewVO> getSortedReviews(@RequestParam("comId") int comId, 
                                           @RequestParam("sortType") String sortType,
                                           @RequestParam(value = "photoOnly", defaultValue = "false") boolean photoOnly,
                                           @RequestParam(value = "menuName", required = false) String menuName) {
    	
        List<ReviewVO> reviews = service.getSortedReviews(comId, sortType, photoOnly, menuName);
        
        for (ReviewVO review : reviews) {
            int commentCount = service.getCommentCount(review.getReview_num());
            review.setCommentCount(commentCount);
        }
        
//        System.out.println("메인에 뿌리는 리뷰 >>>>>>>>>>>" + reviews);
        return reviews;
    }
    // false: 필수가 아닌 조건 
	// ===================================================================
    // [ 메뉴이름 가져오기 ] (240109 주석처리)
//    @GetMapping("/review_menus")
//    @ResponseBody
//    public List<String> getMenuNames(@RequestParam("comId") int comId) {
//
//    	return service.getMenuNamesByComId(comId);
//    }
    // ===================================================================
    // [ 키워드 검색 ]
    @ResponseBody
    @GetMapping("/review/redetail/filterByCategory")
    public List<ReviewVO> filterReviewsByCategory(@RequestParam("comId") int comId,@RequestParam("category") String category) {
    	
    	return service.filterReviewsByCategory(comId, category);
    }
    // ===================================================================
	// [ 리뷰 작성 ]
	// "detail" 서블릿 요청에 대한 리뷰 글쓰기 폼 표시
	@GetMapping("review/write")
	public String reviewWriteForm(HttpSession session, Model model, @RequestParam("com_id") int comId, ReviewVO review) {
		// 세션 아이디 없을 경우 "로그인이 필요합니다" 처리를 위해 "forward.jsp" 페이지 포워딩
		// 일단 sId 보류(231222)
		String comName = service.getCompanyName(comId);
		String sId = (String) session.getAttribute("sId");
		
	    // 세션에서 user_id 가져오기
	    String userId = (String) session.getAttribute("sId");
		
		if (sId == null){
			model.addAttribute("msg", "로그인이 필요합니다");
			model.addAttribute("targetURL", "/zzimkong/login");
			return "forward";
		}
		
		// ---------------------------------------------------------------------

	    // ---------------------------------------------------------------------
		
	    // user_id를 사용하여 member 테이블에서 user_idx 찾기
	    Integer userIdx = service.findUserIdx(userId);		
		
		// 작성자 방문횟수 계산
		int visitCount = service.getReservationCount(userIdx, comId);
		
	    model.addAttribute("comId", comId);
	    model.addAttribute("comName", comName);
	    model.addAttribute("visitCount", visitCount);

	    return "review/review_write";
	}

	// "ReviewWritePro" 서블릿 요청에 대한 글쓰기 비즈니스 로직 처리
	@PostMapping("review/reviewWritePro")
	public String reviewWritePro(ReviewVO review, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		
		// 세션에서 user_id 가져오기
		String userId = (String) session.getAttribute("sId");
		if (userId == null) {
			model.addAttribute("msg", "로그인이 필요합니다");
			// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
			model.addAttribute("targetURL", "/zzimkong/login");
			return "forward";
		}
		review.setUser_id(userId);
		System.out.println("reviewVO값: " + review);

		// user_idx 조회
//		int userIdx = service.findUserIdx(userId);
//	    model.addAttribute("userIdx", userIdx);
		
		// 가상의 디렉토리 생성
		String uploadDir = "/resources/upload"; // 가상의 경로
		// 가상 디렉토리에 대한 실제 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		// 날짜별 파일 분류
		String subDir = "";		
		// java.time.LocalXXX 클래스 활용
		LocalDate now = LocalDate.now();
		// LocalXXX 타입 객체의 날짜 포맷 변경(java.time.format.DateTimeFormatter)
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		// 지정한 포맷을 적용하여 날짜 형식 변경한 결과를 변수(subDir)에 저장
		subDir = now.format(dtf);
		// 기존 업로드 경로(실제경로)에 서브디렉토리(날짜 경로) 결합
		saveDir += File.separator + subDir;

		try {
			// 업로드 경로에 해당하는 Path 객체 리턴 받기
			Path path = Paths.get(saveDir);
			// Files.createDirectories() 메서드 호출하여 실제 경로 생성
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}

		// ReviesVO 객체에 전달(저장)된 실제 파일 정보가 관리되는 MultipartFile 타입 객체 꺼내기
		MultipartFile mFile1 = review.getFile1();
		// MultipartFile 객체의 getOriginalFilename() 메서드 호출 시 업로드 된 파일명 리턴
		System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());

		// Board_file1 = DB컬럼명 = review_img_1
		// file1 = file1 (= form태그내의 name속성값과 동일)
		// fileName1 = fileName1
		// --------------------------
		// [ 파일명 중복방지 ]
		review.setReview_img_1("");

		String fileName1 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile1.getOriginalFilename();

		// 파일이 존재할 경우 BoardVO 객체에 서브 디렉토리명(subDir)과 함께 파일명 저장
		if (!mFile1.getOriginalFilename().equals("")) {
			review.setReview_img_1(subDir + "/" + fileName1);
		}

//		System.out.println("실제 업로드 파일명1 : " + review.getReview_img_1());
//		System.out.println("파일 실제 경로>>>>>>>>>>>>>>>> : " + subDir);
//		System.out.println("실제경로!!!!!!!>>>>>>>>>>>>>>" + uploadDir);


		// ----------------------------------------------------------------------
		// ReviewService - registReview() 메서드 호출하여 리뷰글 등록 요청
		// 파라미터 : ReviewVO객체 리턴타입 : int(insertCount)
		System.out.println(review);
		int insertCount = service.registReview(review);

		// 게시물 등록 작업 요청 결과 판별
		if (insertCount > 0) {
			try {
				if (!mFile1.getOriginalFilename().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			//com_id를 전달
	        redirectAttributes.addAttribute("com_id", review.getCom_id());

	        // 리뷰 작성 완료 페이지로 리다이렉트
	        return "redirect:/review/complete";

		} else {
			model.addAttribute("msg", "리뷰글 작성 실패!");
			return "fail_back";
		}

	} // reviewWritePro	
	// ===================================================================
	// [ 리뷰 수정 ] 
		@GetMapping("review/modify")
		public String reviewModify(ReviewVO review,
									@RequestParam("review_num") int reviewNum,
									@RequestParam("com_id") int comId,
									Model model,
									HttpSession session
									) {
			
			// 글 삭제와 권한 판별 동일(세션 아이디 없을 경우 처리)
			String sId = (String) session.getAttribute("sId");
			if (sId == null)  {
				model.addAttribute("msg","로그인이 필요합니다!");
				model.addAttribute("targetURL","/zzimkong/login");
				return "forward";
			}
			// ReviewService - getRivews() 메서드 재사용하여 게시물 1개 정보 조회
			// => 별도의 새로운 ReviewVO타입 변수 선언 없이 기존 ReviewVO 타입 변수(review) 재사용
			// ~> 조회수는 필요없는거 같아서 생략(231227)
			
			// 조회된 게시물의 작성자가 세션아이디와 다를 경우 "잘못된 접근입니다" 처리
			// 관리자는 자신의 게시물이 아니더라도 수정가능(세션아이디가 관리자가 아닐 경우 추가!)
			
			// 리뷰 정보 가져오기
			review = service.getReview(reviewNum);
			if(review == null || !sId.equals(review.getUser_id()) && !sId.equals("admin")){
				model.addAttribute("msg","잘못된 접근입니다!");
				return "fail_back";
			}
			
			// 업체 이름 가져오기
		    String comName = service.getCompanyName(comId);
		    model.addAttribute("comName", comName);
		    model.addAttribute("review", review);
			
			return "review/review_modify";
		}
									
		// 파일 삭제 AJAX 요청에 대한 응답 데이터 생성 및 전송을 위해 @ResponseBody 지정
		@ResponseBody
		@PostMapping("review/ReviewDeleteFile")
		public String deleteFile(ReviewVO review,HttpSession session) {
			
			// ReviewService - removeBoardFile() 메서드 호출하여 지정된 파일명 삭제 요청
			// => 파라미터 : ReviewVO 객체   리턴타입 : int(removeCount)
			int removeCount = service.removeReviewFile(review);
			System.out.println("삭제여부" + removeCount);
			try {
				if(removeCount > 0) { // 레코드의 파일명 삭제(수정) 성공 시
					// 서버에 업로드 된 실제 파일 삭제
					String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
					String saveDir = session.getServletContext().getRealPath(uploadDir);
					
					
					// 파일명이 널스트링이 아닐 경우에만 삭제 작업 수행
					if(!review.getReview_img_1().equals("")) {
						Path path = Paths.get(saveDir + "/" + review.getReview_img_1());
						Files.deleteIfExists(path);
						
						// 예외가 발생하지 않을 경우 정상적으로 파일 삭제가 완료 => true 리턴
						return "true";
					} 
				
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
				return "false";
			// DB 파일명 삭제 실패 또는 서버 업로드 파일 삭제 실패 등의 문제 발생 시 "false" 리턴
			
		}
		
		// "ReviewModifyPro" 서블릿 요청에 대한 글 수정 요청 비즈니스 로직 처리
		@PostMapping("/zzimkong/review/ReviewModifyPro")
		public String modifyPro(
				ReviewVO review,
				@RequestParam("review_num") int reviewNum,// 선생님은 페이지번호 였지만 난 reviewNum으로
				@RequestParam("com_id") int comId,
				HttpSession session, Model model ) {
				// 세션 아이디에 따른 차단 처리
					String sId = (String)session.getAttribute("sId");
					if(sId == null) {
						model.addAttribute("msg", "로그인이 필요합니다");
						// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
						model.addAttribute("targetURL", "/zzimkong/login");
						return "forward";
					} else if(!sId.equals(review.getUser_id()) && !sId.equals("admin")) {
						model.addAttribute("msg", "잘못된 접근입니다");
						return "fail_back";
					}
			// -------------------------------------------------------------------
			// [ 수정 과정에서 파일 업로드 처리 ]
			String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
			String saveDir = session.getServletContext().getRealPath(uploadDir); // 또는 
			
			String subDir = "";
			LocalDate now = LocalDate.now();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			subDir = now.format(dtf);
			
			saveDir += File.separator + subDir;
			
			try {
				Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
				Files.createDirectories(path); // 파라미터로 Path객체 전달
			} catch (IOException e) {
				e.printStackTrace();
			}
			
//			System.out.println(review);
			
			// BoardVO 객체에 전달(저장)된 실제 파일 정보가 관리되는 MultipartFile 타입 객체 꺼내기
			// => 단, 수정하지 않은 파일(새로 업로드 항목으로 추가된 파일이 아닌 기존 파일)은
			//    input 태그를 적용받지 않으므로 파일이 전달되지 않음 => 따라서, null 값이 전달됨
			MultipartFile mFile1 = review.getFile1();
			
			review.setReview_img_1("");
			
			// 파일이 존재할 경우 ReviewVO객체에 서브 디렉토리명(subDir)과 함께 파일명 저장
			String fileName1 = "";
			
			if(mFile1 != null && !mFile1.getOriginalFilename().equals("")) {
				System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
				fileName1 = UUID.randomUUID().toString().substring(0,8) + "_" + mFile1.getOriginalFilename();
				review.setReview_img_1(subDir + "/" + fileName1);
			}
			
			System.out.println("실제 업로드 파일명1 : " + review.getReview_img_1());
			// 현재 업로드 될 파일들은 서버 임시 디렉토리에 보관중이며 최종 이동 처리 수행 필요

			// ----------------------------------------------------------------------------------
			// ReviewwService - modifyReview() 메서드 호출하여 글 수정 작업 요청
			// => 파라미터 : ReviewVO 객체   리턴타입 : int(updateCount)
			int updateCount = service.modifyReview(review);
			
			// DB작업 요청 처리 결과 판별
			if(updateCount > 0) {
				try {
					if(!review.getReview_img_1().equals("")) {
						mFile1.transferTo(new File(saveDir, fileName1));
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
		        return "redirect:/review/redetail?com_id=" + comId;
				
			} else {
				model.addAttribute("msg","리뷰 수정 실패!");
				return "fail_back";
			}
			
		}
	
	// ===================================================================
	// [ 리뷰 삭제 ]
	@PostMapping("/zzimkong/review/delete")
	public String reviewDelete(
			ReviewVO review,
			@RequestParam(defaultValue = "1") int reviewNum,
//			@RequestParam("com_id") int comId,
			HttpSession session,
			Model model,
			HttpServletRequest request) {
		
		// 게시물 삭제 권한 확인
		// 세션 아이디 없을 경우 처리
		// ---------------------------------------------------
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg", "로그인이 필요합니다");
			// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
			model.addAttribute("targetURL", "/zzimkong/login");
			return "forward";
		}
		// ---------------------------------------------------
		// ReviewService - getReview() 메서드 재사용
		ReviewVO dbReview = service.getReivew(review.getReview_num());
	    String referer = request.getHeader("Referer");		
		// ---------------------------------------------------
		if(dbReview == null || !sId.equals(dbReview.getUser_id()) && !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다");
			return "fail_back";
		}
		// ---------------------------------------------------
		// ReviewService - removeReview() 메서드 호출하여 글 삭제 작업 요청
		// => 파라미터 : ReviewVO 객체(글번호 저장 필수)   리턴타입 : int(deleteCount)		
		int deleteCount = service.removeReview(review);
		
		if(deleteCount > 0) {
			
			try {
				String uploadDir = "/resources/upload";
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				
				// -----------------------------------------------------------
				// 파일 삭제에 사용된 중복 코드 제거를 위해 배열 + 반복문 활용
				// 배열 arrFileNames 에 파일명 3개 저장
				String[] arrFileNames = {
					dbReview.getReview_img_1()	
				};
				
				// for문을 활용하여 배열 반복
				for(String fileName : arrFileNames) {
				    if(fileName != null && !fileName.equals("")) {
						Path path = Paths.get(saveDir + "/" + fileName);
						Files.deleteIfExists(path);
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return "redirect:" + referer;
			
		} else {
			// 글 삭제 실패!
			model.addAttribute("msg","글 삭제 실패!");
			return "fail_back";
		}
		
	}
	
	// ===================================================================
	// [ 리뷰 신고 ]
	@GetMapping("review/report")
	public String reviewReportForm(HttpSession session, Model model,
			@RequestParam("com_id") int comId,
			@RequestParam("review_num") int reviewNum) {
		
	    // review_num과 com_id를 모델에 추가
	    model.addAttribute("reviewNum", reviewNum);
	    model.addAttribute("comId", comId);
		
		String userId = (String) session.getAttribute("user_id");
		// 세션 아이디 없을 경우 "로그인이 필요합니다" 처리를 위해 "forward.jsp" 페이지 포워딩
				String sId = (String) session.getAttribute("sId");
				if (sId == null){
					model.addAttribute("msg", "로그인이 필요합니다");
					model.addAttribute("targetURL", "/zzimkong/login");
					return "forward";
				}

				MemberVO member = service.getUserInfo(sId);	
				model.addAttribute("member",member);
				model.addAttribute("userId", userId);

			    // 리뷰정보 가져와서 쓸 수 있음!(신고페이지에서)
//			    ReviewVO review = service.getReview(reviewNum);
//			    model.addAttribute("review", review);
			
				
		return "review/review_report";
	}
		// "ReviewWritePro" 서블릿 요청에 대한 글쓰기 비즈니스 로직 처리
		@PostMapping("review/reviewReportPro")
		public String reviewReportPro(ReviewVO review, HttpSession session, Model model, 
				@RequestParam("user_id") String userId) {
			String sId = (String) session.getAttribute("sId");
			// 세션에서 user_id 가져오기
			if (sId == null) {
				model.addAttribute("msg", "로그인이 필요합니다");
				model.addAttribute("targetURL", "/zzimkong/login");
				return "forward";
			}
			
		    // ReviewVO 객체에 세션에서 가져온 user_id 값을 설정
		    review.setUser_id(sId);
		    // 나머지 필요한 정보 (com_id, report_num)를 세션에서 가져오기
		    Integer comId = (Integer) session.getAttribute("com_id");

			
		// ----------------------------------------------------------------------
		// ReviewService - registReviewReport() 메서드 호출하여 게시물 등록 작업 요청
		// => 파라미터 : ReviewVO 객체   리턴타입 : int(insertCount)
		int insertCount = service.registReviewReport(review);
		
		if(insertCount > 0) {
			model.addAttribute("msg","신고가 정상적으로 처리되었습니다!");
			model.addAttribute("targetURL","/zzimkong/review/redetail?com_id=" + comId);
//			return "redirect:/review/redetail?com_id=" + comId;
			return "forward";
		
			} else {
		        model.addAttribute("msg", "신고 처리에 실패했습니다.");
				model.addAttribute("targetURL","/zzimkong/review/report?review_num=" + review.getReview_num() 
									+ "&com_id=" + review.getCom_id() + "&user_id=" + review.getUser_id());
		        return "forward";
			}
		}
		
		
		// ===================================================================
	@GetMapping("review/complete")
	public String reviewComplete(@RequestParam("com_id") int comId, Model model) {
	    List<ReviewVO> reviews = service.getAllReviews(comId);
	    model.addAttribute("comId", comId);
	    model.addAttribute("reviews", reviews);

		
		
		return "review/review_complete";
	}

	
	// ===================================================================
	// [ 리뷰 댓글 기능 ] 
	@GetMapping("review/comment")
	public String reviewComment(
								 @RequestParam("com_id") int comId, 
								 @RequestParam("review_num") int reviewNum,
								 Model model, HttpSession session
								 ) {
		// review_num과 com_id를 모델에 추가
		model.addAttribute("reviewNum", reviewNum);
		model.addAttribute("com_id", comId);
		
		String userId = (String) session.getAttribute("user_id");
		// 현재 로그인한 사용자의 ID를 세션에서 가져옴
		String sId = (String)session.getAttribute("sId");
		
	    // 세션에 com_id와 user_id를 설정
		session.setAttribute("com_id", comId);
		session.setAttribute("user_id", sId);
		
		// 업체 이름 불러오기
		String comName = service.getCompanyName(comId);
		model.addAttribute("comName",comName);
		
		MemberVO member = service.getUserInfo(sId);
		model.addAttribute("member",member);
		model.addAttribute("userId",userId);
		
		
		// --------------------------------------------------------------------------
		// [ 댓글 기능 추가 ]
		// 현재 게시물에 포함되어 있는 댓글 목록 조회(댓글은 페이징 처리 생략)
		// BoardService - getTinyReplyBoardList() 메서드 호출하여 댓글 목록 조회 요청
		// => 파라미터 : 글번호   리턴타입 : List<Map<String, Object>>(tinyReplyBoardList)
		List<Map<String, Object>> tinyReplyReviewList = service.getTinyReplyReviewList(reviewNum);
//		System.out.println(tinyReplyBoardList);
		
		// Model 객체에 댓글 목록 객체(List) 추가
		model.addAttribute("tinyReplyReviewList", tinyReplyReviewList);
		// --------------------------------------------------------------------------
		
		return "review/review_comment";
	}

	// [ 댓글 기능 ]
	// "BoardTinyReplyWrite" 서블릿 요청에 대한 댓글 작성 비즈니스 로직 처리
	// => 폼 파라미터 데이터를 TinyReplyBoardVO 객체 대신 Map 타입 객체로 처리
	//    (주의! 파라미터 매핑용으로 Map 타입 선언 시 @RequestParam 어노테이션 필수!)
	//    (만약, 어노테이션 생략 시 파라미터 데이터가 저장되어 있지 않은 단순 Map 객체가 주입됨)
	@PostMapping("review/ReviewTinyReplyWrite")
	public String writeTinyReply(@RequestParam Map<String, String> map, HttpSession session, Model model
//								,@RequestParam("com_id") int comId
								) {
//		System.out.println(map);
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		
		// BoardService - registTinyReplyBoard() 메서드 호출하여 댓글 등록 작업 요청
		// => 파라미터 : Map 객체   리턴타입 : int(insertCount)
		int insertCount = service.registTinyReplyReview(map);
		
		
		// 댓글 등록 요청 결과 판별
		// => 성공 시 글 상세정보(BoardDetail) 서블릿 리다이렉트(파라미터 : 글번호, 페이지번호)
		// => 실패 시 "댓글 작성 실패!" 메세지 처리(fail_back)
		if(insertCount > 0) {
//			return "redirect:/review/comment?review_num=" + map.get("review_num");
	        return "redirect:/review/comment?review_num=" + map.get("review_num") + "&com_id=" + map.get("com_id");
		} else {
			model.addAttribute("msg", "댓글 작성 실패!");
			return "fail_back";
		}
		
	}
	
	// "BoardTinyReplyDelete" 서블릿 요청에 대한 댓글 삭제 작업 처리!
	@ResponseBody
	@GetMapping("review/ReviewTinyReplyDelete")
	public String deleteTinyReply(@RequestParam Map<String, String> map, HttpSession session) {
		// 세션 아이디가 없을 경우 "invalidSession" 문자열 리턴
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "invalidSession";
		}
		
		// BoardService - getTinyReplyWriter() 메서드 호출하여 댓글 작성자 조회
		// => 파라미터 : Map 객체   리턴타입 : Map(map)
		map = service.getTinyReplyWriter(map);
//		System.out.println(map);
		
		// 댓글 작성자가 세션 아이디와 동일하거나 세션 아이디가 관리자일 경우에만
		// BoardService - removeTinyReplyBoard() 메서드 호출하여 댓글 삭제 작업 요청
		// (아니면 "invalidSession" 리턴)
		// => 파라미터 : Map 객체   리턴타입 : int(deleteCount)
		if(sId.equals(map.get("user_id")) || sId.equals("admin")) {
			int deleteCount = service.removeTinyReplyReview(map);
			
			// 삭제 요청 결과 판별
			// => 성공 시 "true", 실패 시 "false" 리턴
			if(deleteCount > 0) {
				return "true";
			} else {
				return "false";
			}
		} else {
			return "invalidSession";
		}
		
	}	
	
	// "BoardTinyReReplyWrite" 서블릿 요청에 대한 대댓글 작성 비즈니스 로직 처리
	// => AJAX 요청에 대한 응답 처리를 위해 @ResponseBody 적용
	@ResponseBody
	@PostMapping("review/ReviewTinyReReplyWrite")
	public String writeTinyReReply(@RequestParam Map<String, String> map, HttpSession session) {
		if(session.getAttribute("sId") == null) {
			return "invalidSession";
		}
		
		// BoardService - registTinyReReplyBoard() 메서드 호출하여 대댓글 등록 요청
		// => 파라미터 : Map 객체   리턴타입 : int(insertCount)
		int insertCount = service.registTinyReReplyReview(map);
		
		// 등록 요청 처리 결과 판별
		// => 성공 시 "true", 실패 시 "false" 리턴
		if(insertCount > 0) {
			return "true";
		} else {
			return "false"; 
		}
		
	}

}