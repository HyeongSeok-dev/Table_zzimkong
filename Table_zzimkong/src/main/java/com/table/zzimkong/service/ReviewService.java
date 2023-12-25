package com.table.zzimkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.table.zzimkong.mapper.ReviewMapper;
import com.table.zzimkong.vo.ReviewVO;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper mapper;

	// 리뷰글 등록 요청
	public int registReview(ReviewVO review) {
		
		return mapper.insertReview(review);
	}

	// 업체 이름 불러오기
	public String getCompanyName(int comId) {

		return mapper.selectCompanyName(comId);
	}

	// 리뷰글 갯수
	public int getReviewCount(int comId) {

		return mapper.countReview(comId);
	}

	// 리뷰 별점 평균 계산
	public Double getReviewAverage(int comId) {

		return mapper.averageReview(comId);
	}
	
	// 리뷰 리스트 
	public List<ReviewVO> getAllReviews(int comId) {
		
		return mapper.allReviewList(comId);
	}

	// 리뷰 수정
//	public ReviewVO getReview(int reviewNum) {
//
//		return mapper.modifyReview(reviewNum);
//	}

//	public ReviewVO getReivew(int review_num, boolean b) {
//
//		return mapper.modifyReview(review_num, b);
//	}

	
	public ReviewVO getReivew(int reviewNum) {

		return mapper.modifyReview(reviewNum);
	}

	// 리뷰 삭제
	public int removeReview(ReviewVO review) {

		return mapper.removeReview(review);
	}





}
