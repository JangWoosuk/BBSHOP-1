package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class OnetooneVO {

	private long one_one_num;
	private String one_category;
	private String one_title;
	private String one_contents;
	private String one_file;
	private String regdate;
	private long user_key;
	private long seq;
	private long lev;
	private long dep;
}
