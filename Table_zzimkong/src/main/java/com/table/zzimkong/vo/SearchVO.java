package com.table.zzimkong.vo;


import java.time.LocalDate;
import java.time.LocalTime;

import lombok.Data;

@Data
public class SearchVO {
	String context;
	int persons;
	LocalTime time;
	LocalDate date;
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
