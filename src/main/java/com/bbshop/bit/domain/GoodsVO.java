package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class GoodsVO {
	
	private long goods_num;		// 상품 번호
	private int category;		// 카테고리 (1:글러브, 2:배트, 3:유니폼, 4:야구화, 5:야구공)
	private String name;		// 상품명
	private long price;			// 가격
	private String detail;		// 상세 설명((추가))
	private String brand;		// 브랜드 (10개)
	private String main_img;	// 메인 사진(goodsList)
	private String dtl_img1;	// 상세 사진1(goodsInfo - 대표)
	private String dtl_img2;	// 상세 사진2(goodsInfo - 상세설명 사진 긴거)
	private int best;			// 인기상품 (0:일반, 1:인기상품)
	private long discount;		// 할인율
	private long sales;			// 판매 수량
	private String regdate;		// 등록일
	// private Date regdate;
	
	// stock, soldout 변수 삭제!
}
