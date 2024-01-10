package com.table.zzimkong.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;

import com.table.zzimkong.vo.*;

@Mapper
public interface MypageMapper {
	
	// 회원정보 조회
	MypageInfo selectMypage(MypageInfo mypage);
	
	// 회원정보 수정
	// => 주의! 파라미터가 복수개일 경우 @Param 어노테이션 사용하여 파라미터 이름 지정 필수!
	int updateMypage(@Param("mypage") MypageInfo mypage, @Param("user_passwd1") String newPasswd);
	
	// 닉네임 중복확인
	MypageInfo selectUserNick(MypageInfo mypage);
	
	// 예약 내역 간략히 조회
	List<Map<String, Object>> selectResList(@Param("sIdx") int sIdx);
	
	// 예약 내역 모두 조회
	List<Map<String, Object>> selectResList2(@Param("sIdx") int sIdx, @Param("startRow") int startRow,
			@Param("listLimit") int listLimit);
	
	// 예약 내역 전체 개수 조회
	int selectResList2Count();

	// 예약 취소
	int updateMyResCancel(MypageInfo mypage);
	
	// 북마크 목록
	List<BookmarkVO> selectBookmarkList(@Param("sIdx") int sIdx);

	// 북마크 목록 모두 조회
	List<BookmarkVO> selectBookmarkList2(@Param("sIdx") int sIdx);
	
	// 나의내역 페이지 북마크 삭제
	int deleteBookmark(BookmarkVO bookmark);

	// 더보기 페이지 북마크 삭제
	int deleteBookmark2(BookmarkVO bookmark);
	
	// 방문한 가게 조회
	List<MypageInfo> selectVisitedShop(int sIdx);

	// 가게 신고하기
	int insertShopReport(ReportVO report);
	
	// 나의 리뷰 조회
	List<ReviewVO> selectMyReview(String sId);

	// 포인트 조회
	List<PointVO> selectShowPoint(PointVO point);
	
	// 포인트 총점
	Integer selectTotalPoint(PointVO point);
	
	// 신고 회원정보 조회
	ReportVO selectReportInfo(String sId);
	
	
	







}
