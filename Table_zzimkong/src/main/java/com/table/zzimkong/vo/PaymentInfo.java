package com.table.zzimkong.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PaymentInfo {
	private String eachMenuTotalPrice;
	private String menuTotalPrice;
	private String totalPrice;
	private String totalPoint;
	private String res_table_price;
}
