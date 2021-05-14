package com.gticket.persistence;

import java.util.List;
import java.util.Map;

import com.gticket.domain.CategoryVO;
import com.gticket.domain.MemberVO;
import com.gticket.util.SearchCriteria;


public interface AdminMemberDAO {
	
//	// 1차 카테고리 출력
//	public List<CategoryVO> mainCGList() throws Exception;
//	
//	// 2차 카테고리 출력
//	public List<CategoryVO> subCGList(String cg_code) throws Exception;
	
	// 검색조건에 해당하는 상품 개수 
	public int searchListCount(SearchCriteria cri) throws Exception;
	
	// 회원리스트
	public List<MemberVO> searchListMember(SearchCriteria cri) throws Exception;
	
	// 회원 정보
	public MemberVO memberDetail(String mb_id) throws Exception;
	
	// 상품 등록
	public void insertMember(MemberVO vo) throws Exception;
	
	// 상품 수정
	public void editMember(MemberVO vo) throws Exception;
		
	// 상품 삭제
	public void deleteMember(MemberVO vo) throws Exception;
		
//	// 선택한 상품 수정
//	public void editChecked(Map<String, Object> map) throws Exception;
	
}
