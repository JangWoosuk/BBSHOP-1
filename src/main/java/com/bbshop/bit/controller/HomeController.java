package com.bbshop.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	// index - 동영상 및 로그인
	@RequestMapping("/")
	public String index() {

		return "index.do";
	}

	/* 쇼핑몰 */
	// 쇼핑몰 - 메인
	@RequestMapping("/shopping_main.do")
	public String shopping_main() {
		return "shoppingMall/main/shopping_main";
	}

	// 쇼핑몰 - 상품 리스트
	@RequestMapping("/goods_list.do")
	public String goods_list() {
		return "shoppingMall/goods/goods_list";
	}

	// 쇼핑몰 - 상품 정보
	@RequestMapping("/goods_info")
	public String goods_info() {
		return "shoppingMall/goods/goods_info";
	}

	// 쇼핑몰 - 장바구니
	@RequestMapping("/cart")
	public String cart() {
		return "shoppingMall/cart/cart";
	}

	// 쇼핑몰 커뮤니티 공통 - 고객센터 - FAQ(고객센터의 메인)
	@RequestMapping("/faq")
	public String faq() {
		return "shoppingMall/customerService/faq";
	}

	// 쇼핑몰 커뮤니티 공통 - 고객센터 - 1:1문의
	@RequestMapping("/one_to_one_list")
	public String one_to_one_list() {
		return "shoppingMall/customerService/one_to_one_list";
	}

	// 쇼핑몰 커뮤니티 공통 - 고객센터 - FAQ 글 상세보기
	@RequestMapping("/faq_detail")
	public String faq_detail() {
		return "shoppingMall/customerService/faq_detail";
	}

	// 쇼핑몰 커뮤니티 공통 - 고객센터 - FAQ 글 수정
	@RequestMapping("/faq_modify")
	public String faq_modify() {
		return "shoppingMall/customerService/faq_modify";
	}

	// 쇼핑몰 커뮤니티 공통 - 고객센터 - 1:1문의 글 상세보기
	@RequestMapping("/one_to_one_list_detail")
	public String one_to_one_list_detail() {
		return "shoppingMall/customerService/one_to_one_list_detail";
	}

	// 쇼핑몰 커뮤니티 공통 - 고객센터 - 1:1문의 글 수정하기
	@RequestMapping("/one_to_one_list_modify")
	public String one_to_one_list_modify() {
		return "shoppingMall/customerService/one_to_one_list_modify";
	}

	// 쇼핑몰 - 주문 - 주문하기
	@RequestMapping("/order")
	public String order() {
		return "shoppingMall/order/order";
	}

	// 쇼핑몰 - 주문 - 주문 확인 창
	@RequestMapping("/order_confirmation")
	public String order_confirmation() {
		return "shoppingMall/order/order_confirmation";
	}

	/* 쇼핑몰 커뮤니티 공통 - 마이 페이지 */
	// 마이페이지
	@RequestMapping("/mypage")
	public String mypage() {
		return "shoppingMall/mypage/mypage";
	}

	// 마이페이지 - 주문/배송 조회
	@RequestMapping("/order_status")
	public String order_status() {
		return "shoppingMall/mypage/order_status";
	}

	// 마이페이지 - 내가 남긴 글
	@RequestMapping("/mypost")
	public String mypost() {
		return "shoppingMall/mypage/mypost";
	}

	// 마이페이지 - 내가 남긴 글 - 상품 후기
	@RequestMapping("/mypost_review")
	public String mypost_review() {
		return "shoppingMall/mypage/mypost_review";
	}

	// 마이페이지 - 내가 남긴 글 - 상품 문의
	@RequestMapping("/mypost_qna")
	public String mypost_qna() {
		return "shoppingMall/mypage/mypost_qna";
	}

	// 마이페이지 - 내가 남긴 글 - 1대1 문의
	@RequestMapping("/mypost_one_to_one")
	public String mypost_one_to_one() {
		return "shoppingMall/mypage/mypost_one_to_one";
	}

	/*
	 * 아직 // 마이페이지 - 내가 남긴 글 - 1대1 문의 상세/조회
	 * 
	 * @RequestMapping("/mypost_one_to_one_info") public String
	 * mypost_one_to_one_info() { return
	 * "shoppingMall/mypage/mypost_one_to_one_info"; }
	 */

	// 마이페이지 - 회원 정보 수정
	@RequestMapping("/modify_info")
	public String modify_info() {
		return "shoppingMall/mypage/modify_info";
	}

	// 마이페이지 - 회원 정보 수정 - 배송지 수정
	@RequestMapping("/modify_addr")
	public String modify_addr() {
		return "shoppingMall/mypage/modify_addr";
	}

	// 마이페이지 - 회원 정보 수정 - 배송지 등록
	@RequestMapping("/write_addr")
	public String write_addr() {
		return "shoppingMall/mypage/write_addr";
	}

	// 마이페이지 - 회원 정보 수정 - 회원탈퇴
	@RequestMapping("/withdraw")
	public String withdraw() {
		return "shoppingMall/mypage/withdraw";
	}

	/* 커뮤니티 */
	// 커뮤니티 - 메인
	@RequestMapping("/community_main")
	public String community_main() {
		return "shoppingMall/main/community_main";
	}

	// 커뮤니티 - 게시판
	@RequestMapping("/community_list")
	public String community_list() {
		return "shoppingMall/community/community_list";
	}

	// 커뮤니티 - 글쓰기
	@RequestMapping("/community_form")
	public String community_form() {
		return "shoppingMall/community/community_form";
	}

	// 커뮤니티 - 글 상세
	@RequestMapping("/community_detail")
	public String community_detail() {
		return "shoppingMall/community/community_detail";
	}

	// 커뮤니티 - 글 수정
	@RequestMapping("/community_modify")
	public String community_modify() {
		return "shoppingMall/community/community_modify";
	}

}
