package com.table.zzimkong.vo;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SearchVO {
	private String context;
	private int persons;
	@DateTimeFormat(pattern = "h:mm")
	private String time;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String date;
	private String location;
	private String category;
	private String minPrice;
	private String maxPrice;
	private String mood;
	private String facilities;
	private String tableType;
	private String hygiene;
	private String displayDate;
	private String displayTime;
	private String sort;
	private String requestURL;
	private String redirectURL;
}
