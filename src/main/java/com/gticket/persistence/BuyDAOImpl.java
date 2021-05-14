package com.gticket.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gticket.domain.BuyVO;
import com.gticket.domain.OrderVO;
import com.gticket.util.Criteria;

@Repository
public class BuyDAOImpl implements BuyDAO{
	@Autowired
	SqlSession session;
	public final static String NS="com.gticket.mappers.BuyMapper";
	
	@Override
	public int buyInsert(BuyVO bvo) {
		return session.insert(NS + ".buyInsert", bvo);
	}

	@Override
	public List<BuyVO> adOrderList(Criteria cri) throws Exception {
		return session.selectList(NS+".adOrderList", cri);
	}

	@Override
	public int adOrderListCount() throws Exception {
		return session.selectOne(NS+".adOrderListCount");
	}
	
}
