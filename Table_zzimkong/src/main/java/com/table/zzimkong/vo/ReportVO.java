package com.table.zzimkong.vo;

import lombok.Data;

@Data
public class ReportVO {
    private int report_num;
    private int review_num;
    private String user_id;
    private int com_id;
    private int report_reason;
    private int report_person;
    private String report_content;
    private String user_email1;
    private String user_email2;
    private String user_email;
    private String user_phone;
    private int report_category;
    private int report_status;
    
    private ReviewVO review;
}

