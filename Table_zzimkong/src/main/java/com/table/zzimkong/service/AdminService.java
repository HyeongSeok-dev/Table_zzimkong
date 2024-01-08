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
    	// 오늘 할 일 (문의 답변 대기, 입점 승인 대기, 신고 처리 대기)
		// 사이트 현황 (오늘 가입자 수, 오늘 예약 수)
        AdminMainVO adminMain = mapper.selectAdminMain();

        // 차트 : 시간별 가입자 데이터
        List<MemberVO> membersByHour = mapper.selectMembersByTime();
        List<String> join_times = new ArrayList<>();
        List<Integer> join_time_counts = new ArrayList<>();
        for (MemberVO member : membersByHour) {
        	
        	join_times.add(member.getJoin_hour() + ":" + member.getJoin_minute());
        	join_time_counts.add(member.getJoin_time_count());
        }
        adminMain.setJoin_times(join_times);
        adminMain.setJoin_time_counts(join_time_counts);
        
        // 차트 : 날짜별 가입자 데이터
        List<MemberVO> membersByDate = mapper.selectMembersByDate();
        List<String> join_dates = new ArrayList<>();
        List<Integer> join_date_counts = new ArrayList<>();
        for (MemberVO member : membersByDate) {
        	join_dates.add(member.getUser_reg_date());
        	join_date_counts.add(member.getJoin_date_count());
        }
        adminMain.setJoin_dates(join_dates);
        adminMain.setJoin_date_counts(join_date_counts);

        // 차트 : 시간별 예약자 데이터
        List<ReservationVO> reservationsByHour = mapper.selectReservationsByHour();
        List<String> times = new ArrayList<>();
        List<Integer> counts2 = new ArrayList<>();
        for (ReservationVO reservation : reservationsByHour) {
        	times.add(reservation.getRes_hour() + ":" + reservation.getRes_minute());
        	counts2.add(reservation.getRes_count2());
        }
        adminMain.setTimes(times);
        adminMain.setCounts2(counts2);

        // 차트 : 날짜별 예약자 데이터
        List<ReservationVO> reservations = mapper.selectReservations();
        List<String> dates = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();
        for (ReservationVO reservation : reservations) {
            dates.add(reservation.getRes_date());
            counts.add(reservation.getRes_count());
        }
        adminMain.setDates(dates);
        adminMain.setCounts(counts);

        return adminMain;
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

	// 관리자 - 업체 승인/반려 처리 요청
	public int adminCompanyRegister(CompanyVO company) {
		return mapper.updateAdminCompanyRegister(company);
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

	public int modifyNoticeAndFaqBoard(CsVO board) {
		// TODO Auto-generated method stub
		return mapper.updateNoticeAndFaqBoard(board);
	}

	public int registBoardReply(CsVO board) {
		// TODO Auto-generated method stub
		return mapper.insertBoardReply(board);
	}




	
	
	
}
