package com.table.zzimkong.vo;

import java.util.List;

import lombok.Data;

@Data
public class AdminMainVO {
    private int countUnAnswerInquiry;  // 문의 답변 대기
    private int countUnApproveCompany; // 입점 승인 대기
    private int countUnHandleReport;   // 신고 처리 대기
    private int countDayNewMember;     // 오늘 가입자 수
    private int countDayRes;           // 오늘 예약 건수
    
    private List<String> dates;
    private List<Integer> counts;
    private List<String> times;
    private List<Integer> counts2;
    
    private List<String> join_dates;
    private List<Integer> join_date_counts;
    private List<String> join_times;
    private List<Integer> join_time_counts;
}
