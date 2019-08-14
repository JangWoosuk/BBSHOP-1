package com.bbshop.bit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbshop.bit.domain.AddrVO;
import com.bbshop.bit.domain.GoodsQnaVO;
import com.bbshop.bit.domain.MemberVO;
import com.bbshop.bit.domain.MoreDetailsVO;
import com.bbshop.bit.domain.OnetooneVO;
import com.bbshop.bit.domain.OrderVO;
import com.bbshop.bit.domain.PageDTO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.domain.ReviewVO;
import com.bbshop.bit.domain.SavingsVO;
import com.bbshop.bit.service.MyPageService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private HttpSession session;
	
	@Inject
    PasswordEncoder passwordEncoder;
	
	// 회원 정보 조회 -> 적립금 불러오기
	@RequestMapping(value = "/savings.do")
	public String getSavings(Model model, PagingVO pagingVO) {
		
		pagingVO.setAmount(5); // 기본 생성자로 설정되는 10에서 5로 바꿔준다.
						
		long sum = 0;
		long total = 0;
		long user_key = (long)session.getAttribute("member");
		
		total = myPageService.getTotal(pagingVO, "savings", user_key); // 주문 배송 테이블 데이터 개수 구하기.
		
		List<SavingsVO> savings_list = myPageService.getSavingsList(pagingVO, total, user_key);
		
		if (savings_list.size() == 0) {
			
			return "shoppingMall/mypage/mypage";
		}
		
		List<Long> all_savings = myPageService.getAllSavings(user_key);
		
		List<OrderVO> orders_list = myPageService.getAllOrdersList(user_key);
		
		long[] savings_total_list = new long[(int)total];
		
		// 내 주문 주문 상태별 묶기
		int[] stts_list = new int[5];
		
		for (int i = 0; i < orders_list.size(); i++) {
						
			switch(orders_list.get(i).getStts()) {
			
				case 0 : 
					stts_list[0]++;
					break;
				case 1 :
					stts_list[1]++;
					break;
				case 2 : 
					stts_list[2]++;
					break;
				case 3 :
					stts_list[3]++;
					break;
				case 4 :
					stts_list[4]++;
					break;					
			}
		}
		
		// 적립금 전체 총합
		for (int i = 0; i < all_savings.size(); i++) {
			
			sum += all_savings.get(i);
			savings_total_list[i] = sum;
		}
		
		int start = (int)(total - (pagingVO.getPageNum() * pagingVO.getAmount()));
		int end = (int)(total - ((pagingVO.getPageNum()-1) * pagingVO.getAmount()));
		
		int cnt = (int)(pagingVO.getAmount() - 1);
		
		for (int i = start; i < end; i++) {
			
			savings_list.get(cnt--).setOr_savings_total(savings_total_list[i]);
		}
				
		model.addAttribute("pageMaker", new PageDTO(pagingVO, total));
		model.addAttribute("savings_list", savings_list);
		model.addAttribute("stts_list", stts_list);
		
		return "shoppingMall/mypage/mypage";
	}
	
	// 주문/배송 목록 불러오기
	@RequestMapping("/order_status.do")
	public String getOrderStatus(Model model, PagingVO pagingVO) {
				
		pagingVO.setAmount(5); // 기본 생성자로 설정되는 10에서 5로 바꿔준다.
		
		long total = 0;
		long user_key = (long)session.getAttribute("member");

		total = myPageService.getTotal(pagingVO, "shop_order", user_key); // 二쇰Ц 諛곗넚 �뀒�씠釉� �뜲�씠�꽣 媛쒖닔 援ы븯湲�.
		
		List<OrderVO> orders_list = myPageService.getOrdersList(pagingVO, total, user_key);
		
		model.addAttribute("pageMaker", new PageDTO(pagingVO, total));
		model.addAttribute("orders_list", orders_list);
		
		return "shoppingMall/mypage/order_status";
	}
	
	// 주문/배송 -> 주문 취소
	@RequestMapping("/order_cancel.do")
	public String getOrderCanceled(Model model, @RequestParam("order_num") long order_num) {
				
		myPageService.cancelOrder(order_num);
		
		return "redirect:/order_status.do";
	}
	
	// 내가 남긴 글 조회
	@RequestMapping("/mypost.do")
	public String getMyPost(Model model, PagingVO pagingVO) {
		
		pagingVO.setAmount(5);
		
		long total = 0;
		long sum = 0;
		long user_key = (long)session.getAttribute("member");	
		
		total = myPageService.getTotal(pagingVO, "review", user_key);
		List<ReviewVO> review_list = myPageService.getReviewList(pagingVO, total, user_key);
		
		PageDTO pageMaker = new PageDTO(pagingVO, total);
		
		for (int i = 0; i < review_list.size(); i++) {
			review_list.get(i).setRv_num(sum--);
		}
		
		model.addAttribute("review_list", review_list);
		model.addAttribute("pageMaker", pageMaker);

		return "shoppingMall/mypage/mypost";
	}
	
	// 회원 정보 수정 페이지
	@RequestMapping("/modify_info.do")
	public String getModifyInfo(Model model) {
		
		long user_key = (long)session.getAttribute("member");
		
		MemberVO member = myPageService.getUserInfo(user_key);
		List<AddrVO> addr_list = myPageService.getAddrList(user_key);
		MoreDetailsVO member_detail = myPageService.getDetail(user_key);
		
		member.setMEMBER_PW(""); // 암호화된 비밀번호가 들어있는 멤버VO의 비밀번호 필드를 초기화해준다.
		
		System.out.println("modify_info 컨트롤러의 회원 정보 : " + member.toString());
				
		model.addAttribute("memberInfo", member);
		
		if (addr_list != null) {
			
			model.addAttribute("addr_list", addr_list);
			System.out.println("modify_info 컨트롤러의 배송지 정보 : " + addr_list.toString());
		}
		if (member_detail != null) {
			
			model.addAttribute("member_detail", member_detail);
			System.out.println("modify_info 컨트롤러의 추가 사항 : " + member_detail.toString());
		}
		
		return "shoppingMall/mypage/modify_info";
	}
	
	// 회원 정보 수정
	@RequestMapping("/modify_userInfo.do")
	public String modify_userInfo(MemberVO memberVO) {

		long user_key = (long)session.getAttribute("member");
		
		memberVO.setUSER_KEY(user_key); // user_key는 계속 데리고 다니는 데이터가 아니라, 세션으로부터 받아야 하므로 테스트상 임의로 넣음.
		
		myPageService.updateUserInfo(memberVO);
		
		return "forward:/modify_info.do";
	}
	
	// 배송지 수정 페이지
	@RequestMapping("/modify_addr.do")
	public String modify_addr(@RequestParam("num") int index, Model model) {
		
		long user_key = (long)session.getAttribute("member");

		List<AddrVO> addr_list = myPageService.getAddrList(user_key);
		
		AddrVO addrVO = addr_list.get(index-1);

		model.addAttribute("addrVO", addrVO);
		model.addAttribute("num", index);
		
		return "shoppingMall/mypage/modify_addr";
	}
	
	// 배송지 수정하기
	@RequestMapping("/modify_userAddr.do")
	public String modify_userAddr(AddrVO addrVO, @RequestParam("zipcode") long zipcode) {
		
		long user_key = (long)session.getAttribute("member");

		addrVO.setUser_key(user_key);
		addrVO.setZc_key(zipcode);
		
		System.out.println("modify_userAddr 컨트롤러의 addrVO : " + addrVO.toString());
		
		myPageService.updateAddrInfo(addrVO);
		
		return "forward:/modify_info.do";
	}

	// 배송지 등록 페이지
	@RequestMapping("/write_addr.do")
	public String write_addr(@RequestParam("num") int num, Model model) {
		
		model.addAttribute("num", num);
		
		return "shoppingMall/mypage/write_addr";
	}
	
	// 배송지 등록하기
	@RequestMapping("/write_userAddr.do")
	public String write_userAddr(AddrVO addrVO, @RequestParam("zipcode") long zipcode) {
				
		long user_key = (long)session.getAttribute("member");

		addrVO.setUser_key(user_key);
		addrVO.setZc_key(zipcode);
		
		System.out.println("write_userAddr 컨트롤러의 addrVO : " + addrVO.toString());
		
		myPageService.insertAddrInfo(addrVO);
		
		return "forward:/modify_info.do";
	}
	
	// 배송지 삭제하기
	@RequestMapping("/delete_userAddr.do")
	public String delete_userAddr(@RequestParam("num") int num) {
		
		long user_key = (long)session.getAttribute("member");

		myPageService.deleteAddrInfo(user_key, num);
		
		return "forward:/modify_info.do";
	}

	// 회원 탈퇴 페이지
	@RequestMapping("/withdraw.do")
	public String withdraw() {
		
		return "shoppingMall/mypage/withdraw";
	}
	
	// 회원 탈퇴
	@RequestMapping("/secede.do")
	public String secede() {
		
		long user_key = (long)session.getAttribute("member");

		myPageService.deleteUserInfo(user_key);
		
		return "shoppingMall/main/shopping_main";
	}
	
	// 추가 사항 수정하기
	@RequestMapping("modify_detail.do")
	public String modify_detail(MoreDetailsVO moreDetailsVO) {
		
		System.out.println("modify_detail 컨트롤러 진입");
		
		long user_key = (long)session.getAttribute("member");

		moreDetailsVO.setUSER_KEY(user_key);
		
		System.out.println("modify_detail 컨트롤러에서의 VO : " + moreDetailsVO.toString());
		
		myPageService.updateDetailInfo(moreDetailsVO, user_key);
		
		return "redirect:/modify_info.do";
	}
	
	// 닉네임 중복 확인
	@RequestMapping(value = "/nickCheck.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String nickCheck(HttpServletRequest request) {
		
		String nickname = request.getParameter("NICKNAME");
		
		int result = myPageService.nickCheck(nickname);
		
		return Integer.toString(result);
	}

