package com.gticket.service;

import java.util.List;
import java.util.Map;

import com.gticket.domain.EventVO;
import com.gticket.domain.OrderVO;
import com.gticket.util.Criteria;
import com.gticket.util.SearchCriteria;

public interface AdminOrderService {
	
	//예매 등록을 위한 공연 목록 불러오기
	public List<EventVO> eventList() throws Exception;
	
	// 예매 목록 
	public List<OrderVO> adOrderList(Criteria cri)throws Exception;
	
	//예매 리스트 개수
	public int adOrderListCount(String odr_code)throws Exception;
		
	//예매 수정
	public void deliveryModify(Map map)throws Exception;
	
}
