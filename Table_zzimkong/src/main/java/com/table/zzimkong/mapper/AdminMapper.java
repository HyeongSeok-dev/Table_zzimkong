package com.table.zzimkong.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.table.zzimkong.vo.AdminMainVO;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.CsVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.ReportVO;
import com.table.zzimkong.vo.ReservationVO;

@Mapper
public interface AdminMapper {

	// 관리자 - 메인 : 데이터 뿌리기
	AdminMainVO selectAdminMain();
	List<ReservationVO> selectReservations();
	List<ReservationVO> selectReservationsByHour();
    List<MemberVO> selectMembersByTime();
    List<MemberVO> selectMembersByDate();
	
	// 관리자 - 회원 목록 조회 (페이지네이션, 검색 기능, 카테고리 필터)
	//        + 검색 결과, 카테고리 필터링에 따른 페이지네이션의 범위 재조정
	List<MemberVO> selectAdminMemberList(
			@Param("searchMemberType") String searchMemberType,
			@Param("searchMemberKeyword") String searchMemberKeyword,
			@Param("memberCategory") String memberCategory,
			@Param("memberStatusCategory") String memberStatusCategory,
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 관리자 - 회원 목록 전체 글 목록 갯수 조회
	int selectAdminMemberListCount(
			@Param("searchMemberType") String searchMemberType,
			@Param("searchMemberKeyword") String searchMemberKeyword,
			@Param("memberCategory") String memberCategory,
			@Param("memberStatusCategory") String memberStatusCategory);
	
	// 관리자 - 회원 상세 정보
	MemberVO selectAdminMemberInfo(MemberVO member);

	// 관리자 - 회원 탈퇴 처리
	int updateAdminMemberWithdraw(MemberVO member);
	// point 테이블의 point_value도 같이 초기화
	void updateAdminMemberWithdrawPoint(MemberVO member);

	// 관리자 - 업체 목록 조회 (페이지네이션, 검색 기능, 카테고리 필터)
	//        + 검색 결과, 카테고리 필터링에 따른 페이지네이션의 범위 재조정
	List<CompanyVO> selectAdminCompanyList(
			@Param("searchCompanyType") String searchCompanyType,
			@Param("searchCompanyKeyword") String searchCompanyKeyword,
			@Param("adGradeCategory") String adGradeCategory,
			@Param("companyStatusCategory") String companyStatusCategory,
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 관리자 - 업체 목록 전체 글 목록 갯수 조회
	int selectAdminCompanyListCount(
			@Param("searchCompanyType") String searchCompanyType,
			@Param("searchCompanyKeyword") String searchCompanyKeyword,
			@Param("adGradeCategory") String adGradeCategory,
			@Param("companyStatusCategory") String companyStatusCategory);
		
	// 관리자 - 업체 상세 정보
	CompanyVO selectAdminCompanyInfo(CompanyVO company);

	// 관리자 - 업체 상세 정보 수정
	int updateAdminCompanyInfoModify(CompanyVO company);

	// 관리자 - 업체 승인/반려 처리
	int updateAdminCompanyRegister(CompanyVO company);

	// 관리자 - 신고 목록 조회 (페이지네이션, 카테고리 필터)
	//        + 카테고리 필터링에 따른 페이지네이션의 범위 재조정
	List<ReportVO> selectAdminReportList(
			@Param("reportCategory") String reportCategory,
			@Param("reportStatusCategory") String reportStatusCategory,
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);

	// 관리자 - 신고 목록 전체 글 목록 갯수 조회
	int selectAdminReportListCount(
			@Param("reportCategory") String reportCategory,
			@Param("reportStatusCategory") String reportStatusCategory);
	
	// 관리자 - 신고 상세 정보
	Map<String, Object> selectAdminReportDetail(ReportVO report);

	// 관리자 - 신고 승인/반려 처리
	int updateAdminReportRegister(ReportVO report);

	// 관리자 - 고객센터 : 각 카테고리별 목록 조회
	List<CsVO> selectAdminCsList(@Param("board") CsVO board, @Param("csCategory") int csCategory);

	// 관리자 - 고객센터 : 공지사항, 자주묻는질문 새 글 등록
	int insertAdminCsNoticeFaqRegister(CsVO board);

	// 관리자 - 고객센터 : 공지사항, 자주묻는질문 글 수정
	int updateNoticeAndFaqBoard(CsVO board);
	
	// 관리자 - 고객센터 : 1:1 문의 답글 등록
	int insertBoardReply(CsVO board);

}
