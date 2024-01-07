package com.table.zzimkong.vo;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CsVO {
	private int cs_board_num;
	private String user_id;
	private String cs_board_subject;
	private String cs_board_content;
	private int cs_board_re_ref;
	private int cs_board_re_lev;
	private int cs_board_re_seq;
	private int cs_board_readcount;
	private LocalDate cs_board_date;
	private int cs_board_category_user;
	private int cs_board_category_main;
	private int cs_board_category_sub;
	private int cs_board_category;
	private String cs_board_img_1;
	private String cs_board_img_2;
	private String cs_board_img_3;
	private String cs_board_img_4;
	private String cs_board_img_5;
	
	private String searchFAQ;
	private String sdate;
	private String edate;
	private MultipartFile mFile1;
	private MultipartFile mFile2;
	private MultipartFile mFile3;
	private MultipartFile mFile4;
	private MultipartFile mFile5;
	
	
}

