package com.bbshop.bit.mapper;

import com.bbshop.bit.domain.ReportBoardVO;
import com.bbshop.bit.domain.ReportReplyVO;

public interface ReportMapper {
	
	public int insertReplyReport(ReportReplyVO vo);
	
	public int insertBoardReport(ReportBoardVO vo);

}
