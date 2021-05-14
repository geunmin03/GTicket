package com.gticket.controller;

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

import com.gticket.domain.CategoryVO;
import com.gticket.domain.MemberVO;
import com.gticket.service.AdminMemberService;
import com.gticket.util.FileUtils;
import com.gticket.util.PageMaker;
import com.gticket.util.SearchCriteria;

@Controller
@RequestMapping("/admin/member/*")
public class AdminMemberController {

	@Autowired
	private AdminMemberService service;
	
//	@Resource(name="uploadPath")
//	private String uploadPath; // servlet-context.xml에 설정
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	 
    /* 상품 리스트(페이징, 검색 조건 포함)
     * 1. 검색 조건에 해당하는 상품리스트
     * 2. PageMaker 
     * this.page = 1; // 현재 페이지 번호. this.perPageNum = 10; // 페이지에 출력 게시물 개수
     * url 이 처음 요청 받았을 경우  SearchCriteria cri 기본값을 가지게 됨. 
     * searchType = null,  keyword = null
     */
	@RequestMapping(value="memberList", method=RequestMethod.GET)
	public String memberList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info("회원리스트(memberList) 실행중");
		logger.info("=====cri : " + cri.toString());
		
		// 페이징기능이 적용된 상품데이타.(검색기능 포함 선택적)
		model.addAttribute("memberList", service.searchListMember(cri)); 
		
		// PageMaker 생성
		PageMaker pm = new PageMaker();  //  1  2  3   4   5
		pm.setCri(cri);  /// 페이징정보, 검색정보


		int count = service.searchListCount(cri);


		logger.info("=====일치하는 회원개수 :" + count);
		pm.setTotalCount(count);
		
		model.addAttribute("pm", pm);
		
		return "/admin/member/memberList";
	}

	/* 상품 상세정보 페이지 읽기 */
	@RequestMapping(value="memberDetail", method=RequestMethod.GET)
	public String memberInfoDetail(@ModelAttribute("cri") SearchCriteria cri,
								@RequestParam Map<String, String> allParams, Model model) throws Exception{

		if (allParams.containsKey("mb_id")) {
			logger.info("=====memberDetail GET() execute...");
				
			logger.info(allParams.get("mb_id"));
			// 선택한 상품 정보의 날짜 변환
			//				if(mb_id) {
			//					
			//				}
			MemberVO vo = service.memberDetail(allParams.get("mb_id"));
			
			//logger.info("=====dateFormat: " + DateFormatUtils.kstToDate(vo.getPdt_date_sub()).toString());
			logger.info("=====Member Detail: "+ vo.toString());
			
			// 썸네일 파일 이름 수정
			//				vo.setPdt_img(vo.getPdt_img().substring(vo.getPdt_img().lastIndexOf("_")+1));
			
			logger.info("=====changed Member Detail: "+ vo.toString());
			model.addAttribute("vo", vo);
			
			model.addAttribute("vtype", "u");
		}else {
			model.addAttribute("vtype", "i");
		}
		
		// PageMaker 생성 - 상품목록으로 돌아가기 클릭 시 이동하기 위해서
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		
		return "/admin/member/memberDetail";
	}
		
	/* 
	 * 상품 등록(POST) 
	 * 
	 * 1. 파일 업로드 : 일반적인 방식 <input type="file" /> , Ajax방식(Drag & Drop)
	 * 2. DB 작업
	 */
	@RequestMapping(value = "/insertf")
	   public ModelAndView insertf(ModelAndView mv) {
	      mv.setViewName("member/join");
	      return mv;
	   }
	// 작업중 >>>
	@RequestMapping(value ="insert", method = RequestMethod.POST)
	public String memberInsert(MemberVO vo, RedirectAttributes rttr) throws Exception{
		
		logger.info("insertPOST() execute");
		logger.info(vo.toString());
				
		service.insertMember(vo);//상품테이블 데이터 삽입
		rttr.addFlashAttribute("msg", "INSERT_SUCCESS");
		
		// 상품리스트로 이동
		return "redirect:/admin/member/memberList";
	}

	/* 상품 수정(POST) */
	@RequestMapping(value="edit", method=RequestMethod.POST)
	public String memberEdit(MemberVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("=====productEditPOST() execute...");
		logger.info("=====editted info: "+vo.toString());
		logger.info("=====cri info: "+cri.toString());

		service.editMember(vo);
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("msg", "EDIT_SUCCESS");
		
		return "redirect:/admin/member/memberList";
	}
	
//	/* 
//	 * 상품 수정(GET)
//	 * 
//	 * # JSP로 전달
//	 * 1. 선택한 상품 정보
//	 * 2. 1차카테고리 리스트
//	 * 3. 현재 선택된 2차 카테고리 리스트
//	 * 4. PageMaker
//	 * 5. 원래 저장되어 있던 파일명
//	 */
//	@RequestMapping(value="edit", method=RequestMethod.GET)
//	public void productEditGET(@ModelAttribute("cri") SearchCriteria cri, 
//								@RequestParam("pdt_num") int pdt_num, Model model) throws Exception{
//		
//		logger.info("=====productEditGET() execute...");
//		
//		// 선택한 상품 정보의 날짜 변환
//		ProductVO vo = service.readProduct(pdt_num);
//		//vo.setPdt_date_sub(DateFormatUtils.kstToDate(vo.getPdt_date_sub()));		
//		//vo.setPdt_date_up(DateFormatUtils.kstToDate(vo.getPdt_date_up()));		
//		
//		//logger.info("=====dateFormat: " + DateFormatUtils.kstToDate(vo.getPdt_date_sub()).toString());
//		logger.info("=====Product Detail: "+ vo.toString());
//		
//		List<CategoryVO> subCateList = service.subCGList(vo.getCg_code_prt());
//		String originFile = vo.getPdt_img().substring(vo.getPdt_img().lastIndexOf("_")+1);
//		
//		model.addAttribute("vo", vo);
//		model.addAttribute("originFile", originFile);
//		model.addAttribute("cateList", service.mainCGList());
//		model.addAttribute("subCateList", service.subCGList(vo.getCg_code_prt()));
//		
//		// PageMaker 생성 - 상품목록으로 돌아가기 클릭 시 이동하기 위해서
//		PageMaker pm = new PageMaker();
//		pm.setCri(cri);
//		
//		model.addAttribute("pm", pm);
//	}
//	

//	
	/* 상품 삭제(POST) */
	@RequestMapping(value="memberDelete")
	public String productDeletePOST(SearchCriteria cri, MemberVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("=====delete(POST) executed...");
		
	
		// 상품 삭제
		service.deleteMember(vo);
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("msg", "DELETE_SUCCESS");
		// 시작했던 리스트 (선택한 페이지정보, 검색기능 사용)
		return "redirect:/admin/member/memberList";
	}


//	/* 선택된 상품 삭제 */
//	@ResponseBody
//	@RequestMapping(value="deleteChecked", method=RequestMethod.POST)
//	public ResponseEntity<String> deleteChecked(@RequestParam("checkArr[]") List<Integer> checkArr,
//												@RequestParam("imgArr[]") List<String> imgArr) {
//		logger.info("===== deleteChecked() execute.....");
//		
//		ResponseEntity<String> entity = null;
//		try {
//			// 체크 된 상품의 이미지와 상품을 삭제
//			for(int i=0; i<checkArr.size(); i++) {
//				deleteFile(imgArr.get(i));
//				service.deleteProduct(checkArr.get(i));
//			}
//			
//			entity = new ResponseEntity<String>(HttpStatus.OK);
//			
//		} catch(Exception e){
//			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//		}
//		return entity; 
//	}
}
