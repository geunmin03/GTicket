package com.gticket.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gticket.domain.CategoryVO;
import com.gticket.domain.EventVO;
import com.gticket.util.SearchCriteria;
@Repository
public class AdminEventDAOImpl implements AdminEventDAO {
	
	@Autowired
	SqlSession session;
	public final static String NS="com.gticket.mappers.AdminEventMapper";
	
	// 상품 등록
	@Override
	public void insertEvent(EventVO vo) throws Exception {
		session.insert(NS+".insertEvent", vo);		
	}
	
	// 1차 카테고리
	@Override
	public List<CategoryVO> mainCGList() throws Exception {
		return session.selectList(NS+".mainCGList");
	}
	
	// 1차 카테고리에 따른 2차 카테고리
	@Override
	public List<CategoryVO> subCGList(String cg_code) throws Exception {
		return session.selectList(NS+".subCGList", cg_code);
	}
	
	// 검색조건에 해당하는 상품 개수 
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return session.selectOne(NS+".searchListCount", cri);
	}
	
	// 상품 리스트
	@Override
	public List<EventVO> searchListEvent(SearchCriteria cri) throws Exception {
		return session.selectList(NS+".searchListEvent", cri);
	}
	// 상품 정보
	@Override
	public EventVO eventDetail(int evt_num) throws Exception {
		return session.selectOne(NS+ ".eventDetail", evt_num);
	}
	
	// 상품 수정
	@Override
	public void editEvent(EventVO vo) throws Exception {
		session.update(NS+".editEvent", vo);
	}
	
	// 상품 삭제
	@Override
	public void deleteEvent(int evt_num) throws Exception {
		session.delete(NS+".deleteEvent", evt_num);
	}
	
	// 선택한 상품 수정
	@Override
	public void editChecked(Map<String, Object> map) throws Exception {
		session.update(NS+ ".editChecked", map);	
	}

	@Override
	public void addevt_Discount(EventVO vo) {
		session.update(NS+ ".addevt_Discount", vo);
	}
	
	@Override
	// 재고 수정
	public void editStock(EventVO vo) throws Exception {
		session.update(NS+ ".editStock", vo);
	}
	
}
