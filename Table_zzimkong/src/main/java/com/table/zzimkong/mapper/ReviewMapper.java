package com.table.zzimkong.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.table.zzimkong.vo.MemberVO;
import com.table.zzimkong.vo.MenuVO;
import com.table.zzimkong.vo.ReviewCategoryCountVO;
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

	// 신고시 회원정보 불러오기 
	MemberVO findUserById(String sId);

	// 리뷰 신고
	int insertReviewReport(ReviewVO review);
	
	// 메뉴이름으로 리뷰 검색
	List<ReviewVO> selectReviewsByMenuName(int comId, String menuName);

	// 키워드로 리뷰 검색
	List<ReviewVO> selectReviewsByCategory(ReviewVO review);

	// 키워드 리뷰 카운트
	ReviewCategoryCountVO categoryCount(int comId);

	// 댓글 작성 요청
	int insertTinyReplyReview(Map<String, String> map);

	// 댓글 리스트 조회 요청
	List<Map<String, Object>> selectTinyReplyReviewList(int reviewNum);

	// 댓글 작성자 조회 요청
	Map<String, String> selectTinyReplyReviewWriter(Map<String, String> map);

	// 댓글 삭제 요청
	int deleteTinyReplyReview(Map<String, String> map);

	// 대댓글 작성 요청
	int insertTinyReReplyReview(Map<String, String> map);

	// 사용자 idx조회
	Integer selectUserIdx(String userId);

	// 예약 횟수 조회(user_idx)
	int selectCountReservation(@Param("userIdx") int userIdx, @Param("comId") int comId);

	// 각 리뷰에 대한 댓글 갯수 카운트
	int selectCountComment(int review_num);

	// 이런 곳 좋아요 출력
	int getCompanyLike(int comId);

	
}