package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class Gd_BallVO {
   
   private long BALL_NUM;      // 야구공_번호
   private long GOODS_NUM;      // 상품_번호
   private int SALES_UNIT;      // 옵션 > 판매단위(0:낱개, 1:12개(1타스))
   private int USAGE;         // 용도(0:시합/연습용, 1:안전용)
   private long STOCK;         // 재고

}