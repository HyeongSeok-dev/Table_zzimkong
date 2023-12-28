package com.table.zzimkong.vo;

import lombok.Data;

@Data
public class PreOrderInfo {
		private int pre_idx;
		private int pre_num;
		private int menu_idx;
		private String menu_name;
		private String menu_price;
		private int res_idx;
		private String eachMenuTotalPrice;
}
