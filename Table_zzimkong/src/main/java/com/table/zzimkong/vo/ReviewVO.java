package com.table.zzimkong.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//리뷰글 1개 정보를 관리하는 ReviewVO 클래스 정의
@Data
public class ReviewVO {
	private int review_num;
	private String user_id;
	private int com_id;
	private int review_hits;
	private int res_idx;
	private String review_subject;
	private String review_content;
	private int review_score;
	private int review_mood_interior;
	private int review_mood_alone;
	private int review_mood_large;
	private int review_mood_meeting;
	private int review_mood_view;
	private int review_food_big;
	private int review_food_deli;
	private int review_food_cheap;
	private int review_food_fresh;
	private int review_food_healthy;
	private int review_etc_kind;
	private int review_etc_parking;
	private int review_etc_toilet;
	private int review_etc_fast;
	private int review_etc_child;
	private int review_no_keyword;
	private boolean review_like; // TINYINT는 boolean값으로 나타냄
	private int review_like_count;
	private Date review_update; // java.sql
	// ------------------------------------------------------------------------------------
	// String 타입으로 지정하는 파일 관련 멤버변수는 실제 파일이 아닌 파일의 이름을 다룰 용도로 사용
	// => 따라서, form 태그 내의 파일의 name 속성값과 달라야함(DB 컬럼명과 동일하게 설정)
	private String review_img_1;
//	private String review_img_2;
//	private String review_img_3;
//	private String review_img_4;
//	private String review_img_5;
	// ------------------------------------------------------------------------------------
	// 업로드되는 실제 파일을 다룰 MultipartFile 타입 멤버변수 추가
	// => 멤버변수명은 form 태그 내의 파일의 name 속성값과 동일해야함
	private MultipartFile file1;
	private int review_status;
	private String com_name;
	// ------------------------------------------------------------------------------------
	private int moodInteriorCount;
	private int moodAloneCount;
	private int moodLargeCount;
	private int moodMeetingCount;
	private int moodViewCount;
	private int moodBigCount;
	private int moodDeliCount;
	private int moodCheapCount;
	private int moodFreshCount;
	private int moodHealthyCount;
	private int moodKindCount;
	private int moodParkingCount;
	private int moodToiletCount;
	private int moodFastCount;
	private int moodChildCount;
	private int moodNoKeywordCount;
	
	private String menu_name;
	private String user_email;
	private String user_phone;

	// ------------------------------------------------------------------------------------
	// 신고 테이블
	private int report_reason;
	private int report_person;
	private String report_content;
	private boolean report_category;
	private int report_status;
	
	private double avg_score;
	private int reviewCount;
	private int fiveStarCount;
	private int fourStarCount;
	private int threeStarCount;
	private int twoStarCount;
	private int oneStarCount;
	
	// 카테고리 검색
	private String category;

	// 각 리뷰 당 댓글 수 
	private int commentCount; 
	
	
}
