package com.gticket.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gticket.domain.EventVO;
import com.gticket.util.Criteria;
import com.gticket.util.PageVO;
import com.gticket.util.SearchVO;
@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	private SqlSession session;
	
	public final static String NS="com.gticket.mappers.EventMapper";
	
	@Override
	public void insert(EventVO vo) throws Exception {
	 session.insert(NS+".insert",vo);
	}
	@Override
	public List<EventVO> getEventList(SearchVO search) throws Exception {
		return session.selectList(NS+".getEventList",search);
	}
	@Override
	public EventVO getArticle(int brd_num) throws Exception {
		return session.selectOne(NS+".getArticle", brd_num);
	}

	@Override
	public void update(EventVO vo)  throws Exception{
		session.update(NS+".update", vo);
	}

	@Override
	public void delete(int brd_num) throws Exception {
		session.delete(NS+".delete", brd_num);
	}
	@Override
	public void updateViewCnt(int brd_num) throws Exception {
		session.update(NS+".updateViewCnt", brd_num);
		
	}
	

}
