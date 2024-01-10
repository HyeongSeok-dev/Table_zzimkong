package com.table.zzimkong.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PaymentVO {

	private int pay_idx;
	private String pay_num;
	private String res_idx;
	private String user_idx;
	private int pay_method; 
	private int pay_on_site; // 선주문의 현장결제의 유무
	private int pay_per_price; //테이블 예약금
	private int pay_po_price; //선주문금액이 옴
	private Date pay_date;
	private String pay_card_co;
	private boolean per_info_consent;
	private int pay_staus;
	
}
