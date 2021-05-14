package com.gticket.service;

import java.util.List;

import com.gticket.domain.BuyVO;
import com.gticket.util.Criteria;

public interface BuyService {

	public int buyInsert(BuyVO bvo);
	
	public List<BuyVO> adOrderList(Criteria cri) throws Exception; 
	
	public int adOrderListCount() throws Exception; 
	
}
