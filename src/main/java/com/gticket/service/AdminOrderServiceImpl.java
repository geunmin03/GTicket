package com.gticket.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gticket.domain.EventVO;
import com.gticket.domain.OrderVO;
import com.gticket.persistence.AdminOrderDAO;
import com.gticket.util.Criteria;
@Service
public class AdminOrderServiceImpl implements AdminOrderService {
		
	@Inject
	private AdminOrderDAO dao;
	
	//예매 등록을 위한 공연 목록 불러오기
	public List<EventVO> eventList() throws Exception {
		return dao.eventList();
	}
	
	@Override
	public List<OrderVO> adOrderList(Criteria cri) throws Exception {
		return dao.adOrderList(cri);
	}

	@Override
	public int adOrderListCount(String odr_code) throws Exception {
		return dao.adOrderListCount(odr_code);
	}

	@Override
	public void deliveryModify(Map map) throws Exception {
		dao.deliveryModify(map);
	}

}
