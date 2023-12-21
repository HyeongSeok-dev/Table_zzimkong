package com.table.zzimkong.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PointVO {
	private int point_idx;
	private int user_idx;
	private int point_value;
	private int point_category;
	private int point_category_idx;
	private int point_status;
	private Date point_date;
}
