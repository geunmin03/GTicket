package com.gticket.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gticket.service.MainService;
import com.gticket.domain.EventVO;
import com.gticket.persistence.MainDAO;
import com.gticket.util.Criteria;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO dao;
	
	@Override
	public List<EventVO> mainList(Criteria cri) throws Exception {
		return dao.mainList(cri);
	}

	@Override
	public int mainCount() throws Exception {
		return dao.mainCount();
	}

}
