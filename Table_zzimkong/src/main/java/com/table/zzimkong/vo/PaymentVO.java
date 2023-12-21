package com.table.zzimkong.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {

	private int pay_idx;
	private String pay_num;
	private String res_idx;
	private String user_idx;
	private int pay_method;
	private int pay_on_sit;
	private int pay_per_price; //테이블 예약금
	private int pay_po_price; //선주문금액
	private Date pay_date;
	private boolean per_info_consent;
	private int pay_staus;
	
}
