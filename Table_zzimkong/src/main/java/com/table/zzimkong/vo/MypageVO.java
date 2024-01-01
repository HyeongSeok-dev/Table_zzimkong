package com.table.zzimkong.vo;

import lombok.*;

@Data
public class MypageVO {
	private int user_idx;
	private String user_id;
	private String user_passwd;
	private String user_nick;
	private String user_email1;
	private String user_email2;
	private String user_email;
	private String user_name;
	private String user_birth;
	private int user_level;
	private String user_img;
	private int user_status;
	private int user_category;
	private int point_value; // 포인트
	private int total_point; // 포인트 합계
}
