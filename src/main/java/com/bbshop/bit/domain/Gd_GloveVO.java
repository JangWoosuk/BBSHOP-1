package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class Gd_GloveVO {
   
   private long GLOVE_NUM;      // 글러브_번호
   private long GOODS_NUM;      // 상품_번호
   private int HAND;         // 옵션 > 좌/우 (0:좌, 1:우)
   private int TAMING;         // 옵션 > 길들이기 (0:없음, 1:있음)
   private String POSITION;   // 포지션
   private String COLOR;      // 색상
   private long STOCK;         // 재고

}