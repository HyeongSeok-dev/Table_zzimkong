package com.table.zzimkong.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {

	private int pay_index;
	private String pay_num;
	private String res_idx;
	private String user_idx;
	private int pay_method;
	private int pay_on_sit;
	private int pay_to_price;
	private int pay_per_price;
	private int pay_po_price;
	private Date pay_date;
	private int pay_used_point;
	private boolean per_info_consent;
	private int pay_acq_point;
	private int pay_staus;
	
}
