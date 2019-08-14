package com.bbshop.bit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.bbshop.bit.domain.PageDTO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.service.FAQService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class FAQController {
	
	@Autowired
	private FAQService faqservice;
	
	@Autowired
	private HttpSession session;


	@GetMapping("/faq_list.do")
	public String list(PagingVO pag, Model model) {
		
		session.setAttribute("nickname", "슈퍼맨");
		
		String nickname = (String)session.getAttribute("nickname");
		
		log.info("list: " + pag);
		model.addAttribute("list", faqservice.FAQ_getList(pag));
		//model.addAttribute("pageMaker", new PageDTO(pag, 123));
		
		int total = faqservice.getTotal(pag);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(pag, total));
		model.addAttribute("nickname", nickname);
		
		return "shoppingMall/customerService/faq";
	}

//	@GetMapping("/faq_get.do")
//	public String get(@RequestParam("FAQ_NUM") long FAQ_NUM, Model model) {
//
	//	model.addAttribute("board", faqservice.FAQ_get(FAQ_NUM));
		
		//return "shoppingMall/customerService/faq_detail";
//	}

	@GetMapping("/faq_get.do")
	public String get(@RequestParam("FAQ_NUM") long FAQ_NUM, @ModelAttribute("pag") PagingVO pag, Model model) {
	
		model.addAttribute("board", faqservice.FAQ_get(FAQ_NUM));
		
		return "shoppingMall/customerService/faq_detail";
	}
	
	@GetMapping("/cancel.do")
		public String cancel(PagingVO pag, Model model) {
		
		log.info("list: " + pag);
		model.addAttribute("list", faqservice.cancel(pag));
		//model.addAttribute("pageMaker", new PageDTO(pag, 123));
		
		int canceltotal = faqservice.getCancelCount(pag);
		
		log.info("cancel total: " + canceltotal);
		
		model.addAttribute("pageMaker", new PageDTO(pag, canceltotal));
		model.addAttribute("page", "/cancel.do");
		
		return "shoppingMall/customerService/faq";
	}
	@GetMapping("/trade.do")
		public String trade(PagingVO pag, Model model) {
		
		log.info("list: " + pag);
		model.addAttribute("list", faqservice.trade(pag));
		//model.addAttribute("pageMaker", new PageDTO(pag, 123));
		
		int tradetotal = faqservice.getTradeCount(pag);
		
		log.info("tarde total: " + tradetotal);
		
		model.addAttribute("pageMaker", new PageDTO(pag, tradetotal));
		model.addAttribute("page", "/trade.do");
		
		return "shoppingMall/customerService/faq";
	}
	
	@GetMapping("/order.do")
		public String order(PagingVO pag, Model model) {
		
		log.info("list: " + pag);
		model.addAttribute("list", faqservice.order(pag));
		//model.addAttribute("pageMaker", new PageDTO(pag, 123));
		
		int ordertotal = faqservice.getOrderCount(pag);
		
		log.info("order total: " + ordertotal);
		
		model.addAttribute("pageMaker", new PageDTO(pag, ordertotal));
		model.addAttribute("page", "/order.do");	
		
		return "shoppingMall/customerService/faq";
	}
	
	@GetMapping("/question.do")
		public String question(PagingVO pag, Model model) {
		
		log.info("list: " + pag);
		model.addAttribute("list", faqservice.question(pag));
		//model.addAttribute("pageMaker", new PageDTO(pag, 123));
		
		int questiontotal = faqservice.getQuestionCount(pag);
		
		log.info("question total: " + questiontotal);
		
		model.addAttribute("pageMaker", new PageDTO(pag, questiontotal));
		model.addAttribute("page", "/question.do");

		
		return "shoppingMall/customerService/faq";
	}
	
	
}
