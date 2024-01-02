package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.table.zzimkong.vo.AdminMainVO;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.CsVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.ReportVO;

@Mapper
public interface AdminMapper {

	// 관리자 - 메인 : 데이터 뿌리기
	AdminMainVO selectAdminMain();
		
	// 관리자 - 회원 목록 조회, 검색 기능, 페이지네이션
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

	// 관리자 - 회원 탈퇴 처리
	int updateAdminMemberWithdraw(MemberVO member);

	// 관리자 - 업체 목록 조회, 검색 기능, 페이지네이션
	List<CompanyVO> selectAdminCompanyList(
			@Param("searchCompanyType") String searchCompanyType,
			@Param("searchCompanyKeyword") String searchCompanyKeyword,
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 관리자 - 업체 목록 전체 글 목록 갯수 조회
		int selectAdminCompanyListCount(
				@Param("searchCompanyType") String searchCompanyType,
				@Param("searchCompanyKeyword") String searchCompanyKeyword);
		
	// 관리자 - 업체 상세 정보
	CompanyVO selectAdminCompanyInfo(CompanyVO company);

	// 관리자 - 업체 상세 정보 수정
	int updateAdminCompanyInfoModify(CompanyVO company);

	// 관리자 - 업체 승인
	int updateAdminCompanyApprove(CompanyVO company);

	// 관리자 - 신고 목록 조회, 페이지네이션
	List<ReportVO> selectAdminReportList(
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);

	// 관리자 - 신고 목록 전체 글 목록 갯수 조회
	int selectAdminReportListCount();
	
	// 관리자 - 신고 상세 정보
	ReportVO selectAdminReportDetail(ReportVO report);

	// 관리자 - 고객센터 : 각 카테고리별 목록 조회
	List<CsVO> selectAdminCsList(int csCategory);

	// 관리자 - 고객센터 : 공지사항, 자주묻는질문 새 글 등록
	int insertAdminCsNoticeFaqRegister(CsVO cs);

	

}
