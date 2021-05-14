package com.gticket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gticket.domain.BuyVO;
import com.gticket.persistence.BuyDAO;
import com.gticket.util.Criteria;

@Service
public class BuyServiceImpl implements BuyService{

	@Autowired
	BuyDAO dao;
	
	@Override
	public int buyInsert(BuyVO bvo) {
	 return	dao.buyInsert(bvo);
	}
	
	
	@Override
	public List<BuyVO> adOrderList(Criteria cri) throws Exception {
		return dao.adOrderList(cri);
	}

	@Override
	public int adOrderListCount() throws Exception {
		return dao.adOrderListCount();
	}
}
