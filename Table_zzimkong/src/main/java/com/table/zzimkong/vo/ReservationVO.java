package com.table.zzimkong.vo;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class ReservationVO {
	private int res_idx;
	private String res_num;
	private int com_id;
	private int user_idx;
	private String res_date;
	private String res_time;
	private int res_table_price;
	private int res_person;
	private int res_status;
	private String res_name;
	private String res_phone;
	private Date res_now;
	private int res_pay_status;
	private String res_request;
	
	
	// 마이페이지에서 불러올 가게명 JOIN을 위한 멤버변수
	private String com_name;

	// 관리자페이지 - 예약 현황 차트 출력
	private int res_time_count;
	private int res_date_count;
	private int res_hour;
	private int res_minute;
	
	private String review_num;
}
