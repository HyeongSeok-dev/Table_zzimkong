package com.table.zzimkong.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MenuVO {
	private int menu_idx;
	private int com_id;
	private String menu_name;
	private String menu_price;
	private String menu_describe;
	private String menu_img;
	private int order_amount;
	private MultipartFile mFile;
	
	private String menuTotalPrice;
	private String totalPayPrice;
	
	private String company_date;
}
