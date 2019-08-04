package com.bbshop.bit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.PageDTO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.service.GoodsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	private HttpSession session; // �α��� �ÿ� session�� id���� ����ִ�.
	
	// ��ǰ ��� ������
	@RequestMapping(value="/goods_list.do", method=RequestMethod.GET)
	public String goods_list(@RequestParam(required=false, defaultValue="1") int category, PagingVO pagingVO, Model model) {
		
		log.info("Controller...goods_list.jsp");
		
		String id = (String)session.getAttribute("id");
		
		// id = "noAccount";
		
		model.addAttribute("categoryInt", category);
		model.addAttribute("categoryString", service.category(category));
		
		model.addAttribute("pageMaker", new PageDTO(pagingVO, 123));
		model.addAttribute("id", id); // ���ǿ��� ���� id ���� model�� �߰���.
		
		return "shoppingMall/goods/goods_list";
	}
	
	
	// ��ǰ ��� ������ - ajax ������ �ѷ��ֱ� 
	@RequestMapping(value="/getGoodsList_Ajax.do", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getGoodsList_Ajax(@RequestParam int category, PagingVO pagingVO, @RequestParam String sorting,
										@RequestParam String min_amount, @RequestParam String max_amount, 
										@RequestParam(required=false) String search, 
										@RequestParam(required=false) String positions,
										@RequestParam(required=false) String hands,
										@RequestParam(required=false) String brands) throws JsonGenerationException, JsonMappingException, IOException {
		
		log.info("Controller...goods_list.jsp...goodsListAjax");
		
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		List<String> positions_list = new ArrayList<String>();
		List<Integer> hands_list = new ArrayList<Integer>();
		List<String> brands_list = new ArrayList<String>();

		// �Ϲ� �˻��̸� PagingVO ��ü�� �˻� Ÿ�԰� Ű���� �߰�.
		if (search != null) {
			
			pagingVO.setType("N");
			pagingVO.setKeyword(search);
		}
		
		// �� �˻��̸� ','�� ������ Ű���带 �߶� �迭�� ���� �ڿ� ���񽺷� �ѱ��.
		if (positions != null) {
			
			String[] positions_arr = positions.split(",");
			
			for (int i = 0; i < positions_arr.length; i++) {
				positions_list.add(positions_arr[i]);
			}
			
			System.out.println(positions_list.toString());
		}
		
		if (hands != null) {
			
			String[] hands_arr = hands.split(",");
			
			for (int i = 0; i < hands_arr.length; i++) {
				hands_list.add(Integer.parseInt(hands_arr[i]));
			}
			
			System.out.println(hands_list.toString());
		}
		
		if (brands != null) {
			
			String[] brands_arr = brands.split(",");
			
			for (int i = 0; i < brands_arr.length; i++) {
				brands_list.add(brands_arr[i]);
			}
			
			System.out.println(brands_arr.toString());
		}
		
		// �� �˻��� �ƴϸ� �� �迭�� �ѱ��.
		List<GoodsVO> goodsList = service.getGoodsList(category, pagingVO, sorting, min_amount, max_amount, 
				positions_list, hands_list, brands_list);

		System.out.println("��Ʈ�ѷ������� goodsList : " + goodsList.toString());
		
		try {
			
			str = mapper.writeValueAsString(goodsList);
			
		} catch(Exception e) {
			
			System.out.println("Controller���� ����" );
		}

		return str;
	}
	
	
	@RequestMapping(value="/goods_info.do", method=RequestMethod.GET)
	public String getGoodsInfo(@RequestParam long goods_num, @RequestParam int category, Model model) {
		log.info("Controller..getGoodsList..goods_num:" + goods_num + ".....");
		
		model.addAttribute("goods", service.getGoodsInfo(goods_num));
		model.addAttribute("categoryInt", category);
		model.addAttribute("categoryString", service.category(category));
		
		
		return "shoppingMall/goods/goods_info";
	}

}
