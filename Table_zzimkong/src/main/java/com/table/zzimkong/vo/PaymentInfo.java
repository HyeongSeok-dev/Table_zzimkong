package com.table.zzimkong.vo;

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
public class PaymentInfo {
	//결제를 위해불러올 정보저장
	private String menuTotalPrice;
	private String totalPrice;
	// 결제전은 디비에서 point 내역의 합
	// 결제후는 사용한 포인트를 제하고, 적립할 포인트를 합한것
	private String totalPoint;
	private String res_table_price;
	
	//결제후 정보저장
	private String discountCoupon;
	private String discountPoint;
	private String earnedPoints;
	private String nowPoint;
	private String totalPayment;
	private String preOrderTotalPrice; //선주문 결제 금액
	private String payMethod;
	
	// 결제를 위한정보
	public PaymentInfo(String menuTotalPrice, String totalPrice, String totalPoint, String res_table_price) {
		this.menuTotalPrice = menuTotalPrice;
		this.totalPrice = totalPrice;
		this.totalPoint = totalPoint;
		this.res_table_price = res_table_price;
	}
	
	public PaymentInfo(String menuTotalPrice, String totalPrice, String totalPoint, String res_table_price, String payMethod) {
		this.menuTotalPrice = menuTotalPrice;
		this.totalPrice = totalPrice;
		this.totalPoint = totalPoint;
		this.res_table_price = res_table_price;
		this.payMethod = payMethod;
	}
}
