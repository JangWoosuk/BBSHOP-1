package com.bbshop.bit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bbshop.bit.domain.CommunityVO;
import com.bbshop.bit.domain.PageDTO;
import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.service.CommunityService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("*.do")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private HttpSession session;
	
	/* 커뮤니티 */
	// 커뮤니티 - 메인
	@RequestMapping("/community_main.do")
	public String community_main() {
		return "shoppingMall/main/community_main";
	}
	
	// 커뮤니티 - 글쓰기
	@RequestMapping("/community_form.do")
	public String community_form(Model model, @RequestParam("TEAM_NAME") String teamName, HttpSession session) {
		
		/*
		 long user_key = (long)session.getAttribute("user_key");
		 String nickname = (String)session.getAttribute("nickname");
		 
		 // 비회원
		 if(nickname.substring(0,9).equals("noAccount")) {
		 	// alert("로그인이 필요합니다.");
		 }
		 else{
		 	long user_key = (long)session.getAttribute("user_key");
		 	qna.setUser_key(user_key);
		 	}
		 */
		model.addAttribute("nickname",communityService.getNickname(1));
		model.addAttribute("teamName", teamName);
		
		return "shoppingMall/community/community_form";
	}
	
	// 커뮤니티 - 글 상세
	@RequestMapping("/community_detail.do")
	public String community_detail(Model model, @RequestParam("BOARD_NUM") long board_num) {
		
		communityService.updateHit(board_num);		
		model.addAttribute("post", communityService.getPost((long) board_num));
		
		return "shoppingMall/community/community_detail";
	}

	// 커뮤니티 - 글 수정
	@RequestMapping("/community_modify.do")
	public String community_modify(Model model, @RequestParam("BOARD_NUM") long board_num) {
		
		model.addAttribute("post", communityService.getPost((long) board_num));
		model.addAttribute("boardNum", board_num);
		
		return "shoppingMall/community/community_modify";
	}
	
	// 페이징 포함한 리스트
	
	@RequestMapping(value ="/community_list.do",  method=RequestMethod.GET)
	public String list(PagingVO pagingvo, Model model, @RequestParam("TEAM_NAME") String teamName) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagingVO", pagingvo);
		map.put("teamName", teamName);
		int total = communityService.getTotal(map);
		
		model.addAttribute("teamName", teamName);
		model.addAttribute("list", communityService.getList(map));
		
		System.out.println("null check : " + communityService.getList(map).toString());
		
		for (CommunityVO vo : communityService.getList(map)) {
			
			System.out.println("vo : " + vo.toString());
		}
		
		model.addAttribute("pageMaker", new PageDTO(pagingvo, total));
		
		return "shoppingMall/community/community_list";
	}
	
	@RequestMapping("/communityWriteAction.do")
	public String communityWriteAction(CommunityVO community, Model model) throws Exception{
		
		long user_key = (long)session.getAttribute("member");
			
		community.setBOARD_CONTENT(community.getBOARD_CONTENT().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
		community.setUSER_KEY(user_key);
		
		int res = communityService.insertPost(community);
		
		model.addAttribute("BOARD_NUM",communityService.getBoardNum(user_key));
		
		if(res == 1) {
			System.out.println("글이 등록되었습니다.");
		} else {
			System.out.println("글 등록에 실패하였습니다.");
		}
		return "redirect:/community_detail.do";
		
	}
	
	@RequestMapping("/communityDeleteAction.do")
	public String communityDeleteAction(@RequestParam("BOARD_NUM") long board_num, @RequestParam("TEAM_NAME") String teamName) {
		
		int res = communityService.deletePost(board_num);
		
		if(res == 1) {
			System.out.println("글이 삭제되었습니다.");
		} else {
			System.out.println("글 삭제에 실패했습니다.");
		}
		
		return "redirect:/community_list.do?TEAM_NAME="+teamName;
	}
	
	@RequestMapping("/communityUpdateAction.do")
	public String communityUpdateAction(CommunityVO community, Model model) {

		long user_key = (long)session.getAttribute("member");
		
		community.setBOARD_CONTENT(community.getBOARD_CONTENT().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
		community.setUSER_KEY(user_key);
		
		int res = communityService.updatePost(community);
		
		model.addAttribute("BOARD_NUM",communityService.getBoardNum(user_key));
		
		if(res == 1) {
			System.out.println("글이 수정되었습니다.");
		} else {
			System.out.println("글 수정에 실패했습니다.");
		}
		
		return "redirect:/community_detail.do";
	}
	
	@RequestMapping(value = "/crawlRank.do", method = RequestMethod.GET)
	public ModelAndView crawl(ModelAndView model) {
		String url = "https://sports.news.naver.com/kbaseball/index.nhn";
        Document doc = null;
         
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
         
        Elements element = doc.select("div.home_news");
         
        String title = element.select("h2").text().substring(0, 4);
       
        ArrayList<String> list_text = new ArrayList<String>(); 
        ArrayList<String> list_link = new ArrayList<String>(); 
        
        for(Element el : element.select("li")) { 
        	String text = el.text().toString();
        	
        	// 뉴스 클릭을 위한
        	String link = "https://sports.news.naver.com" + el.select("a").attr("href");
            list_text.add(text);
            list_link.add(link);
        }  
		
        model.addObject("title", title);
        model.addObject("list_text", list_text);
        model.addObject("list_link", list_link);
        model.setViewName("crawl");
        
		return model;
	}
	
	@RequestMapping("/communityGetNextPostNumAction.do")
	public String getNextPostNumAction(@RequestParam("TEAM_NAME") String team_name, @RequestParam("BOARD_NUM") Long board_num,
			Model model) {
		
		if(communityService.findNextPost(team_name, board_num) != null) {
		model.addAttribute("BOARD_NUM", communityService.findNextPost(team_name, board_num));
		} else {
			model.addAttribute("BOARD_NUM", board_num);
		}
		return "redirect:/community_detail.do";
	}
	
	@RequestMapping("/communityGetPrevPostNumAction.do")
	public String getPrevPostNumAction(@RequestParam("TEAM_NAME") String team_name, @RequestParam("BOARD_NUM") Long board_num,
			Model model) {

		if(communityService.findPreviousPost(team_name, board_num) != null) {
		model.addAttribute("BOARD_NUM", communityService.findPreviousPost(team_name, board_num));
		} else {
			model.addAttribute("BOARD_NUM", board_num);
		}
		return "redirect:/community_detail.do";
	}

}
