package com.table.zzimkong.vo;

import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class ReservationVO {
	private int res_idx;
	private String res_num;
	private int com_id;
	private int user_idx;
	private String res_date;
	private String res_time;
	private int res_table_price;
	private int res_person;
	private boolean res_status;
	private String res_name;
	private String res_phone;
	private Date res_now;
	private int res_pay_status;
	private String res_request;
	private int pre_idx;
	
	
}
