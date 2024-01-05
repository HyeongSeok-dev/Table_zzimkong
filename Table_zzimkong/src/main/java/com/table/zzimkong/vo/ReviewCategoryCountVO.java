package com.table.zzimkong.vo;

import lombok.Data;

@Data
public class ReviewCategoryCountVO {
    private int review_category_count_taste;  // 맛
    private int review_category_count_satisfaction; // 만족도
    private int review_category_count_service;  // 서비스
    private int review_category_count_waiting;   // 대기시간
    private int review_category_count_quantity;   // 음식량
}
