package com.gticket.persistence;

import java.util.List;
import java.util.Map;

import com.gticket.domain.CategoryVO;
import com.gticket.domain.EventVO;
import com.gticket.util.SearchCriteria;


public interface AdminEventDAO {
	
	// 상품 등록
	public void insertEvent(EventVO vo) throws Exception;
	
	// 1차 카테고리 출력
	public List<CategoryVO> mainCGList() throws Exception;
	
	// 2차 카테고리 출력
	public List<CategoryVO> subCGList(String cg_code) throws Exception;
	
	// 검색조건에 해당하는 상품 개수 
	public int searchListCount(SearchCriteria cri) throws Exception;
	
	// 상품리스트
	public List<EventVO> searchListEvent(SearchCriteria cri) throws Exception;
	
	// 상품 정보
	public EventVO eventDetail(int evt_num) throws Exception;
	
	// 상품 수정
	public void editEvent(EventVO vo) throws Exception;
		
	// 상품 삭제
	public void deleteEvent(int evt_num) throws Exception;
		
	// 선택한 상품 수정
	public void editChecked(Map<String, Object> map) throws Exception;

	public void addevt_Discount(EventVO vo);
	
	// 재고 수정
	public void editStock(EventVO vo) throws Exception;
	
}
