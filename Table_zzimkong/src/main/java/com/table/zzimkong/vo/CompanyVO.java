package com.table.zzimkong.vo;


import java.sql.Date;
import java.time.LocalTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CompanyVO {
    private int com_id;
    private int user_idx;
    private String com_name;
    private String com_category;
    private String com_ceo;
    private String com_address;
    private String com_tel;
    private String com_gugun;
    private String com_open_time;
    private String com_close_time;
    private String com_break_time;
    private String com_breakStart_time;
    private String com_breakEnd_time;
    private String com_num;
    
    private MultipartFile file;
    private String com_img;
    private int com_max_people;
    
    private boolean com_tag_date;
    private boolean com_tag_family;
    private boolean com_tag_party;
    private boolean com_tag_quiet;
    private boolean com_tag_park;
    private boolean com_tag_kids;
    private boolean com_tag_disabled;
    private boolean com_tag_pet;
    private boolean com_tag_hall;
    private boolean com_tag_room;
    private boolean com_tag_terrace;
    private boolean com_tag_window;
    
    private String com_hyg_rank;
    private Date com_hyg_start_date;
    private int com_status;
    private int com_ad_grade;
    private String com_search_tag;
    private Date com_reg_date;
    private String open_date; 
    
	private int min_price;
	private int max_price;
	private int distance;
	private int review_count;
	private double avg_score;
	
	private int total_reserved;
	private int remaining_people;
	private int remaining_people2;
	private int remaining_people3;
	private int remaining_people4;
	private int menu_idx;
	private String menu_name;
	private String menu_describe;
	private String menu_img ;
	private String selectedTime;

	//	ceo_register.jsp 에서 가지고갈 정보들
    private String com_num_str;
	private String openHour;
	private String openMin;
	private String closeHour;
	private String closeMin;
	private String startHour;
	private String startMin;
	private String endHour;
	private String endMin;
	private String operatingTime;
	private String breakTime;
	
	private String com_tag;
	
	// admin_company.jsp에서 필요한 정보
	private String company_open_register;
	
}

