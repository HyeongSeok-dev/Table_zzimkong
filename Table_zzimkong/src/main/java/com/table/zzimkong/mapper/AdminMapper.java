package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.ReportVO;

@Mapper
public interface AdminMapper {

	// 관리자 - 회원 목록 조회
	List<MemberVO> selectAdminMemberList();

	// 관리자 - 회원 탈퇴 처리
	int updateAdminMemberWithdraw(MemberVO member);

	// 관리자 - 업체 목록 조회
	List<CompanyVO> selectAdminCompanyList();

	// 관리자 - 업체 상세 정보
	CompanyVO selectAdminCompanyInfo(CompanyVO company);

	// 관리자 - 업체 상세 정보 수정
	int updateAdminCompanyInfoModify(CompanyVO company);

	// 관리자 - 업체 승인
	int updateAdminCompanyApprove(CompanyVO company);

	// 관리자 - 신고 목록 조회
	List<ReportVO> selectAdminReportList();




}
