package com.gticket.persistence;

import java.util.List;

import com.gticket.domain.BuyVO;
import com.gticket.util.Criteria;

public interface BuyDAO {

	public int buyInsert(BuyVO bvo);
	
	public List<BuyVO> adOrderList(Criteria cri) throws Exception; 
		
		public int adOrderListCount() throws Exception; 
		
}
