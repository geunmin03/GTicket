package com.gticket.service;

import java.util.List;

import com.gticket.domain.EventVO;
import com.gticket.util.Criteria;
import com.gticket.util.PageVO;
import com.gticket.util.SearchVO;

public interface EventService {

	// 게시판 등록기능
	public void insert(EventVO vo) throws Exception;

	// 게시글 목록 조회기능 (클라이언트에게 다시 많은 게시물을 반환해야 하기에 List로 리턴) 게시판의 10,20,30 게시물 숫자 변경 처리
	public List<EventVO> getEventList(SearchVO search) throws Exception;

	// 게시글 상세 조회기능 (단일 게시물BoardVO 리턴)
	public EventVO getArticle(int evt_num) throws Exception;

	// 게시글 수정기능
	public void update(EventVO vo) throws Exception;

	// 게시글 삭제 기능
	public void delete(int evt_num) throws Exception;
	
	// 게시물 조회수 상승 처리
	public void updateViewCnt(int evt_num)throws Exception;
}
