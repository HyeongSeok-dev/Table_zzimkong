package com.table.zzimkong.vo;

import lombok.Data;

/*
spring_mvc_board5.tiny_reply_board 테이블 정의
----------------------------------------------
글번호(reply_num) - 정수, PK
원본글번호(board_num) - 정수, FK(board - board_num, 삭제 옵션 추가), NN
작성자(reply_name) - 문자(16), NN
내용(reply_content) - 문자(200), NN
참조글번호(reply_re_ref) - 정수, NN
들여쓰기레벨(reply_re_lev) - 정수, NN
순서번호(reply_re_seq) - 정수, NN
작성일시(reply_date) - 날짜 및 시각, NN
----------------------------------------------
CREATE TABLE tiny_reply_board (
	reply_num INT PRIMARY KEY,
	board_num INT NOT NULL,
	reply_name VARCHAR(16) NOT NULL,
	reply_content VARCHAR(200) NOT NULL,
	reply_re_ref INT NOT NULL,
	reply_re_lev INT NOT NULL,
	reply_re_seq INT NOT NULL,
	reply_date DATETIME NOT NULL,
	FOREIGN KEY (board_num) REFERENCES board(board_num) ON DELETE CASCADE
);
*/

// 게시물 내의 댓글 1개 정보를 관리하는 TinyReplyBoardVO 클래스 정의
// => 단, 뷰페이지에서 작성일시에 대한 날짜 및 시각 처리를 쉽게 하기 위해 문자열 형식으로 타입 변경
@Data
public class TinyReplyReviewVO {
	private int comment_num; // reply_num
	private int review_num; // board_num
	private String user_id; // reply_name
	private String comment_category; 
	private String comment_content; // reply_content
	private String comment_update; // 
	private int comment_status;
	private int comment_re_ref; // reply_re_ref
	private int comment_re_lev; // reply_re_lev
	private int comment_re_seq; // reply_re_seq

	private String user_nick;
}









