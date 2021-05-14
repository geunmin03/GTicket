package com.gticket.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gticket.domain.BuyVO;
import com.gticket.service.AdminOrderService;
import com.gticket.service.BuyService;
import com.gticket.service.OrderService;
import com.gticket.util.Criteria;
import com.gticket.util.PageMaker;
import com.gticket.util.SearchCriteria;

@Controller
@RequestMapping("/admin/order/*")
public class AdminOrderController {

	@Autowired
	AdminOrderService service;
	
	@Autowired
	BuyService bservice;
	
	@Inject
	private OrderService orderService;

	private static final Logger logger = LoggerFactory.getLogger(AdminOrderController.class);

	// 주문현황
	@GetMapping("orderList")
	public void adOrderList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception  {
		
			logger.info("=====cri : " + cri.toString());

			// 페이징기능이 적용된 상품데이타.(검색기능 포함 선택적)
			model.addAttribute("buyList", bservice.adOrderList(cri));

			// PageMaker 생성
			PageMaker pm = new PageMaker(); // 1 2 3 4 5
			pm.setCri(cri); /// 페이징정보, 검색정보

			int count = bservice.adOrderListCount();

			logger.info("=====일치하는 상품개수 :" + count);
			pm.setTotalCount(count);

			model.addAttribute("pm", pm);

		}
		/////////////////////////////////////////////
		
	@RequestMapping(value = "/orderinsertf")
	   public ModelAndView orderinsertf(ModelAndView mv) throws Exception {
		// 공연 리스트 select 넣어주기
		mv.addObject("eventList", service.eventList()); 
	    mv.setViewName("/admin/order/orderinsert");
	      return mv;
	   }
//	// 배송현황 수정
//	@PostMapping("modify")
//	public ResponseEntity<String> deliveryModify(int odr_code, String delivery) {
//
//		logger.info("modify실행중");
//
//		ResponseEntity<String> entity = null;
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("odr_code", odr_code);
//		map.put("delivery", delivery);
//
//		try {
//			service.deliveryModify(map);
//			entity = new ResponseEntity<String>(HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}

	// 예매 상세 조회
	@RequestMapping(value = "orderRead", method = RequestMethod.GET)
	public void readOrderGET(int odr_code, Model model, HttpSession session) throws Exception {

		logger.info("readOrderGET 실행중");
		model.addAttribute("orderList", orderService.readOrder(odr_code));
		model.addAttribute("order", orderService.getOrder(odr_code));
		
	}
	
	// 예매 하기 
	// 예매 수정
	// 예매 삭제
	
}