// ajax 컨트롤러

	// ajax로 적립금 가져 오기
	@RequestMapping(value = "/savingListPaging.do", consumes = "application/json")
	@ResponseBody
	public List<SavingsVO> getSavingListPaging(@RequestBody PagingVO pagingVO) {
		
		long sum = 0;
		long total = 0;
		long user_key = (long)session.getAttribute("member");

		total = myPageService.getTotal(pagingVO, "savings", user_key); // 二쇰Ц 諛곗넚 �뀒�씠釉� �뜲�씠�꽣 媛쒖닔 援ы븯湲�.
		
		List<SavingsVO> savings_list = myPageService.getSavingsList(pagingVO, total, user_key);
		
		List<Long> all_savings = myPageService.getAllSavings(user_key);
		
		long[] savings_total_list = new long[(int)total];
		
		// 적립금 전체 총합
		for (int i = 0; i < all_savings.size(); i++) {
			
			sum += all_savings.get(i);
			savings_total_list[i] = sum;
		}
		
		int start = (int)(total - (pagingVO.getPageNum() * pagingVO.getAmount()));
		int end = (int)(total - ((pagingVO.getPageNum()-1) * pagingVO.getAmount()));
		
		int cnt = (int)(pagingVO.getAmount()-1);
		
		for (int i = start; i < end; i++) {
			
			savings_list.get(cnt--).setOr_savings_total(savings_total_list[i]);
		}
		
		return savings_list;
	}
	
	// ajax로 배송 목록 가져 오기
	@RequestMapping(value = "/orderListPaging.do", consumes = "application/json")
	@ResponseBody
	public List<OrderVO> getOrderListPaging(@RequestBody PagingVO pagingVO) {
		
		long total = 0;
		long user_key = (long)session.getAttribute("member");

		total = myPageService.getTotal(pagingVO, "shop_order", user_key); // 주문 배송 테이블 데이터 개수 구하기.
		
		List<OrderVO> orders_list = myPageService.getOrdersList(pagingVO, total, user_key);
		
		return orders_list;
	}
	
	// ajax로 체크박스 배송 목록 가져 오기
	@RequestMapping(value = "/orderListCheck.do", consumes = "application/json")
	@ResponseBody
	public Map<String, Object> getOrderListCheck(@RequestBody Map<String, Object> map) {
		
		long total = 0;
		long user_key = (long)session.getAttribute("member");

		long pageNum = (long)Integer.parseInt((String)map.get("pageNum"));
		long amount = (long)Integer.parseInt((String)map.get("amount"));
		
		List<String> stts_list = new ArrayList<String>();
		
		System.out.println("map.get(\"stts\") : " + map.get("stts"));
		
		stts_list = (List<String>) map.get("stts");
		
		for (String item : stts_list) {
			
			System.out.println("item : " + item);
		}
		
		Map<String, Object> listMap = new HashMap<>();
		
		PagingVO pagingVO = new PagingVO(pageNum, amount);
		
		// 체크가 안되어있는 경우 (전체 주문 출력)
		if (stts_list.size() == 1 && Integer.parseInt(stts_list.get(0)) == 5) {
		
			total = myPageService.getTotal(pagingVO, "shop_order", user_key);  // 주문 배송 테이블 데이터 개수 구하기.
			
			List<OrderVO> orders_list = myPageService.getOrdersList(pagingVO, total, user_key);
			
			listMap.put("orders_list", orders_list);
			listMap.put("total", total);
			
			return listMap;
		}

		// 특정 주문 체크박스에 체크가 되어 있는 경우
		List<OrderVO> orders_list = myPageService.getOrdersListStss(pagingVO, total, user_key, stts_list);
		
		List<OrderVO> all_list = new ArrayList<OrderVO>();
				
		all_list = myPageService.getAllOrdersList(user_key);
		
		// 주문배송 상태와 숫자가 같으면 total 값을 1씩 증가시킨다.
		for (OrderVO item : all_list) {
			
			for (int i = 0; i < stts_list.size(); i++) {
				if ( item.getStts() == Integer.parseInt(stts_list.get(i)) ) {
					total++;
				}
			}
		}
		
		System.out.println("orders_list : " + orders_list);
		System.out.println("total : " + total);
		
		listMap.put("orders_list", orders_list);
		listMap.put("total", total);
		
		return listMap;
	}
	
	// ajax로 내가 남긴 글 가져 오기
	@RequestMapping(value = "/getTableWithAjax.do", consumes = "application/json")
	@ResponseBody
	public Map<String, Object> getTableWithAjax(@RequestBody Map<String, Object> map) {
		
		long user_key = (long)session.getAttribute("member");
		long total = 0;

		long pageNum = (long)Integer.parseInt((String)map.get("pageNum"));
		long amount = (long)Integer.parseInt((String)map.get("amount"));	
		String category = (String)map.get("category");
		
		Map<String, Object> listMap = new HashMap<>();
		
		PagingVO pagingVO = new PagingVO(pageNum, amount);
		
		if (!category.equals("all")) {
			
			total = myPageService.getTotal(pagingVO, category, user_key); // 테이블 데이터 개수 구하기
		}
				
		if (category.equals("review")) {
			
			listMap.put("review", myPageService.getReviewList(pagingVO, total, user_key));
			listMap.put("total", total);
			
			return listMap;
			
		} else if (category.equals("qna")) {
			
			listMap.put("qna", myPageService.getQnaList(pagingVO, total, user_key));
			listMap.put("total", total);

			return listMap;
			
		} else if (category.equals("onetoone")) {
			
			listMap.put("onetoone", myPageService.getOnetooneList(pagingVO, total, user_key));
			listMap.put("total", total);

			return listMap;
		
		// 전체 게시글 출력 코드
		} else {
			
			long sum = 0;
			pagingVO.setPageNum(0); // 전체 게시글을 출력하기 위해 pageNum을 0으로 설정한다.
			
			total = myPageService.getTotal(pagingVO, "review", user_key);
			List<ReviewVO> review_list = myPageService.getReviewList(pagingVO, total, user_key);
			sum += total;

			total = myPageService.getTotal(pagingVO, "qna", user_key);
			List<GoodsQnaVO> qna_list = myPageService.getQnaList(pagingVO, total, user_key);
			sum += total;
			
			total = myPageService.getTotal(pagingVO, "onetoone", user_key);
			List<OnetooneVO> onetoone_list = myPageService.getOnetooneList(pagingVO, total, user_key);			
			sum += total;
			
			List<Object> total_list = new ArrayList<Object>();
			
			// 전체 게시글 목록의 번호를 가지도록 VO상의 번호를 재설정한다.
			for (int i = 0; i < qna_list.size(); i++) {
				qna_list.get(i).setQna_num(sum--);
				total_list.add(qna_list.get(i));
			}
			
			for (int i = 0; i < onetoone_list.size(); i++) {
				onetoone_list.get(i).setOne_one_num(sum--);
				total_list.add(onetoone_list.get(i));
			}
			
			for (int i = 0; i < review_list.size(); i++) {
				review_list.get(i).setRv_num(sum--);
				total_list.add(review_list.get(i));				
			}
			
//			listMap.put("qna", qna_list);		
//			listMap.put("onetoone", onetoone_list);
//			listMap.put("review", review_list);
			
//			pagingVO.setPageNum(pageNum); // pagingVO의 pageNum을 다시 원래대로 맞춘다.
//			
//			// startPage와 endPage를 구하는 로직
//			int endPage = (int)(Math.ceil(pagingVO.getPageNum() / 10.0)) * 10;
//			int startPage = endPage - 9;
//			
//			int realEnd = (int)(Math.ceil((total_list.size() * 1.0) / pagingVO.getAmount()));
//			
//			if (realEnd < endPage) {
//				endPage = realEnd;
//			}
			
			int start = (int)((pageNum - 1) * amount);
			int end = (int)(amount * pageNum - 1);
			
			List<Object> output_list = new ArrayList<Object>();
			
			for (int i = start; i <= end; i++) {
				
				output_list.add(total_list.get(i));
			}
			
			// pageNum : 1, amount : 5 -> 0 ~ 4
			// pageNum : 2, amount : 5 -> 5 ~ 9
			// pageNum : 3, amount : 5 -> 10 ~ 14
			// pageNum : x, amount : y -> amount * (pageNum - 1) ~ amount * pageNum - 1
			
			System.out.println("output_list : " + output_list);
			System.out.println("total_list.size() : " + total_list.size());
			
			listMap.put("output_list", output_list);
			listMap.put("total", total_list.size());
			
			return listMap;
		}
	}
	
}
