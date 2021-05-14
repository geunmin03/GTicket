package com.gticket.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gticket.domain.EventVO;
import com.gticket.domain.MemberVO;
import com.gticket.service.AdminMemberService;
import com.gticket.service.MainService;
import com.gticket.util.Criteria;
import com.gticket.util.PageMaker;

@Controller
public class MainController {
	
	@Inject
	MainService service;
	
	@Inject
	AdminMemberService myservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,@ModelAttribute("cri") Criteria cri) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		
		List<EventVO> list = service.mainList(cri);
		model.addAttribute("eventList", list);
		
		 PageMaker pm = new PageMaker();
	      pm.setCri(cri);
	      int count = service.mainCount();
	      pm.setTotalCount(count);
	      
	      model.addAttribute("pm", pm);
		
		return "index";
	}
	@RequestMapping(value = "/myhome")
	   public ModelAndView myhome(ModelAndView mv) {
	      mv.setViewName("mynew/home");
	      return mv;
	   }
	@RequestMapping(value = "/myloginf")
	   public ModelAndView myloginf(ModelAndView mv) {
	      mv.setViewName("mynew/mylogin");
	      return mv;
	   }
	
	
	@RequestMapping(value = "/mylogin")
	public ModelAndView mylogin(HttpServletRequest request, ModelAndView mv, MemberVO vo) throws Exception{
		
		String pw = vo.getMb_pw();
		vo = myservice.memberDetail(vo.getMb_id());
		String msg = "";
		String url = "mynew/mylogin";
		if(vo != null) {
			if( pw.equals(vo.getMb_pw())) {
				// login 성공
				msg = vo.getMb_id() + "~님 안녕하세요."; 
				url = "mynew/home";
				request.getSession().setAttribute("loginID", vo.getMb_id());
				request.getSession().setAttribute("loginPW", vo.getMb_pw());
			} else {
				// pw오류 
				msg = "패스워드 오류입니다.";
			} 
		} else {
			// ID 오류 
			msg = "아이디 오류입니다.";
		}	
		mv.setViewName(url);
		mv.addObject("message",msg);
			 
		return mv;
	}
	
}
