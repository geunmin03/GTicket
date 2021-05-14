package com.gticket.persistence;

import java.util.List;
import java.util.Map;

import com.gticket.domain.EventVO;
import com.gticket.util.Criteria;

public interface MainDAO {
	
	// 상품리스트(페이지에 맞춰서)
	public List<EventVO> mainList(Criteria cri)throws Exception;
	
	//해당 카테고리의 상품 개수
	public int mainCount() throws Exception;
	
}
