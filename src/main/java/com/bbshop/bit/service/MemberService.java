package com.bbshop.bit.service;


import java.util.HashMap;

import com.bbshop.bit.domain.MemberVO;
import com.bbshop.bit.domain.MoreDetailsVO;

public interface MemberService {

	public  void register(MemberVO member);
	public String memberLogin(HashMap<String,String> map ,String toPage);
	public int getId(MemberVO vo);
	public int getNickname(MemberVO vo);
	public MemberVO isExsist();
	public MemberVO getMemberInfo(String id);
	public void moreDetailsRegister(MoreDetailsVO md);
	public long getUser_key(MemberVO vo);
	public boolean deleteMemberInfo(String id, String pw);
	public void modify(MemberVO member);
	public String memberPw(MemberVO member);
	
	public MemberVO getMemberInfo(long user_key);
}
