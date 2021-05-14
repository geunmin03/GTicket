package com.gticket.service;

import com.gticket.domain.AdminVO;
import com.gticket.dto.AdminDTO;

public interface AdminService {
	
	//로그인
	public AdminVO login(AdminDTO dto) throws Exception;
	
	
}
