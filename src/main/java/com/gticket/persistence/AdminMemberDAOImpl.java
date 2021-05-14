package com.gticket.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gticket.domain.CategoryVO;
import com.gticket.domain.MemberVO;
import com.gticket.util.SearchCriteria;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	
	@Autowired
	SqlSession session;
	public final static String NS="com.gticket.mappers.AdminMemberMapper";
	
//	// 1차 카테고리
//	@Override
//	public List<CategoryVO> mainCGList() throws Exception {
//		return session.selectList(NS+".mainCGList");
//	}
//	
//	// 1차 카테고리에 따른 2차 카테고리
//	@Override
//	public List<CategoryVO> subCGList(String cg_code) throws Exception {
//		return session.selectList(NS+".subCGList", cg_code);
//	}
	
	// 검색조건에 해당하는 상품 개수 
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return session.selectOne(NS+".searchListCount", cri);
	}
	
	// 상품 리스트
	@Override
	public List<MemberVO> searchListMember(SearchCriteria cri) throws Exception {
		return session.selectList(NS+".searchListMember", cri);
	}
	
	// 회원 정보
	@Override
	public MemberVO memberDetail(String mb_id) throws Exception {
		return session.selectOne(NS+ ".memberDetail", mb_id);
	}
	
	// 상품 등록
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		session.insert(NS+".insertMember", vo);		
	}
	
	// 상품 수정
	@Override
	public void editMember(MemberVO vo) throws Exception {
		session.update(NS+".editMember", vo);
	}
	
	// 상품 삭제
	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		session.delete(NS+".deleteMember", vo);
	}
//	
//	// 선택한 상품 수정
//	@Override
//	public void editChecked(Map<String, Object> map) throws Exception {
//		session.update(NS+ ".editChecked", map);	
//	}
}
