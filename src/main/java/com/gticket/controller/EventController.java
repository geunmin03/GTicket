package com.gticket.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gticket.domain.EventVO;
import com.gticket.domain.ProductVO;
import com.gticket.service.EventService;
import com.gticket.util.Criteria;
import com.gticket.util.PageMaker;
import com.gticket.util.PageMakerVO;
import com.gticket.util.PageVO;
import com.gticket.util.SearchVO;

@Controller
@RequestMapping("/event/*")
public class EventController {

	@Autowired
	private EventService service;
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	
	// 게시판 목록 불러오기 요청
	@GetMapping("list")
	public String getArticleList(Model model, @ModelAttribute("search") SearchVO search) throws Exception{
		
		logger.info("getArticleList 실행중");
		
		List<EventVO> list = service.getEventList(search);
		logger.info("rowStart 값은:" +search.getBoardRowStart());
		logger.info("rowEnd 값은:" +search.getBoardRowEnd());
		logger.info("event/list get->> result:" + list.size());
		logger.info("parameter(페이지번호):" + search.getPage() + "번호");
		list.forEach(vo-> System.out.println(vo));
		model.addAttribute("vo", list);
		
		PageMakerVO pm = new PageMakerVO();
		pm.setPaging(search);
		model.addAttribute("pm", pm);
		System.out.println(pm);
		return "/event/list";
	}
	
//	@RequestMapping(value = "/Genre/GenreMain", method = RequestMethod.GET)
//	public String genreMain(Locale locale, Model model,@ModelAttribute("cri") Criteria cri) throws Exception {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("rowStart", cri.getRowStart());
//		map.put("rowEnd", cri.getRowEnd());
//		
//		List<ProductVO> list = service.mainList(cri);
//		model.addAttribute("productList", list);
//		
//		 PageMaker pm = new PageMaker();
//	      pm.setCri(cri);
//	      int count = service.mainCount();
//	      pm.setTotalCount(count);
//	      
//	      model.addAttribute("pm", pm);
//
//		
//		return "index";
//	}
	
//	// 게시글 작성 페이지 요청
//	@GetMapping("write")
//	public void write() {
//		logger.info("/board/write => get 실행중");
//	}
//	
//	// 게시글 DB등록 요청
//	@PostMapping("write")
//	public String write(BoardVO vo, RedirectAttributes rttr) throws Exception {
//		logger.info("/board/write => post 실행중");
//		logger.info("파라미터:"+vo);
//		service.insert(vo);
//		rttr.addAttribute("msg", "regSuccess");
//		
//		return "redirect:/board/list";
//	}
//	
//	// 게시물 상세 조회 요청
//	// PageVO paging 파라미터를 가지고 와서 content에 뿌려준다(기존의 페이징 정보를 content에 줘서 내용페이지에서 목록페이지로 갈떄 페이지 정보를 뿌려주기 위함)
//	@GetMapping("content/{brd_num}")
//	public String getArticle(@PathVariable("brd_num") int brd_num, Model model,@ModelAttribute("p") SearchVO search) throws Exception {
//		logger.info("getArticle 실행중");
//		service.updateViewCnt(brd_num);
//		service.getArticle(brd_num);
//		//brd_num를 입력하기 위해 파라미터에서 brd_num를 받음. list.jsp에서 content.jsp의 해당 번호로 가는 uri를 입력
//		//보통은 '/board/content?brd_num=${brd_num}'로 받으나
//		//'/board/content/${b.brd_num}${param.page == null ? pc.makeURI(1) : pc.makeURI(param.page)}' 새로운 방식 도입
//		logger.info("getArticle 파라미터" + service.getArticle(brd_num));
//		model.addAttribute("vo", service.getArticle(brd_num));
//		return "/board/content";
//	}
//	
//	// 게시판 삭제기능
//	@PostMapping("delete")
//	public String delete(int brd_num, RedirectAttributes rttr, @ModelAttribute("p") PageVO paging) throws Exception {
//		logger.info("delete 실행중");
//		logger.info("brd_num"+brd_num);
//		service.delete(brd_num);
//		rttr.addFlashAttribute("msg", "delSuccess");
//		// 삭제 후 redirect시에 페이지 정보 가지고 가게
//		rttr.addAttribute("page", paging.getPage());
//		rttr.addAttribute("countPerPage", paging.getCountPerPage());
//		return "redirect:/board/list";
//	}
//	
//	// 수정처리get
//	@GetMapping("modify")
//	public String modify(int brd_num,Model model, @ModelAttribute("p") PageVO paging ) throws Exception {
//		logger.info("modify 실행중");
//		
//		BoardVO vo = service.getArticle(brd_num);
//		model.addAttribute("vo", vo);
//		return "/board/modify";
//	}
//	
//	//게시글 수정 요청
//	@PostMapping("modify")
//	public String modify(BoardVO vo,RedirectAttributes rttr) throws Exception {
//		logger.info("modify post 실행중");
//		logger.info("수정 정보 요청:" + vo);
//		service.update(vo);
//		rttr.addAttribute("msg", "modSuccess");
//		return"redirect:/board/content/"+vo.getBrd_num();
//	}
	

}
