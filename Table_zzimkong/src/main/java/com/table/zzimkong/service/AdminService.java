package com.table.zzimkong.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.table.zzimkong.mapper.AdminMapper;
import com.table.zzimkong.vo.AdminMainVO;
import com.table.zzimkong.vo.CompanyVO;
import com.table.zzimkong.vo.CsVO;
import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.ReportVO;
import com.table.zzimkong.vo.ReservationVO;

@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;
	
	// 관리자 - 메인 : 데이터 뿌리기
	@Transactional
	public AdminMainVO adminMain() {
    	// 오늘 할 일 (입점 승인 대기, 신고 처리 대기)
		// 사이트 현황 (오늘 가입자 수, 오늘 예약 수)
        AdminMainVO adminMain = mapper.selectAdminMain();

        // 차트 : 시간별 가입자 데이터
        List<MemberVO> joinByHour = mapper.selectJoinByHour();
        List<String> join_times = new ArrayList<>();
        List<Integer> join_time_counts = new ArrayList<>();
        for (MemberVO member : joinByHour) {
        	
        	join_times.add(member.getJoin_hour() + ":" + member.getJoin_minute());
        	join_time_counts.add(member.getJoin_time_count());
        }
        adminMain.setJoin_times(join_times);
        adminMain.setJoin_time_counts(join_time_counts);
        
        // 차트 : 날짜별 가입자 데이터
        List<MemberVO> JoinByDate = mapper.selectJoinByDate();
        List<String> join_dates = new ArrayList<>();
        List<Integer> join_date_counts = new ArrayList<>();
        for (MemberVO member : JoinByDate) {
        	join_dates.add(member.getUser_reg_date());
        	join_date_counts.add(member.getJoin_date_count());
        }
        adminMain.setJoin_dates(join_dates);
        adminMain.setJoin_date_counts(join_date_counts);

        // 차트 : 시간별 예약자 데이터
        List<ReservationVO> resByHour = mapper.selectResByHour();
        List<String> res_times = new ArrayList<>();
        List<Integer> res_time_counts = new ArrayList<>();
        for (ReservationVO reservation : resByHour) {
        	res_times.add(reservation.getRes_hour() + ":" + reservation.getRes_minute());
        	res_time_counts.add(reservation.getRes_time_count());
        }
        adminMain.setRes_times(res_times);
        adminMain.setRes_time_counts(res_time_counts);

        // 차트 : 날짜별 예약자 데이터
        List<ReservationVO> resByDate = mapper.selectResByDate();
        List<String> res_dates = new ArrayList<>();
        List<Integer> res_date_counts = new ArrayList<>();
        for (ReservationVO reservation : resByDate) {
        	res_dates.add(reservation.getRes_date());
            res_date_counts.add(reservation.getRes_date_count());
        }
        adminMain.setRes_dates(res_dates);
        adminMain.setRes_date_counts(res_date_counts);

        return adminMain;
    }
	
	// 관리자 - 메인 : 데이터 뿌리기(오늘 할 일 (문의 답변 대기))
	public CsVO adminMainCsUnAnswer(CsVO cs) {
		return mapper.selectAdminMainCsUnAnswer(cs);
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
	
	// 관리자 - 회원 상세 정보 요청
	public MemberVO adminMemberInfo(MemberVO member) {
		return mapper.selectAdminMemberInfo(member);
	}

	@Transactional
	// 관리자 - 회원 탈퇴 요청
	public int adminMemberWithdraw(MemberVO member) {
		// point 테이블의 point_value도 같이 초기화
		mapper.updateAdminMemberWithdrawPoint(member);
		return mapper.updateAdminMemberWithdraw(member);
	}

	// 관리자 - 업체 목록 조회 요청 (페이지네이션, 검색 기능, 카테고리 필터)
	//        + 검색 결과, 카테고리 필터링에 따른 페이지네이션의 범위 재조정
	public List<CompanyVO> adminCompanyList(String searchCompanyType, String searchCompanyKeyword, String adGradeCategory, String companyStatusCategory, int startRow, int listLimit) {
		return mapper.selectAdminCompanyList(searchCompanyType, searchCompanyKeyword, adGradeCategory, companyStatusCategory, startRow, listLimit);
	}
	
	// 관리자 - 업체 목록 전체 글 목록 갯수 조회 요청
	public int adminCompanyListCount(String searchCompanyType, String searchCompanyKeyword, String adGradeCategory, String companyStatusCategory) {
		return mapper.selectAdminCompanyListCount(searchCompanyType, searchCompanyKeyword, adGradeCategory, companyStatusCategory);
	}

	// 관리자 - 업체 상세 정보 요청
	public CompanyVO adminCompanyInfo(CompanyVO company) {
		return mapper.selectAdminCompanyInfo(company);
	}

	// 관리자 - 업체 상세 정보 수정 요청
	public int adminCompanyInfoModify(CompanyVO company) {
		return mapper.updateAdminCompanyInfoModify(company);
	}

	// 관리자 - 업체 승인/반려 처리 요청
	public int adminCompanyRegister(CompanyVO company) {
		return mapper.updateAdminCompanyRegister(company);
	}

	// 관리자 - 신고 목록 조회 요청 (페이지네이션, 카테고리 필터)
	//        + 카테고리 필터링에 따른 페이지네이션의 범위 재조정
	public List<ReportVO> adminReportList(String reportCategory, String reportStatusCategory, int startRow, int listLimit) {
		return mapper.selectAdminReportList(reportCategory, reportStatusCategory, startRow, listLimit);
	}

	// 관리자 - 신고 목록 전체 글 목록 갯수 조회 요청
	public int adminReportListCount(String reportCategory, String reportStatusCategory) {
		return mapper.selectAdminReportListCount(reportCategory, reportStatusCategory);
	}
	
	// 관리자 - 신고 상세 정보 요청
	public Map<String, Object> adminReportDetail(ReportVO report) {
		return mapper.selectAdminReportDetail(report);
	}

	// 관리자 - 신고 승인/반려 처리 요청
	public int adminReportRegister(ReportVO report) {
		return mapper.updateAdminReportRegister(report);
	}

	// 관리자 - 고객센터 : 각 카테고리별 목록 조회 요청
	public List<CsVO> adminCsList(CsVO board, int csCategory) {
		return mapper.selectAdminCsList(board,csCategory);
	}

	// 관리자 - 고객센터 : 공지사항, 자주묻는질문 새 글 등록
	public int adminCsNoticeFaqRegister(CsVO board) {
		return mapper.insertAdminCsNoticeFaqRegister(board);
	}

	// 관리자 - 고객센터 : 공지사항, 자주묻는질문 글 수정
	public int modifyNoticeAndFaqBoard(CsVO board) {
		return mapper.updateNoticeAndFaqBoard(board);
	}

	// 관리자 - 고객센터 : 1:1 문의 답글 등록
	public int registBoardReply(CsVO board) {
		return mapper.insertBoardReply(board);
	}

	
}
