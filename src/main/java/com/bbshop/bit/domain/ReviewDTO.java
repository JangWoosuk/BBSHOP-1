package com.bbshop.bit.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private double avg;
	private int total;
	private int[] scoreCount;
}
