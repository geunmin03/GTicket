package com.gticket.service;

import java.util.List;

import com.gticket.domain.OrderDetailVOList;
import com.gticket.domain.OrderListVO;
import com.gticket.domain.OrderReadDetailVO;
import com.gticket.domain.OrderVO;

public interface OrderService {
	
	// 예매정보 추가(상품 상세/ 바로구매)
	public void addOrder(OrderVO order, OrderDetailVOList orderdetailvolist )throws Exception;
	
	// 예매정보 추가(장바구니)
	public void addOrderCart(OrderVO order, OrderDetailVOList orderDetailList, String mb_id) throws Exception;
	
	//예매목록
	public List<OrderListVO>  orderList(String mb_id) throws Exception;
		
	// 예매 상세 정보
	public List<OrderReadDetailVO> readOrder(int odr_code) throws Exception;
			
	// 예매자 정보
	public OrderVO getOrder(int odr_code) throws Exception;
	

}
