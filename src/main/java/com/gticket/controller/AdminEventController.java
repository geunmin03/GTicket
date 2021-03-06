package com.gticket.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gticket.domain.AdminVO;
import com.gticket.domain.BuyVO;
import com.gticket.domain.CategoryVO;
import com.gticket.domain.EventVO;
import com.gticket.domain.MemberVO;
import com.gticket.service.AdminEventService;
import com.gticket.service.AdminMemberService;
import com.gticket.service.BuyService;
import com.gticket.util.FileUtils;
import com.gticket.util.PageMaker;
import com.gticket.util.SearchCriteria;

@Controller
@RequestMapping("/admin/event/*")
public class AdminEventController {

//	  생성자
//	  setter
//	  필드
	
	@Autowired 
	private AdminEventService service;

	@Autowired
	private AdminMemberService memberService;

	@Autowired
	private BuyService buyService;
	
	@Resource(name = "uploadPath")
	private String uploadPath; // servlet-context.xml에 설정

	private static final Logger logger = LoggerFactory.getLogger(AdminEventController.class);

	/*
	 * 상품 리스트(페이징, 검색 조건 포함) 1. 검색 조건에 해당하는 상품리스트 2. PageMaker this.page = 1; // 현재
	 * 페이지 번호. this.perPageNum = 10; // 페이지에 출력 게시물 개수 url 이 처음 요청 받았을 경우
	 * SearchCriteria cri 기본값을 가지게 됨. searchType = null, keyword = null
	 */
	@RequestMapping(value = "eventList", method = RequestMethod.GET)
	public void eventList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info("공연리스트(eventList) 실행중");
		logger.info("=====cri : " + cri.toString());

		// 페이징기능이 적용된 상품데이타.(검색기능 포함 선택적)
		model.addAttribute("eventList", service.searchListEvent(cri));

		// PageMaker 생성
		PageMaker pm = new PageMaker(); // 1 2 3 4 5
		pm.setCri(cri); /// 페이징정보, 검색정보

		int count = service.searchListCount(cri);

		logger.info("=====일치하는 상품개수 :" + count);
		pm.setTotalCount(count);

