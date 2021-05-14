package com.gticket.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gticket.domain.AdminVO;
import com.gticket.dto.AdminDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSession session;
	public final static String NS="com.gticket.mappers.AdminMapper";
	
	//로그인
	@Override
	public AdminVO login(AdminDTO dto) throws Exception {
		AdminVO resultVo = session.selectOne(NS+".login", dto);
		System.out.println(resultVo.toString());
		return resultVo;
	}
	//최근 로그인 시간 업데이트
	@Override
	public void loginUpdate(String admin_id) throws Exception {
		session.update(NS+".loginUpdate",admin_id);

	}

}
