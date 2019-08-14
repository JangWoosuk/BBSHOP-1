package com.bbshop.bit.domain;

import lombok.Data;

@Data
public class Gd_UniformVO {

   private long UNIFORM_NUM;   // 유니폼_번호
   private long GOODS_NUM;      // 상품_번호
   private int GD_SIZE;      // 옵션 > 사이즈(85,90,95,100,105)
   private String TEAM;      // 구단(소문자로 통일, 디코참고)(사용자옵션아님)
   private int HOME_AWAY;      // 홈어웨이 (0:홈, 1:어웨이)(사용자옵션아님)
   private long STOCK;         // 재고
   
}