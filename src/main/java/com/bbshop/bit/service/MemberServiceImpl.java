package com.bbshop.bit.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bbshop.bit.domain.MemberVO;
import com.bbshop.bit.domain.MoreDetailsVO;
import com.bbshop.bit.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Inject
    PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void register(MemberVO vo) {
		// TODO Auto-generated method stub
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		 System.out.println("ServiceImpl register");
		 
		 if(vo.getPHONE().equals("kakao")) {
			vo.setMEMBER_PW("kakao"); 
		 }else {
	        String encPassword = passwordEncoder.encode(vo.getMEMBER_PW());
	        vo.setMEMBER_PW(encPassword);
	        //System.out.println("占쏙옙호화占쏙옙 占쏙옙橘占싫� : "+user.getUserPassword());
		System.out.println("占쏙옙橘占싫� 占쏙옙호화 占쏙옙占쏙옙"+vo.toString());
		 }
		sqlSession.getMapper(MemberMapper.class);
		mapper.insertMember(vo);
		System.out.println("insert 占쏙옙占쏙옙!!!");
	}
	
	public long getUser_key(MemberVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		sqlSession.getMapper(MemberMapper.class);
		System.out.println(vo.getMEMBER_ID());
		long user_key =mapper.getUser_key(vo);
		System.out.println("key 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙!::::"+user_key);
		return user_key;
	}
	
	public void moreDetailsRegister(MoreDetailsVO md) {
		MemberMapper mapper= sqlSession.getMapper(MemberMapper.class);
		System.out.println(md.toString());
		sqlSession.getMapper(MemberMapper.class);
		mapper.moreDetailsRegister(md);
	}

	
	public String memberLogin(HashMap<String,String> map , String toPage) {
		// TODO Auto-generated method stub
		System.out.println("serviceimpl");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		sqlSession.getMapper(MemberMapper.class);
		int result=mapper.memberLogin(map);
		System.out.println("result="+result);
		if(mapper.memberLogin(map)==1) {
			
			if (toPage.equals("goShop")) {

				System.out.println("toPage is 'goShop'");
				
				return "shopping_main.do";
				
			} else if(toPage.equals("goCommunity")) {
				
				return "community_main.do";
			}
		}
		else {
			return "index.do";
		}
		return "index.do";
	}
	
	public String memberPw(MemberVO member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		sqlSession.getMapper(MemberMapper.class);
		String db_pw = mapper.memberPw(member);
		return db_pw;
		
	}

	public int getId(MemberVO vo) {		// TODO Auto-generated method stub
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		sqlSession.getMapper(MemberMapper.class);
		System.out.println("serviceImpl占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙?"+vo.getMEMBER_ID());
		int result=mapper.getId(vo);
		
		
		return result;
	}
	public int getNickname(MemberVO vo) {		// TODO Auto-generated method stub
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		sqlSession.getMapper(MemberMapper.class);
		System.out.println("serviceImpl占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙?"+vo.getNICKNAME());
		int result=mapper.getNickname(vo);
		
		
		return result;
	}

	@Override
	public MemberVO isExsist() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO getMemberInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteMemberInfo(String id, String pw) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void modify(MemberVO member) {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVO getMemberInfo(long user_key) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		sqlSession.getMapper(MemberMapper.class);
		System.out.println("serviceImpl....user_key : "+ user_key);
		
		return mapper.getMemberInfo(user_key);
	}

}
