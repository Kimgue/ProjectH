package com.hungpick.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hungpick.dto.Criteria;
import com.hungpick.dto.Notice;
import com.hungpick.dto.PageMaker;
import com.hungpick.service.INoticeService;

@Controller
public class NoticeController {

	@Autowired
	private INoticeService notice;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	/*--------------------- 공지사항 등록 페이지로 이동 ---------------------*/
	@RequestMapping("noticeinsertN")
	public void noticeinsertN(Model model) {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("date", time1);
	}

	// ----------------------------------------공지사항-----------------------------//

	@SuppressWarnings("unused")
	@RequestMapping("Notice")
	public String listPage(Model model, @Param("adminCode") String adminCode, String noticeCode,
			@ModelAttribute("cri") Criteria cri, HttpSession session) throws Exception {
		logger.info("get list page");
		String memberCode = (String) session.getAttribute("memberCode");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		
		model.addAttribute("adminCode", adminCode);
		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		
		return "NoticePage";	
			
	}
	
	@RequestMapping("AdminNoticelist")
	public String admin(Model model,  String noticeCode, @ModelAttribute("cri") Criteria cri,HttpSession session)
			throws Exception {
		logger.info("list page");
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		
		String adminCode = (String)session.getAttribute("adminCode");
		System.out.println(adminCode);
		model.addAttribute("adminCode", adminCode);
		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("noticecode", notice.noticeCode(adminCode));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		

		return "NoticeSWD";

	}

	@RequestMapping("NoticeMember")
	public String listPage1(Model model, String noticeCode, @ModelAttribute("cri") Criteria cri,HttpSession session)
			throws Exception {
		logger.info("list page");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		String adminCode = (String)session.getAttribute("adminCode"); 
		
		
		model.addAttribute("adminCode", adminCode);
		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		return "NoticePage";

	}

	@RequestMapping("view2")
	public String view2(Model model, String adminCode, String noticeCode,HttpSession session) throws Exception {

		model.addAttribute("noticecontent", notice.sltOneNoice(adminCode, noticeCode));

		return "Noticeview2";
	}
	@RequestMapping("noticeandminview")
	public void adminview2(Model model, String adminCode, String noticeCode,HttpSession session) throws Exception {

		model.addAttribute("noticecontent", notice.sltOneNoice(adminCode, noticeCode));

	}
	
	/*-------------------------Notice insert 공지사항 -----------------*/
	@RequestMapping("Noticeinsert")
	public String insertNoticeC(Notice noti,@ModelAttribute("cri") Criteria cri,HttpSession session,Model model,String noticeCode) throws Exception {
		
		notice.insert(noti);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		
		String adminCode = (String)session.getAttribute("adminCode");
		System.out.println(adminCode);
		model.addAttribute("adminCode", adminCode);
		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("noticecode", notice.noticeCode(adminCode));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("person", notice.sltOneNoice(adminCode, noticeCode));
		
		return "redirect:/AdminNoticelist";

	}
	
	/*---------------------------공지사항 수정전 확인 --------------------------*/
	@RequestMapping("Noticeupdatepage")
	public String Noticeupdatelist(Model model, String adminCode ,String noticeCode,HttpSession session) throws Exception {
		logger.info("updatelist");
		 
		adminCode = (String)session.getAttribute("adminCode");
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("date", time1);
		model.addAttribute("person", notice.sltOneNoice(adminCode, noticeCode));

		return "Noticeupdatelist";
	}
	

	/*---------------------------공지사항 수정 --------------------------*/
	@RequestMapping("Noticeupdate")
	public String Noticeupdate(Model model, String adminCode, String noticeCode, Notice noti, Criteria cri,HttpSession session)
			throws Exception {
		logger.info("update해서 간다");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		
		
		notice.update(noti);
		
		model.addAttribute("listpage", notice.listPage(cri));
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("date", time1);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		return "redirect:/AdminNoticelist";

	}
	
	/*----------------------------공지사항 삭제-----------------------------*/
	@RequestMapping("Noticedelete")
	public String Noticedelete(Model model,  String noticeCode, Notice noti, Criteria cri,HttpSession session)
			throws Exception {
		
		String adminCode = (String)session.getAttribute("adminCode");
		
		
		notice.delete(adminCode, noticeCode);

		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time1 = format1.format(date);
		
		model.addAttribute("adminCode", adminCode);
		model.addAttribute("date", time1);
		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		return "redirect:/AdminNoticelist";
	}
}
