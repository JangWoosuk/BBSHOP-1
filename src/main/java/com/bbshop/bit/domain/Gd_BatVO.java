package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class Gd_BatVO {
   
   private long BAT_NUM;      // 배트_번호
   private long GOODS_NUM;      // 상품_번호
   private int GD_SIZE;      // 옵션 > 규격(32, 33)
   private String MATERIAL;   // 재질
   private String COLOR;      // 색상
   private long STOCK;         // 재고
   
}