package com.bbshop.bit.mapper;

import java.util.HashMap;
import java.util.List;

import com.bbshop.bit.domain.Cart_GDVO;
import com.bbshop.bit.domain.Gd_BallVO;
import com.bbshop.bit.domain.Gd_BatVO;
import com.bbshop.bit.domain.Gd_GloveVO;
import com.bbshop.bit.domain.Gd_ShoesVO;
import com.bbshop.bit.domain.Gd_UniformVO;
import com.bbshop.bit.domain.OrderVO;

public interface OrderMapper {
	
	// 지수 장바구니
	public List<Cart_GDVO> getCheckedCartList(String[] goods_num_list);
	
	public Gd_GloveVO getOptionListGlove(long gd_details);
	
	public Gd_BatVO getOptionListBat(long gd_details);
	
	public Gd_UniformVO getOptionListUniform(long gd_details);
	
	public Gd_ShoesVO getOptionListShoes(long gd_details);
	
	public Gd_BallVO getOptionListBall(long gd_details);
	
	public int insertOrder(OrderVO order);
	
	public long getLastOrderNum(long user_key);

	// 의정 단일상품
	public Gd_GloveVO getGloveOption(HashMap<String, Object> map);	
	
	public Gd_BatVO getBatOption(HashMap<String, Object> map);	
	
	public Gd_UniformVO getUniformOption(HashMap<String, Object> map);	
	
	public Gd_ShoesVO getShoesOption(HashMap<String, Object> map);	
	
	public Gd_BallVO getBallOption(HashMap<String, Object> map);
}
