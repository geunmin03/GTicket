package com.gticket.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gticket.domain.EventVO;
import com.gticket.util.Criteria;

@Repository
public class MainDAOImpl implements MainDAO {

	
	@Inject
	private SqlSession session;
	public final static String NS ="com.gticket.mappers.mainMapper";
	
	@Override
	public List<EventVO> mainList(Criteria cri) throws Exception {	
		return session.selectList(NS+".mainList", cri);
	}

	@Override
	public int mainCount() throws Exception {	
		return session.selectOne(NS+".mainCount");
	}

}
