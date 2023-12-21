package com.table.zzimkong.vo;

import java.sql.Date;
import java.time.LocalTime;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CompanyVO {
    private int com_id;
    private int user_idx;
    private String com_name;
    private String com_category;
    private String com_ceo;
    private String com_address;
    private String com_tel;
    private String com_gugun;
    private String com_lat;
    private String com_lng;
    private LocalTime com_open_time;
    private LocalTime com_close_time;
    private String com_break_time;
    private int com_num;
    
    private MultipartFile file;
    private String com_img;
    /**/
    private int com_max_people;
    
    private boolean com_tag_date;
    private boolean com_tag_family;
    private boolean com_tag_party;
    private boolean com_tag_quiet;
    private boolean com_tag_park;
    private boolean com_tag_kids;
    private boolean com_tag_disabled;
    private boolean com_tag_pet;
    private boolean com_tag_hall;
    private boolean com_tag_room;
    private boolean com_tag_terrace;
    private boolean com_tag_window;
    
    private String com_hyg_rank;
    private Date com_hyg_start_date;
    private int com_status;
    private int com_ad_grade;
}

