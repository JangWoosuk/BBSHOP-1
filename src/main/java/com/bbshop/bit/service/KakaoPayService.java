package com.bbshop.bit.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.bbshop.bit.domain.Cart_GDVO;
import com.bbshop.bit.domain.GoodsVO;
import com.bbshop.bit.domain.KakaoPayApprovalVO;
import com.bbshop.bit.domain.KakaoPayReadyVO;
import com.bbshop.bit.domain.OrderVO;
 
@Service
public class KakaoPayService {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
    public String kakaoPayReady(List<GoodsVO> goodsList, List<Cart_GDVO> cartList, int allPrice, String list, long order_num) {
    	
    	String item_name, quantity, total_amount;
    	
    	// 테스트 버전으로 최대 결제 가능한 금액: 100만원
        if(goodsList.size() == 1) {
        	item_name = goodsList.get(0).getName();
        	quantity = cartList.get(0).getQNTTY() + "";
        	total_amount = Integer.toString(allPrice);

        } else {
        	item_name =  goodsList.get(0).getName()+" 외"+(goodsList.size()-1)+"건";
        	quantity = cartList.get(0).getQNTTY() + "";
        	total_amount = Integer.toString(allPrice);
        }
        

        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "96884f23357d9a04632a910b16517de5");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1004");
        params.add("partner_user_id", "bbshop");
        params.add("item_name", item_name);
        params.add("quantity", quantity);
        params.add("total_amount", total_amount);
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8080/kakaoPaySuccess.do?allPrice="+allPrice+"&list="+list+"&order_num="+order_num);
        params.add("cancel_url", "http://localhost:8080/kakaoPayCancel"); 
        params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay.do";
        
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token, int allPrice) {
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "96884f23357d9a04632a910b16517de5");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1004");
        params.add("partner_user_id", "bbshop");
        params.add("pg_token", pg_token);
        params.add("total_amount", Integer.toString(allPrice));
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    
}