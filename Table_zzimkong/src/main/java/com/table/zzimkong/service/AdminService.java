package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.AdminMapper;
import com.table.zzimkong.vo.AdminMainVO;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.CsVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.ReportVO;

@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;
	
	// 관리자 - 메인 : 데이터 뿌리기
	public AdminMainVO adminMain() {
		return mapper.selectAdminMain();
	}
	
	// 관리자 - 회원 목록 조회 요청 (페이지네이션, 검색 기능, 카테고리 필터)
	//        + 검색 결과, 카테고리 필터링에 따른 페이지네이션의 범위 재조정
	public List<MemberVO> adminMemberList(String searchMemberType, String searchMemberKeyword, String memberCategory, String memberStatusCategory, int startRow, int listLimit) {
		return mapper.selectAdminMemberList(searchMemberType, searchMemberKeyword, memberCategory, memberStatusCategory, startRow, listLimit);
	}
	
	// 관리자 - 회원 목록 전체 글 목록 갯수 조회 요청
	public int adminMemberListCount(String searchMemberType, String searchMemberKeyword, String memberCategory, String memberStatusCategory) {
		return mapper.selectAdminMemberListCount(searchMemberType, searchMemberKeyword, memberCategory, memberStatusCategory);
	}
	
	// 관리자 - 회원 탈퇴 요청
	public int adminMemberWithdraw(MemberVO member) {
		return mapper.updateAdminMemberWithdraw(member);
	}

	// 관리자 - 업체 목록 조회 요청, 검색 기능, 페이지네이션
	public List<CompanyVO> adminCompanyList(String searchCompanyType, String searchCompanyKeyword, int startRow, int listLimit) {
		return mapper.selectAdminCompanyList(searchCompanyType, searchCompanyKeyword, startRow, listLimit);
	}
	
	// 관리자 - 업체 목록 전체 글 목록 갯수 조회 요청
	public int adminCompanyListCount(String searchCompanyType, String searchCompanyKeyword) {
		return mapper.selectAdminCompanyListCount(searchCompanyType, searchCompanyKeyword);
	}

	// 관리자 - 업체 상세 정보 요청
	public CompanyVO adminCompanyInfo(CompanyVO company) {
		return mapper.selectAdminCompanyInfo(company);
	}

	// 관리자 - 업체 상세 정보 수정 요청
	public int adminCompanyInfoModify(CompanyVO company) {
		return mapper.updateAdminCompanyInfoModify(company);
	}

	// 관리자 - 업체 승인 요청
	public int adminCompanyApprove(CompanyVO company) {
		return mapper.updateAdminCompanyApprove(company);
	}

	// 관리자 - 신고 목록 조회 요청, 페이지네이션
	public List<ReportVO> adminReportList(int startRow, int listLimit) {
		return mapper.selectAdminReportList(startRow, listLimit);
	}

	// 관리자 - 신고 목록 전체 글 목록 갯수 조회 요청
	public int adminReportListCount() {
		return mapper.selectAdminReportListCount();
	}
	
	// 관리자 - 신고 상세 정보 요청
	public ReportVO adminReportDetail(ReportVO report) {
		return mapper.selectAdminReportDetail(report);
	}

	// 관리자 - 고객센터 : 각 카테고리별 목록 조회 요청
	public List<CsVO> adminCsList(CsVO board, int csCategory) {
		return mapper.selectAdminCsList(board,csCategory);
	}

	// 관리자 - 고객센터 : 공지사항, 자주묻는질문 새 글 등록
	public int adminCsNoticeFaqRegister(CsVO board) {
		return mapper.insertAdminCsNoticeFaqRegister(board);
	}

	public int modifyNoticeAndFaqBoard(CsVO board) {
		// TODO Auto-generated method stub
		return mapper.updateNoticeAndFaqBoard(board);
	}

	public int registBoardReply(CsVO board) {
		// TODO Auto-generated method stub
		return mapper.insertBoardReply(board);
	}

	
	
	
}
