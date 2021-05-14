package com.gticket.service;

import java.util.List;
import java.util.Map;

import com.gticket.domain.CategoryVO;
import com.gticket.domain.EventVO;
import com.gticket.util.SearchCriteria;

public interface AdminEventService {
	
	//공연 등록
	public void insertEvent(EventVO vo) throws Exception;
	
	// 1차 카테고리 출력
	public List<CategoryVO> mainCGList() throws Exception;
		
	// 2차 카테고리 출력
	public List<CategoryVO> subCGList(String cg_code) throws Exception;
	
	// 검색조건에 해당하는 예매 개수 
	public int searchListCount(SearchCriteria cri) throws Exception;
	
	// 공연 리스트
	public List<EventVO> searchListEvent(SearchCriteria cri) throws Exception;
	
	// 공연 정보
	public EventVO eventDetail(int evt_num) throws Exception;

	// 공연 수정
	public void editEvent(EventVO vo) throws Exception;
		
	// 공연 삭제
	public void deleteEvent(int pdt_num) throws Exception;
		
	// 선택한 공연 수정
	public void editChecked(Map<String, Object> map) throws Exception;

	
	//-----예비----
	public void addevt_Discount(EventVO vo);
	
	// 재고 수정
	public void editStock(EventVO vo) throws Exception;
	
	
	
}
