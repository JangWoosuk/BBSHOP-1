package com.bbshop.bit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbshop.bit.domain.ReportBoardVO;
import com.bbshop.bit.domain.ReportReplyVO;
import com.bbshop.bit.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	// 댓글 신고 등록
	@RequestMapping("/reportReply_registerAction.do")
	public String registerReplyAction(ReportReplyVO reportReplyvo, Model model) throws Exception {

		int res = reportService.registerReplyReport(reportReplyvo);
		model.addAttribute("BOARD_NUM", reportReplyvo.getBOARD_NUM());
		
		if(res == 1) {
			System.out.println("신고가 등록되었습니다.");
		} else {
			System.out.println("신고 등록에 실패하였습니다.");
		}
		return "redirect:/community_detail.do";
	}
	
	// 글 신고 등록
	@RequestMapping("/reportBoard_registerAction.do")
	public String registerBoardAction(ReportBoardVO reportboardvo, Model model) throws Exception {

		int res = reportService.registerBoardReport(reportboardvo);
		model.addAttribute("BOARD_NUM", reportboardvo.getBOARD_NUM());
		
		if(res == 1) {
			System.out.println("신고가 등록되었습니다.");
		} else {
			System.out.println("신고 등록에 실패하였습니다.");
		}
		return "redirect:/community_detail.do";
	}
	
}
