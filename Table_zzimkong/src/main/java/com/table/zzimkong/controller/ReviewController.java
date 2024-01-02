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
import com.table.zzimkong.vo.MenuVO;
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
	public String review_detail(@RequestParam("com_id") int comId, 
								@RequestParam(value = "sortType", required = false, defaultValue = "newest") String sortType,
	                            @RequestParam(value = "photoOnly", required = false, defaultValue = "false") boolean photoOnly,
	                            @RequestParam(value = "menuName", required = false) String menuName,
								Model model) {		
		// 업체 이름 불러오기
		String comName = service.getCompanyName(comId);
		model.addAttribute("comName",comName);
		
		// 리뷰 갯수
		int reviewCount = service.getReviewCount(comId);
		model.addAttribute("reviewCount",reviewCount);
		
		// 리뷰 별점 평균
		Double reviewAverage = service.getReviewAverage(comId);
		model.addAttribute("reviewAverage",reviewAverage);

		// 리뷰 리스트 불러오기
		List<ReviewVO> reviews = service.getAllReviews(comId);
		model.addAttribute("reviews",reviews);

		// 이런 점이 좋았어요 차트 수정
        List<ReviewCountVO> reviewCounts = service.getReviewCountsByComId(comId);
        String reviewCountsJson = new Gson().toJson(reviewCounts);
        model.addAttribute("reviewCountsJson", reviewCountsJson);		
		model.addAttribute("reviews", reviews);
        
        // 리뷰 정렬 처리
        
        // photoOnly 파라미터에 따라 사진이 있는 리뷰만 필터링
//        List<ReviewVO> reviews; // => 위에서 선언됨
        if(photoOnly) {
        	// 사진이 있는 리뷰만 가져옴
        	reviews = service.getSortedReviews(comId, sortType, photoOnly, menuName);
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

        model.addAttribute("reviews", reviews);
	        
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
        return service.getSortedReviews(comId, sortType, photoOnly,menuName);
    }

	// ===================================================================
    // [ 메뉴이름 가져오기 ]
    @GetMapping("/review_menus")
    @ResponseBody
    public List<String> getMenuNames(@RequestParam("comId") int comId) {

    	return service.getMenuNamesByComId(comId);
    }

    
    // ===================================================================
	// [ 리뷰 작성 ]
	// "detail" 서블릿 요청에 대한 리뷰 글쓰기 폼 표시
	@GetMapping("review/write")
	public String reviewWriteForm(HttpSession session, Model model) {
		// 세션 아이디 없을 경우 "로그인이 필요합니다" 처리를 위해 "forward.jsp" 페이지 포워딩
		// 일단 sId 보류(231222)
		String sId = (String) session.getAttribute("sId");
		if (sId == null){
			model.addAttribute("msg", "로그인이 필요합니다");
			model.addAttribute("targetURL", "/zzimkong/login");
			return "forward";
		}

		return "review/review_write";
	}

	// "ReviewWritePro" 서블릿 요청에 대한 글쓰기 비즈니스 로직 처리
	@PostMapping("review/reviewWritePro")
	public String reviewWritePro(ReviewVO review, HttpSession session, Model model) {
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
			
//		System.out.println(review.getA().toString());
		// 보류 (231222)
		// -------------------------------------------------------------------------------------
		// 작성자 IP 주소 가져오기
//		board.setWriter_ip(request.getRemoteAddr());
//		System.out.println(board.getWriter_ip()); // 0:0:0:0:0:0:0:1
		// -------------------------------------------------------------------------------------
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

		System.out.println("실제 업로드 파일명1 : " + review.getReview_img_1());
		System.out.println("파일 실제 경로>>>>>>>>>>>>>>>> : " + subDir);
		System.out.println("실제경로!!!!!!!>>>>>>>>>>>>>>" + uploadDir);


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

			// 리뷰리스트 서블릿 리다이렉트
			return "redirect:/complete";

		} else {
			model.addAttribute("msg", "리뷰글 작성 실패!");
			return "fail_back";
		}

	} // reviewWritePro	
	// ===================================================================
	// [ 리뷰 작성완료 후 상세페이지 이동 ]

	
	// ===================================================================
	// [ 리뷰 수정 ] 
	@GetMapping("review/modify")
	public String review_modify(ReviewVO review,
								@RequestParam("review_num") int reviewNum, 
								Model model,
								HttpSession session
								) {
		// 글 삭제와 권한 판별 동일(세션 아이디 없을 경우 처리)
		String sId = (String) session.getAttribute("sId");
		if (sId == null)  {
			model.addAttribute("msg","로그인이 필요합니다!");
			model.addAttribute("targetURL","login");
			return "forward";
		}
		
		// ReviewService - getRivews() 메서드 재사용하여 게시물 1개 정보 조회
		// => 별도의 새로운 ReviewVO타입 변수 선언 없이 기존 ReviewVO 타입 변수(review) 재사용
		// ~> 조회수는 필요없는거 같아서 생략(231227)
		
		// 조회된 게시물의 작성자가 세션아이디와 다를 경우 "잘못된 접근입니다" 처리
		// 관리자는 자신의 게시물이 아니더라도 수정가능(세션아이디가 관리자가 아닐 경우 추가!)
		review = service.getReview(reviewNum);
		if(review == null || !sId.equals(review.getUser_id()) && !sId.equals("admin")){
			model.addAttribute("msg","잘못된 접근입니다!");
			return "fail_back";
		}
			model.addAttribute("review",review);
		
		return "review/review_modify";
	}
								
	// 파일 삭제 AJAX 요청에 대한 응답 데이터 생성 및 전송을 위해 @ResponseBody 지정
	@ResponseBody
	@PostMapping("review/ReviewDeleteFile")
	public String deleteFile(ReviewVO review
							,HttpSession session
							) {
		
		// ReviewService - removeBoardFile() 메서드 호출하여 지정된 파일명 삭제 요청
		// => 파라미터 : ReviewVO 객체   리턴타입 : int(removeCount)
		int removeCount = service.removeReviewFile(review);
		
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
		
		// DB 파일명 삭제 실패 또는 서버 업로드 파일 삭제 실패 등의 문제 발생 시 "false" 리턴
		return "false";
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
		
		System.out.println(review);
		
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
	public String review_delete(
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
//		int comId = review.getCom_id();
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
	 
	@GetMapping("complete")
	public String review_complete() {
		return "review/review_complete";
	}

	@GetMapping("report")
	public String review_report() {
		return "review/review_report";
	}

	@GetMapping("comment")
	public String review_comment() {
		return "review/review_comment";
	}

}