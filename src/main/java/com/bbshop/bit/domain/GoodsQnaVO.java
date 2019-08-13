package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class GoodsQnaVO {

	private long qna_num;	// ��������
	private String title;
	private String content;
	private String attached_file;
	private String regdate;
	private long goods_num;
	private long user_key;
	private long re_ref;		// ���� ���� ��ȣ (qna_num�� �׻� ���� ��ȣ)
	private int re_lev;			// ��� ���� (�����:����:0, ������:���:1)
	private int re_seq;			// ��� ���� (�����:����:0, ������:���:1)
	
}
