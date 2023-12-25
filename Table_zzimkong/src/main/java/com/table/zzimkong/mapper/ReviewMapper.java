package com.table.zzimkong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.table.zzimkong.vo.ReviewVO;

@Mapper
public interface ReviewMapper {

	// 업체명 
	String selectCompanyName(int comId);
	
	// 리뷰 쓰기
	int insertReview(ReviewVO review);

	// 리뷰 글 수 
	int countReview(int comId);

	// 리뷰 별점 평균
	Double averageReview(int comId);

	// 리뷰 리스트 불러오기
	List<ReviewVO> allReviewList(int comId);

	// 리뷰 수정
//	ReviewVO modifyReview(int review_num, boolean b);

	ReviewVO modifyReview(int reviewNum);

	// 리뷰 삭제
	int removeReview(ReviewVO review);


}
