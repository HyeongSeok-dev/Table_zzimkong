package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.AdminMapper;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.ReportVO;

@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;
	 
	// 관리자 - 회원 목록 조회 요청
	public List<MemberVO> adminMemberList() {
		return mapper.selectAdminMemberList();
	}

	// 관리자 - 회원 탈퇴 요청
	public int adminMemberWithdraw(MemberVO member) {
		return mapper.updateAdminMemberWithdraw(member);
	}

	// 관리자 - 업체 목록 조회 요청
	public List<CompanyVO> adminCompanyList() {
		return mapper.selectAdminCompanyList();
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

	// 관리자 - 신고 목록 조회 요청
	public List<ReportVO> adminReportList() {
		return mapper.selectAdminReportList();
	}

}
