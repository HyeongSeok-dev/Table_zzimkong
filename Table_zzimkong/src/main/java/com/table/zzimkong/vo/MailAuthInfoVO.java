package com.table.zzimkong.vo;

import lombok.Data;

@Data
public class MailAuthInfoVO {
	private int auth_idx;
	private String user_id;
	private String auth_str;
	private String user_email;
}
