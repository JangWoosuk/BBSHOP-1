package com.bbshop.bit.member.domain;

import java.util.Date;

public class MemberVO {
	
	private int USER_KEY;
	private String MEMBER_ID;
	private String NICKNAME;
	private String MEMBER_PW;
	private String NAME;
	private int BIRTH;
	private int PHONE;
	private String GRADE;
	private int SAVINGS;
	private int CAUTION;
	private Date REGDATE;
	private Date MODDATE;
	private int FLAG;
	public int getUSER_KEY() {
		return USER_KEY;
	}
	public void setUSER_KEY(int uSER_KEY) {
		USER_KEY = uSER_KEY;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getNICKNAME() {
		return NICKNAME;
	}
	public void setNICKNAME(String nICKNAME) {
		NICKNAME = nICKNAME;
	}
	public String getMEMBER_PW() {
		return MEMBER_PW;
	}
	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(int bIRTH) {
		BIRTH = bIRTH;
	}
	public int getPHONE() {
		return PHONE;
	}
	public void setPHONE(int pHONE) {
		PHONE = pHONE;
	}
	public String getGRADE() {
		return GRADE;
	}
	public void setGLADE(String grade) {
		GRADE = grade;
	}
	public int getSAVINGS() {
		return SAVINGS;
	}
	public void setSAVINGS(int sAVINGS) {
		SAVINGS = sAVINGS;
	}
	public int getCAUTION() {
		return CAUTION;
	}
	public void setCAUTION(int cAUTION) {
		CAUTION = cAUTION;
	}
	public Date getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(Date rEGDATE) {
		REGDATE = rEGDATE;
	}
	public Date getMODDATE() {
		return MODDATE;
	}
	public void setMODDATE(Date mODDATE) {
		MODDATE = mODDATE;
	}
	public int getFLAG() {
		return FLAG;
	}
	public void setFLAG(int fLAG) {
		FLAG = fLAG;
	}
	@Override
	public String toString() {
		return "MemberVO [USER_KEY=" + USER_KEY + ", MEMBER_ID=" + MEMBER_ID + ", NICKNAME=" + NICKNAME + ", MEMBER_PW="
				+ MEMBER_PW + ", NAME=" + NAME + ", BIRTH=" + BIRTH + ", PHONE=" + PHONE + ", GRADE=" + GRADE
				+ ", SAVINGS=" + SAVINGS + ", CAUTION=" + CAUTION + ", REGDATE=" + REGDATE + ", MODDATE=" + MODDATE
				+ ", FLAG=" + FLAG + "]";
	}

	
		
}
