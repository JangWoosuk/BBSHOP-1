package com.bbshop.bit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommunityVO {
	
	private long BOARD_NUM;
	private String TEAM_NAME;
	private String TITLE;
	private String BOARD_CONTENT;
	private String UPLOADFILE;
	private String WRITER;	
	private long HIT;
	private Date REGDATE;
	private Date MODDATE;
	private long REPLY_COUNT;	 // 댓글 개수
	private long REPORT_NUM;	
	private long USER_KEY;	
	private long SEQ;	
	private long LEV;	
	private long DEP;
}
