package com.gticket.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gticket.domain.CategoryVO;
import com.gticket.domain.EventVO;
import com.gticket.persistence.AdminEventDAO;
import com.gticket.util.SearchCriteria;

@Service
public class AdminEventServiceImpl implements AdminEventService {
	
	@Autowired
	AdminEventDAO dao; 
	
	// 공연 등록
	@Override
	public void insertEvent(EventVO vo) throws Exception {
		dao.insertEvent(vo);
	}

	// 1차 카테고리 출력
	@Override
	public List<CategoryVO> mainCGList() throws Exception {
		return dao.mainCGList();
	}
	
	// 2차 카테고리 출력
	@Override
	public List<CategoryVO> subCGList(String cg_code) throws Exception {
		return dao.subCGList(cg_code);
	}
	// 검색 조건에 맞는 공연 개수
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return dao.searchListCount(cri);
	}
	
	// 공연 리스트
	@Override
	public List<EventVO> searchListEvent(SearchCriteria cri) throws Exception {
		return dao.searchListEvent(cri);
	}
	// 공연 정보
	@Override
	public EventVO eventDetail(int evt_num) throws Exception {
		return dao.eventDetail(evt_num);
	}

	// 공연 수정
	@Override
	public void editEvent(EventVO vo) throws Exception {
		dao.editEvent(vo);
	}

	// 공연 삭제
	@Transactional
	@Override
	public void deleteEvent(int evt_num) throws Exception {
		dao.deleteEvent(evt_num);
	}

	// 선택한 공연 수정
	@Override
	public void editChecked(Map<String, Object> map) throws Exception {
		dao.editChecked(map);
	}

	@Override
	public void addevt_Discount(EventVO vo) {
		dao.addevt_Discount(vo);
	}

	// 재고 수정
		@Override
		public void editStock(EventVO vo) throws Exception {
			dao.editStock(vo);
		}
	
}
