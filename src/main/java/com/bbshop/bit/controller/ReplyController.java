package com.bbshop.bit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bbshop.bit.domain.PagingVO;
import com.bbshop.bit.domain.ReplyPageDTO;
import com.bbshop.bit.domain.ReplyVO;
import com.bbshop.bit.service.ReplyService;

import lombok.AllArgsConstructor;

@RequestMapping("/replies/")
@RestController
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService replyService;
	
	// JSON 방식의 데이터만 처리하며, 문자열을 반환하도록 한다(consumes, produces)

	@RequestMapping(value="/new.do", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE},
	method= RequestMethod.POST)
	// @RequestBody를 적용해서 JSON 데이터를 ReplyVO 타입으로 변환하도록 한 것
	public ResponseEntity<String> create(@RequestBody ReplyVO vo, HttpSession session){
		
		/*
		 long user_key = (long)session.getAttribute("user_key");
		 String nickname = (String)session.getAttribute("nickname");
		 
		 // 비회원
		 if(nickname.substring(0,9).equals("noAccount")) {
		 	// 글쓰기 input에 readonly로 로그인하라고 띄우기
		 }
		 else{
		 	long user_key = (long)session.getAttribute("user_key");
		 	qna.setUser_key(user_key);
		 	}
		 */
		
		int insertCount = replyService.registerReply(vo);
		
		// 댓글이 정상적으로 등록되었을 경우, HttpStatus -> OK, 정상 등록 되지 않았을 경우, 내부 서버 에러. 삼항 연산자 처리
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value="/pages/{board_num}/{PAGENUM}.do", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE},
	method= RequestMethod.GET)
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("PAGENUM") int page, @PathVariable("board_num") long board_num){
		
		PagingVO pagingvo = new PagingVO(page, 10);
		
		return new ResponseEntity<>(replyService.getListPage(pagingvo, board_num), HttpStatus.OK);
	}
	
	// RequestMapping은 모든 method를 잡으므로, method = RequestMethed.GET을 안적어주면 delete를 해도 이쪽 컨트롤러를 탐
	@RequestMapping(value="/{reply_num}.do", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE},
			method= RequestMethod.GET)
	public ResponseEntity<ReplyVO> get(@PathVariable("reply_num") long reply_num) {
		
		return new ResponseEntity<>(replyService.getReply(reply_num), HttpStatus.OK);
	}
	
	@RequestMapping(value="/{reply_num}.do", produces = {MediaType.TEXT_PLAIN_VALUE}, 
			method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reply_num") long reply_num){
		
		return replyService.removeReply(reply_num) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH }, value="/{reply_num}.do",
			consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("reply_num") long reply_num) {
		
		vo.setReply_num(reply_num);
		
		return replyService.modifyReply(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

}
