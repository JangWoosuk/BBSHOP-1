package com.bbshop.bit.service;

import com.bbshop.bit.domain.ReportBoardVO;
import com.bbshop.bit.domain.ReportReplyVO;

public interface ReportService {
	
	public int registerReplyReport(ReportReplyVO vo);
	
	public int registerBoardReport(ReportBoardVO vo);

}
