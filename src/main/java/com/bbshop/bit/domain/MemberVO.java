package com.bbshop.bit.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
public class MemberVO {

	private long USER_KEY;
    private String MEMBER_ID;
    private String NICKNAME;
    private String MEMBER_PW;
    private String NAME;
    private int BIRTH;
    private String PHONE;
    private String GRADE;
    private long SAVINGS;
    private int CAUTION;
    private Date REGDATE;
    private Date MODDATE;
    private int FLAG;
}
