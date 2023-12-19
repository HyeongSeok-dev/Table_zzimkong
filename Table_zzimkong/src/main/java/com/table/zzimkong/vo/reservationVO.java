package com.table.zzimkong.vo;

import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class reservationVO {
	private int res_idx;
	private String res_num;
	private int com_id;
	private int user_idx;
	private Date res_date;
	private Time res_time;
	private int res_table_price;
	private int res_menu_price;
	private String res_menu;
	private int res_person;
	private String res_name;
	private String res_phone;
	private boolean res_status;
	private Date res_now;

}
