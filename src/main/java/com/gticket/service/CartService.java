package com.gticket.service;

import java.util.List;
import java.util.Map;

import com.gticket.domain.CartProductVO;
import com.gticket.domain.CartVO;

public interface CartService {
	
	// 장바구니 리스트 가져오기
	public List<CartProductVO> getCart(String mb_id)throws Exception;
	
	// 장바구니 추가
	public void addCart(CartVO vo) throws Exception;
	
	// 장바구니 삭제
	public void deleteCart(int cart_code)throws Exception;
	
	// 장바구니 수량 변경
	public void updateCart(Map map) throws Exception; 
	
	// 장바구니 삭제(예매완료)
	public void deleteCartOrder(Map map) throws Exception;
}
