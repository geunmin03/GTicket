package com.gticket.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gticket.domain.CategoryVO;
import com.gticket.domain.MemberVO;
import com.gticket.persistence.AdminMemberDAO;
import com.gticket.util.SearchCriteria;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	AdminMemberDAO dao; 
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return null;
	}
	
//	// 1차 카테고리 출력
//	@Override
//	public List<CategoryVO> mainCGList() throws Exception {
//		return dao.mainCGList();
//	}
//	
//	// 2차 카테고리 출력
//	@Override
//	public List<CategoryVO> subCGList(String cg_code) throws Exception {
//		return dao.subCGList(cg_code);
//	}
	// 검색 조건에 맞는 예매 개수
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return dao.searchListCount(cri);
	}
	
	// 회원 리스트
	@Override
	public List<MemberVO> searchListMember(SearchCriteria cri) throws Exception {
		return dao.searchListMember(cri);
	}
	
	// 회원 정보
	@Override
	public MemberVO memberDetail(String mb_id) throws Exception {
		return dao.memberDetail(mb_id);
		
	}

	// 예매 등록
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		dao.insertMember(vo);
	}

	// 예매 수정
	@Override
	public void editMember(MemberVO vo) throws Exception {
		dao.editMember(vo);
	}

	// 예매 삭제
	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		dao.deleteMember(vo);
	}
//
//	// 선택한 예매 수정
//	@Override
//	public void editChecked(Map<String, Object> map) throws Exception {
//		dao.editChecked(map);
//	}
	
}
