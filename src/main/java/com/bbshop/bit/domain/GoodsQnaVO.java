package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class GoodsQnaVO {

	private long qna_num;			// qna_글번호
	private String title;			// qna_글제목
	private String content;			// qna_글내용
	private String attached_file;	// qna_첨부파일
	private String regdate;			// qna_날짜
	private long goods_num;			// 상품 번호
	private long user_key;			// 회원 식별자
	private long re_ref;		// 원글:PK(qna_num)과 같게, 답글:참조하는 원글 번호
	private int re_lev;			// 답글 계층 (0:원글(사용자), 1:답글(관리자))
	private int re_seq;			// 답글 순서 (0:원글(사용자), 1:답글(관리자))
	private String nickname;	// 뷰에 출력하기 위한 닉네임변수, 테이블에는 없는 컬럼.
}
