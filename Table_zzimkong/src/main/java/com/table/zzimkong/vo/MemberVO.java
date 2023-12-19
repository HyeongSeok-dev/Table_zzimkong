package com.table.zzimkong.vo;

import lombok.Data;

@Data
public class MemberVO {
	String user_idx;
	String user_id;
	String user_passwd;
	String user_nick;
	String user_email1;
	String user_email2;
	String user_name;
	String user_birth;
	String com_num; //사업자번호
	String user_reg_date;
	String user_phone;
	int user_pay_point;
	int user_event_point;
	int user_level;
	String user_img;
	int user_status;
	int user_category;
	
} //MemberVO

