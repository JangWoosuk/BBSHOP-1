package com.bbshop.bit.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbshop.bit.domain.ReportBoardVO;
import com.bbshop.bit.domain.ReportReplyVO;
import com.bbshop.bit.mapper.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int registerReplyReport(ReportReplyVO vo) {
		
		ReportMapper reportMapper = sqlSession.getMapper(ReportMapper.class);
		
		int res = reportMapper.insertReplyReport(vo);
		
		return res;
	}
	
	@Override
	public int registerBoardReport(ReportBoardVO vo) {
		
		ReportMapper reportMapper = sqlSession.getMapper(ReportMapper.class);
		
		int res = reportMapper.insertBoardReport(vo);
		
		return res;
	}

}
