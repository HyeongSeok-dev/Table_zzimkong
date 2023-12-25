package com.table.zzimkong.vo;

import lombok.Data;

@Data
public class MemberVO {
	private int user_idx;
	private String user_id;
	private String user_passwd;
	private String user_nick;
	private String user_email1;
	private String user_email2;
	private String user_email;
	private String user_name;
	private String user_birth;
	private String com_num; //사업자번호
	private String user_reg_date;
	private String user_phone;
	private int user_level;
	private String user_img;
	private int user_status;
	private int user_category;
	private int point_value; // 포인트
	
} //MemberVO

