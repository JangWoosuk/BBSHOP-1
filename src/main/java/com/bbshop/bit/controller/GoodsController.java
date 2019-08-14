package com.bbshop.bit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbshop.bit.domain.Cart_GDVO;
import com.bbshop.bit.domain.Gd_GloveVO;
import com.bbshop.bit.domain.GoodsQnaVO;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.MoreDetailsVO;
import com.bbshop.bit.domain.PageDTO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.domain.ReviewDTO;
import com.bbshop.bit.domain.ReviewVO;
import com.bbshop.bit.service.CartService;
import com.bbshop.bit.service.GoodsService;
import com.bbshop.bit.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	@Autowired
	private HttpSession session; // 로그인 시에 session에 id값이 담겨있다.
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;

	
	// 상품 목록 페이지
	@RequestMapping(value="/goods_list.do", method=RequestMethod.GET)
	public String goods_list(@RequestParam(required=false, defaultValue="1") int category, PagingVO pagingVO, Model model) {
		
		log.info("Controller...goods_list.jsp");
		
		System.out.println("컨트롤러에서의 category : " + category);
		
		// String id = (String)session.getAttribute("id");
		
		// id = "noAccount";
		
		model.addAttribute("categoryInt", category);
		model.addAttribute("categoryString", service.category(category));
		
		int total = service.getTotalCount(category);
		
		model.addAttribute("pageMaker", new PageDTO(pagingVO, total));
		
		return "shoppingMall/goods/goods_list";
	}

	// 상품 목록 페이지 - ajax 데이터 뿌려주기 
	@RequestMapping(value="/getGoodsList_Ajax.do", consumes="application/json")
	@ResponseBody
	public List<GoodsVO> getGoodsList_Ajax(@RequestBody Map<String, Object> map){
		log.info("Controller...goods_list.jsp...goodsListAjax");
		
		System.out.println("컨트롤러에서의 map : " + map.toString());
		
		String sorting = "";
		String min_amount = "";
		String max_amount = "";
		String search = "";
		
		// service메소드 호출하며.. 전달할 map에 들어갈 parameter..
		// service자체를 맵으로 바꿔볼깝..
		int category = (int) map.get("category");
		
		PagingVO pagingVO = new PagingVO();
		pagingVO.setPageNum((int) map.get("pageNum"));
		pagingVO.setAmount((int) map.get("amount"));
		
		
		// 상품 상세인 경우 해당 값들이 전부 들어오지 않으므로 null 체크를 해준다.
		if (map.get("sorting") != null) {
			sorting = (String)map.get("sorting");
		}
		
		if (map.get("min_amount") != null) {
			min_amount = (String)map.get("min_amount");
		}
		
		if (map.get("max_amount") != null) {
			max_amount = (String)map.get("max_amount");
		}
		
		if (map.get("search") != null) {
			search = (String)map.get("search");
		}
		
		List<String> positions_list = new ArrayList<String>();
		List<String> colors_list = new ArrayList<String>();
		List<String> brands_list = new ArrayList<String>();
		
		if (map.get("search") != null) {
			search = (String)map.get("search");
			
			pagingVO.setType("N");
			pagingVO.setKeyword(search);
		}
		
		if (map.get("postions") != null) {
			positions_list = (List<String>)map.get("postions");
		}
		
		if (map.get("colors") != null) {
			colors_list = (List<String>)map.get("colors");
		}
		
		if (map.get("brands") != null) {
			brands_list = (List<String>)map.get("brands");
		}
		
		int total = service.getTotalCountAjax(category, pagingVO, sorting, min_amount, max_amount, 
				positions_list, colors_list, brands_list);
		
		
		// 상세 검색이 아니면 빈 배열을 넘긴다.
		List<GoodsVO> goodsList = service.getGoodsList(category, pagingVO, sorting, min_amount, max_amount, 
				positions_list, colors_list, brands_list);
		
		for (GoodsVO goods : goodsList) {
			
			System.out.println("db에서 불러온 goodsList : " + goods.toString());
		}

		return goodsList;
	}
	
	// 상품 조회 페이지
	@RequestMapping(value="/goods_info.do", method=RequestMethod.GET)
	public String getGoodsInfo(@RequestParam long goods_num, @RequestParam int category, Model model) {
		log.info("Controller..getGoodsList..goods_num:" + goods_num + ".....");
		
		model.addAttribute("goods", service.getGoodsInfo(goods_num));
		model.addAttribute("categoryInt", category);
		model.addAttribute("categoryString", service.category(category));
		
		PagingVO pagingVO = new PagingVO();
		int qnaTotal = service.getQnaCount(goods_num);
		int reviewTotal = service.getReviewCount(goods_num);

		model.addAttribute("qnaPageMaker", new PageDTO(pagingVO, qnaTotal));
		model.addAttribute("reviewPageMaker", new PageDTO(pagingVO, reviewTotal));
		
		return "shoppingMall/goods/goods_info";
	}
	
	
	
	/* 상품 QNA 등록 */
	@RequestMapping(value="/registerGoodsQna.do", method=RequestMethod.POST)
	public String registerGoodsQna(GoodsQnaVO qna, int category, HttpSession session, Model model) {
		log.info("Controller..insertGoodsQna...!");
		
		/* 세션 user_key 값 받아오기 
		long user_key = (long)session.getAttribute("user_key");
		String nickname = (String)session.getAttribute("nickname");
		
		// 비회원일 경우, 
		if(nickname.substring(0,9).equals("noAccount")) {
			// alert("로그인이 필요합니다") or 로그인모달 or 인덱스로 날려
		}
		// 회원일 경우,.
		else {
			long user_key = (long)session.getAttribute("user_key");
			qna.setUser_key(user_key);
		}			
		*/
		
		// 합치기 전 임시 user_key
		long user_key = 950131l;
		qna.setUser_key(user_key);
		
		// qna insert
		service.insertGoodsQna(qna);
		
		model.addAttribute("goods_num", qna.getGoods_num());
		model.addAttribute("category", category);
		
		return "redirect:goods_info.do";
	}
	
	
	// 상품QNA 목록 페이지 - ajax 데이터 뿌려주기 
	@RequestMapping(value="/getQnaList_Ajax.do", consumes="application/json")
	@ResponseBody
	public List<GoodsQnaVO> getQnaList_Ajax(@RequestBody Map<String, Object> map){
		log.info("Controller...QNA_list.jsp...qnaListAjax");
		
		PagingVO pagingVO = new PagingVO();
		pagingVO.setPageNum((int) map.get("pageNum"));
		pagingVO.setAmount((int) map.get("amount"));
		
		long goods_num = (long) ((int)map.get("goods_num") * 1.0);
		
		List<GoodsQnaVO> qnaList = service.getQnaList(pagingVO, goods_num);

		return qnaList;
	}
	
	/* 상품 REVIEW 등록 */
	@RequestMapping(value="/registerReview.do", method=RequestMethod.POST)
	public String registerReview(ReviewVO review, int category, HttpSession session, Model model) {
		log.info("Controller..insertGoodsQna...!");
		
		// 세션 user_key 값 받아오기 
		long user_key = 0;
		String nickname = "";
		
		// 비회원일 경우, 
		if(nickname.substring(0,9).equals("noAccount")) {
			// alert("로그인이 필요합니다") or 로그인모달 or 인덱스로 날려
		} else {
			
			user_key = (long)session.getAttribute("user_key");
			nickname = (String)session.getAttribute("nickname");
		}
		
		// 합치기 전 임시 user_key
		review.setUser_key(user_key);
		
		log.info(review);
		
		// review insert
		service.insertReview(review);
		
		model.addAttribute("goods_num", review.getGoods_num());
		model.addAttribute("category", category);
		
		return "redirect:goods_info.do";
	}
	
	// 상품REVIEW 목록 페이지 - ajax 데이터 뿌려주기 
	@RequestMapping(value="/getReviewList_Ajax.do", consumes="application/json")
	@ResponseBody
	public List<ReviewVO> getReviewList_Ajax(@RequestBody Map<String, Object> map){
		log.info("Controller...Review_list.jsp...reviewListAjax");
		
		PagingVO pagingVO = new PagingVO();
		pagingVO.setPageNum((int) map.get("pageNum"));
		pagingVO.setAmount((int) map.get("amount"));
		
		long goods_num = (long) ((int)map.get("goods_num") * 1.0);
		
		int score = (int) map.get("score");
		
		List<ReviewVO> reviewList = service.getReviewList(pagingVO, goods_num, score);

		return reviewList;
	}
	
	// 상품REVIEW 별점 뿌려주는 부분 - ajax 데이터 뿌려주기 
	@RequestMapping(value="/getReviewScore_Ajax.do", consumes="application/json")
	@ResponseBody
	public ReviewDTO getReviewScore_Ajax(@RequestBody Map<String, Object> map){
		log.info("Controller...Review_list.jsp...reviewListAjax");
		
		ReviewDTO reviewDTO = service.getReviewDTO((long)((int)map.get("goods_num")*1.0));

		return reviewDTO;
	}

	// 쇼핑 메인 - 추천상품
	@RequestMapping(value="/shopping_main.do", method=RequestMethod.GET)
	public String shopping_main(HttpSession session, Model model) {

		log.info("Controller...shopping_main.jsp");

		long user_key = 0;
		List<GoodsVO> recommendList = new ArrayList<GoodsVO>();
		
		// 세션 user_key 값 받아오기 
		String nickname = (String)session.getAttribute("nickname");
				
		// 비회원일 경우, 
		if (nickname != null && nickname.length() > 10 && nickname.substring(0,9).equals("noAccount")) {
			
			recommendList = service.recommendBestList();
				
			model.addAttribute("recommendList", recommendList);
			
			return "shoppingMall/main/shopping_main";
			
		// 회원일 경우...
		} else {
			user_key = (long)session.getAttribute("member");
		}

		MoreDetailsVO moredetail = service.findDetail(user_key);

		System.out.println("moredetail 추가 사항 객체 정보 : " + moredetail);

		// 추가사항이 없을 경우 moredetail이 null이 되므로 null 체크 로직 추가.
		if (moredetail != null) {
		
			recommendList = service.recommendGoodsList(moredetail);
		}
		
		if (recommendList != null) {

			System.out.println("recommendList 객체 : " + recommendList.toString());

			for (int i = 0; i < recommendList.size(); i++) {

				System.out.println("추천 제품 목록 : " + recommendList.get(i).toString());
			}

		} else {

			System.out.println("recommendList는 null입니다.");
		}

		model.addAttribute("recommendList", recommendList);

		return "shoppingMall/main/shopping_main";
	}

	
	@RequestMapping("addGoodsToCart.do")
	@ResponseBody
	public Map<String, Object> addGoodsToCart(@RequestBody Map<String, Object> map) {
		
		long user_key = (long)session.getAttribute("member");
		long goods_detail_num = 0;
		
		int goods_num = (int)map.get("goods_num"); // Integer는 long으로 형변환할 수 없다.
		int qty = Integer.parseInt((String)map.get("qty"));
		int allPrice = 0;
		
		List<Cart_GDVO> cart_list = cartService.getCartList(user_key);
		List<GoodsVO> goods_list = new ArrayList<GoodsVO>();
		
		// 상품 상세 번호를 구할 때 필요한 변수들
		int category = (int)map.get("category");
		int option1 = Integer.parseInt((String)map.get("option1"));
		int option2 = Integer.parseInt((String)map.get("option2"));
		
		if (category == 1) {
			
			Gd_GloveVO gd_GloveVO = orderService.getGloveOption(goods_num, option1, option2);
			goods_detail_num = gd_GloveVO.getGLOVE_NUM();
		}
		
		Map<String, Object> result = new HashMap<>();
		
		// 상품 정보
		GoodsVO goods = service.getGoodsInfo((long)goods_num);
		System.out.println(goods.toString());
		
		// 상품 상세 번호
		// 상품 상세 객체(->번호)를 가지고 오는 로직이 의정이가 order에 구현해놓았음. 매퍼에는 임시로 1로 지정함.
		
		service.addGoodsToCart(goods, qty, user_key, goods_detail_num);
		
		result.put("goods", goods);
		result.put("qty", qty);
		
		// 장바구니 리스트에 담긴 상품들의 상품 정보를 담은 리스트를 만든다.
		for (int i = 0; i < cart_list.size(); i++) {
			
			long goodsnum = cart_list.get(i).getGOODS_NUM();
			Cart_GDVO temp = cart_list.get(i);
			temp.setTOTALPRICE(temp.getPRICE()*temp.getQNTTY());
			cart_list.set(i, temp);
			goods_list.add(cartService.getGoods(goodsnum));
		}
		
		// 총 금액 구하기.
		for (int i = 0 ; i < cart_list.size(); i++) {
			
			allPrice += cart_list.get(i).getTOTALPRICE();
		}
		
		result.put("allPrice", allPrice);
		result.put("goods_list",goods_list);
		result.put("cart_list", cart_list);
		
		return result;
	}
}
