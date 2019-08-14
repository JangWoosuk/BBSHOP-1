package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class ReviewVO {

	private long rv_num;
	private String title;
	private String contents;
	private long score;
	private String re_img;
	private String re_date;
	private long re_chk;
	private long goods_num;
	private long user_key;
	private String nickname;	// 뷰에 출력하기 위한 닉네임 (테이블에는 없는 컬럼)(추가)
}
