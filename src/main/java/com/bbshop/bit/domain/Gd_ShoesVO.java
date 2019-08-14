package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class Gd_ShoesVO {

   private long SHOES_NUM;      // 야구화_번호
   private long GOODS_NUM;      // 상품_번호
   private int SPIKE;         // 옵션 > 스파이크(0:없음, 1:있음)
   private int GD_SIZE;      // 옵션 > 사이즈(230,240,250,260,270)
   private String COLOR;      // 색상
   private long STOCK;         // 재고
   
}