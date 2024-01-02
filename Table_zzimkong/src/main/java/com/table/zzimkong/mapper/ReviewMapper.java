package com.table.zzimkong.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReviewCountVO;
import com.table.zzimkong.vo.ReviewMenuVO;
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
	ReviewVO modifyReview(int reviewNum);

	// 리뷰 삭제
	int removeReview(ReviewVO review);

	// 리뷰 수정 시 파일 삭제
	int updateReviewFile(ReviewVO review);

	// 리뷰 수정 업데이트
	int updateReview(ReviewVO review);

	// 리뷰 내용 가져오기
	ReviewVO getReview(int reviewNum);

	// 이런 점이 좋았어요 
	List<ReviewCountVO> countReviewsByComId(int comId);

	int selectBoardListCount(@Param("searchType") String searchType, @Param("searchKeyword") String searchKeyword);

	// 리뷰 정렬 
	List<ReviewVO> selectReviewsByNewest(int comId);

	List<ReviewVO> selectReviewsByHighestScore(int comId);

	List<ReviewVO> selectReviewsByLowestScore(int comId);

	// 사진/영상만 보기
	List<ReviewVO> getSortedReviews(@Param("comId")int comId,
			@Param("sortType") String sortType,
			@Param("photoOnly") boolean photoOnly,
			@Param("menuName") String menuName);

	
	// 메뉴 불러오기 
	List<String> selectReviewMenu(int comId);



}