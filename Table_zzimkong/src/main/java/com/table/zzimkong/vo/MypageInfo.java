package com.table.zzimkong.vo;



import org.springframework.web.multipart.*;

import lombok.*;

@Data
public class MypageInfo {
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
	
	// 업로드되는 실제 파일을 다룰 MultipartFile 타입 멤버변수 추가
	// => 멤버변수명은 form 태그 내의 파일의 name 속성값과 동일해야함
	private MultipartFile m_file;
	
	private int res_idx;
}
