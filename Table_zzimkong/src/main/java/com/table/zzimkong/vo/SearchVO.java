package com.table.zzimkong.vo;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SearchVO {
	String context;
	int persons;
	@DateTimeFormat(pattern = "h:mm")
	String time;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	String date;
	String location;
	String category;
	String minPrice;
	String maxPrice;
	String mood;
	String facilities;
	String tableType;
	String hygiene;
	String requestURL;
	String displayDate;
	String displayTime;
	
}
