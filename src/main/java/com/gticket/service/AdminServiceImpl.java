package com.gticket.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gticket.domain.AdminVO;
import com.gticket.dto.AdminDTO;
import com.gticket.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;

	@Inject
	private BCryptPasswordEncoder crptPassEnc;

	// 관리자 로그인
	@Override
	public AdminVO login(AdminDTO dto) throws Exception {

		AdminVO vo = dao.login(dto);

		System.out.println(vo.toString());
		// 로그인 정보와 일치하는 값이 존재하면,
		if (vo != null) {
			//

			dao.loginUpdate(dto.getAdmin_id());
		}

		return vo;
	}

}
