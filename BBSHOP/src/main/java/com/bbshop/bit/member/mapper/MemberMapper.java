package com.bbshop.bit.member.mapper;

import java.util.HashMap;

import com.bbshop.bit.member.domain.MemberVO;

public interface MemberMapper {
	
	//1.ȸ������
	public void insert(MemberVO member);

	public int memberCheck(HashMap<String, String> map);
}
