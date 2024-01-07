package com.table.zzimkong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.table.zzimkong.mapper.*;
import com.table.zzimkong.vo.*;

@Service
public class MypageService {
	// MypageMapper 객체 자동 주입
	@Autowired
	private MypageMapper mapper;
	
	// 회원정보 조회 요청
	public MypageInfo getMypage(MypageInfo mypage) {
		return mapper.selectMypage(mypage);
	}
	
	// 회원정보 수정 요청
	public int modifyMypage(MypageInfo mypage, String newPasswd) {
		return mapper.updateMypage(mypage, newPasswd);
	}
	
	// 닉네임 중복확인
	public MypageInfo getUserNick(MypageInfo mypage) {
		return mapper.selectUserNick(mypage);
	}
	
	// 예약 내역 목록 간략히 보기(my_list.jsp)
	public List<Map<String, Object>> getResList(int sIdx) {
		return mapper.selectResList(sIdx);
	}
	
	 // 예약 내역 목록 상세 보기
	public List<Map<String, Object>> getResList2(int sIdx) {
		return mapper.selectResList2(sIdx);
	}
	
	// 예약 취소하기
	public int myResCancel(MypageInfo mypage) {
		return mapper.updateMyResCancel(mypage);
	}
	
	// 북마크 목록 간략히 보기(my_list.jsp)
	public List<BookmarkVO> getBookmarkList(int sIdx) {
		return mapper.selectBookmarkList(sIdx);
	}
	
	// 북마크 목록 상세 보기
	public List<BookmarkVO> getBookmarkList2(int sIdx) {
		return mapper.selectBookmarkList2(sIdx);
	}
	
	// 나의내역 페이지에서 북마크 삭제
	public int bookmarkDel(BookmarkVO bookmark) {
		// TODO Auto-generated method stub
		return mapper.deleteBookmark(bookmark);
	}

	// 더보기 페이지에서 북마크 삭제
	public int bookmarkDel2(BookmarkVO bookmark) {
		return mapper.deleteBookmark2(bookmark);
	}
	
	// 방문한 가게 조회
	public List<MypageInfo> getVisitedShop(int sIdx) {
		return mapper.selectVisitedShop(sIdx);
	}

	// 가게 신고하기
	public int registShopReport(ReportVO report) {
		return mapper.insertShopReport(report);
	}
	
	// 리뷰 조회
	public List<ReviewVO> getMyReview(String sId) {
		return mapper.selectMyReview(sId);
	}


	





}