		model.addAttribute("pm", pm);

	}

	/* 공연 상세(GET) */
	@RequestMapping(value = { "eventDetail", "eventInsert" }, method = RequestMethod.GET)
	public String eventInfoDetail(@ModelAttribute("cri") SearchCriteria cri,
			@RequestParam Map<String, String> allParams, Model model) throws Exception {
//		logger.info("1차 카테고리");
//		// 1차 카테고리 리스트 전송

		if (allParams.containsKey("evt_num")) {
			logger.info("=====eventInfoDetail() execute...");

			// 선택한 상품 정보의 날짜 변환
			EventVO vo = service.eventDetail(Integer.parseInt(allParams.get("evt_num")));

			// logger.info("=====dateFormat: " +
			// DateFormatUtils.kstToDate(vo.getPdt_date_sub()).toString());
			logger.info("=====Event Detail: " + vo.toString());

			// 썸네일 파일 이름 수정
			vo.setEvt_img(vo.getEvt_img().substring(vo.getEvt_img().lastIndexOf("_") + 1));

			logger.info("=====changed Event Detail: " + vo.toString());
			model.addAttribute("vo", vo);

			model.addAttribute("vtype", "u");
		} else {
			model.addAttribute("vtype", "i");
		}

		model.addAttribute("cateList", service.mainCGList());

		// PageMaker 생성 - 상품목록으로 돌아가기 클릭 시 이동하기 위해서
		PageMaker pm = new PageMaker();
		pm.setCri(cri);

		model.addAttribute("pm", pm);

		return "/admin/event/eventDetail";
	}

	@RequestMapping(value="payevent")
	public ModelAndView pay(BuyVO vo, EventVO evo, ModelAndView mv ,HttpServletRequest request) throws Exception {
		System.out.println("테스트=>"+vo);
		if (buyService.buyInsert(vo)>0) {
			
			// 이벤트 재고 수정
			evo.setEvt_num(vo.getEvt_num());
			evo.setEvt_discount(vo.getBuy_count());
			// 이벤트 discount는 판매수량, buy count는 현재 구매수량 -> event discount에 더함
			System.out.println("테스트 evo=>"+evo);
			service.editStock(evo);
			
			mv.addObject("message",vo.getMb_id()+"님 "+vo.getBuy_count()+"장 예매 입력 성공");
			mv.addObject("success","T");
			System.out.println("예매 입력 성공");
		
		}else {
			mv.addObject("message",vo.getMb_id()+"님 "+vo.getBuy_count()+"장 예매 입력 실패");
			mv.addObject("success","F");
			System.out.println("예매 입력 실패");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	/* 공연 예매(GET) */
	@RequestMapping(value = "eventBuy")
	public ModelAndView eventBuy(EventVO vo, ModelAndView mv, HttpServletRequest request) throws Exception {

		vo = service.eventDetail(vo.getEvt_num());

		mv.addObject("vo", vo);

		mv.setViewName("/admin/event/eventBuy");

		return mv;
	}

	/*
	 * 상품 등록(POST)
	 * 
	 * 1. 파일 업로드 : 일반적인 방식 <input type="file" /> , Ajax방식(Drag & Drop) 2. DB 작업
	 */
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String poductInsertPost(EventVO vo, RedirectAttributes rttr) throws Exception {

		logger.info("insertPOST() execute");
		logger.info(vo.toString());

		// pdt_img를 업로드 된 이미지 파일로 설정
		// 날짜폴더명/UUID특수한 문자열_실제파일명
		vo.setEvt_img(FileUtils.uploadFile(uploadPath, vo.getFile1().getOriginalFilename(), vo.getFile1().getBytes()));

		service.insertEvent(vo);// 상품테이블 데이터 삽입
		rttr.addFlashAttribute("msg", "INSERT_SUCCESS");

		// 상품리스트로 이동
		return "redirect:/admin/event/eventList";
	}

	/* 1차 카테고리에 따른 2차 카테고리 출력 */
	@ResponseBody
	@RequestMapping(value = "subCGList/{cg_code}", method = RequestMethod.GET)
	public ResponseEntity<List<CategoryVO>> subCGListPOST(@PathVariable("cg_code") String cg_code) {

		logger.info("===== 2차 카테고리....." + cg_code);

		// 2차 카테고리 리스트
		ResponseEntity<List<CategoryVO>> entity = null;
		try {
			entity = new ResponseEntity<List<CategoryVO>>(service.subCGList(cg_code), HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<CategoryVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*
	 * 파일 출력 저장된 파일을 가져와 반환
	 */
	@ResponseBody
	@RequestMapping(value = "displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		return FileUtils.getFile(uploadPath, fileName);
	}

	/* 상품 상세(ckEditor) - 파일 업로드 , MultipartFile upload: 이미 지정된 이름 */
	@PostMapping("imgUpload")
	public void imgUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		logger.info("imgUpload 실행");

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 설정
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {
			// 전송할 파일 정보를 가져옴
			String FileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 폴더 경로 설정
			String uploadPath = req.getSession().getServletContext().getRealPath("/"); // Servlet 절대경로
			uploadPath = uploadPath + "resources\\upload\\" + FileName;

			logger.info("uploadPath:" + uploadPath);

			// 출력 스트림 생성
			out = new FileOutputStream(new File(uploadPath));
			// 파일 쓰기
			out.write(bytes);

			printWriter = res.getWriter();
			String fileUrl = "/upload/" + FileName;

			// ckeditor 4에서 제공하는 형식
			printWriter.println("{\"filename\":\" " + FileName + " \" , \"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
			printWriter.flush(); // 전송 (return과 같은 역할: 클라이언트로 보냄)

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) { // 출력스트림
				try {
					out.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			if (printWriter != null) { // printWriter 종료
				try {
					printWriter.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}
	}

	/* 상품 수정(POST) */
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String eventEditPOST(EventVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("=====eventEditPOST() execute...");
		logger.info("=====editted info: " + vo.toString());
		logger.info("=====cri info: " + cri.toString());

		// 파일 사이즈로 새로운 파일 등록 여부 확인
		// 파일을 새로 등록하지 않은 경우, null이 아닌 비어있는 쓰레기 파일이 넘어옴
		if (vo.getFile1().getSize() > 0) {
			// 파일이 변경 된 경우, pdt_img를 업로드 된 파일 정보로 설정
			logger.info("=====file not zero size");
			vo.setEvt_img(
					FileUtils.uploadFile(uploadPath, vo.getFile1().getOriginalFilename(), vo.getFile1().getBytes()));
		}
		logger.info("=====changed info: " + vo.toString());
		service.editEvent(vo);
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("msg", "EDIT_SUCCESS");

		return "redirect:/admin/event/eventList";
	}

	/* 이미지 파일 삭제 */
	public void deleteFile(String fileName) {
		logger.info("delete FileName : " + fileName);

		FileUtils.deleteFile(uploadPath, fileName);
	}

	/* 상품 삭제(POST) */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String eventDeletePOST(SearchCriteria cri, @RequestParam("evt_num") int evt_num,
			@RequestParam("evt_img") String evt_img, RedirectAttributes rttr) throws Exception {
		logger.info("=====delete(POST) executed...");

		// 이미지 삭제
		deleteFile(evt_img);

		// 상품 삭제
		service.deleteEvent(evt_num);
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("msg", "DELETE_SUCCESS");
		// 시작했던 리스트 (선택한 페이지정보, 검색기능 사용)
		return "redirect:/admin/event/eventList";
	}

	/* 선택된 상품 수정 */
	@ResponseBody
	@RequestMapping(value = "editChecked", method = RequestMethod.POST)
	public ResponseEntity<String> editChecked(@RequestParam("checkArr[]") List<Integer> checkArr,
			@RequestParam("amountArr[]") List<Integer> amountArr, @RequestParam("buyArr[]") List<String> buyArr) {
		logger.info("===== editChecked() execute.....");

		ResponseEntity<String> entity = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < checkArr.size(); i++) {
				map.put("pdt_num", checkArr.get(i));
				map.put("pdt_amount", amountArr.get(i));
				map.put("pdt_buy", buyArr.get(i));

				service.editChecked(map);
			}
			entity = new ResponseEntity<String>(HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		entity = new ResponseEntity<String>(HttpStatus.OK);
		return entity;
	}

	/* 선택된 상품 삭제 */
	@ResponseBody
	@RequestMapping(value = "deleteChecked", method = RequestMethod.POST)
	public ResponseEntity<String> deleteChecked(@RequestParam("checkArr[]") List<Integer> checkArr,
			@RequestParam("imgArr[]") List<String> imgArr) {
		logger.info("===== deleteChecked() execute.....");

		ResponseEntity<String> entity = null;
		try {
			// 체크 된 상품의 이미지와 상품을 삭제
			for (int i = 0; i < checkArr.size(); i++) {
				deleteFile(imgArr.get(i));
				service.deleteEvent(checkArr.get(i));
			}

			entity = new ResponseEntity<String>(HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
