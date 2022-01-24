package com.hungpick.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.hungpick.dto.Question;
import com.hungpick.service.INoticeService;
import com.hungpick.service.IQuestionSerivce;
<<<<<<< HEAD
=======




>>>>>>> branch 'master' of https://github.com/Kimgue/ProjectH.git


@Controller
public class UserController {

	@Autowired
	private INoticeService notice;

	@Autowired
	private IQuestionSerivce  question;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/")
	public String home(Model model,String memberCode) {
		logger.info("home called ==========");
		
				
		return "redirect:/main.jsp";
	}

	@RequestMapping("Question")
	public String QA(Model model,String memberCode,@ModelAttribute("cri") Criteria cri) throws Exception {
		logger.info("Q&A called ==========");
		
		/*List<Question> list = question.first(memberCode);*/

		
		
		
		List<Question> list = question.listPage(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount());
		int currentPage = cri.getPage();
		Question as = question.first1(memberCode);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
			
		model.addAttribute("f", list);
		model.addAttribute("b", as);
	
		
		return "Questionlist";
	}

	@RequestMapping("view1")
	public String view1(Model model,String memberCode,String qstnCode) {
		logger.info("insertMem called ==========");
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("v", question.select(memberCode, qstnCode));
		System.out.println(question.select(memberCode, qstnCode));	
		model.addAttribute("date", time1 );
	
		
		return "Questionupdatelist";
	}

	@RequestMapping("insertQnA")
	public String insertUser(Model model,String memberCode,String qstnCode) throws Exception {
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		
		
		Question as = question.first1(memberCode);
		
		model.addAttribute("b", as);
		System.out.println("memberCode " + as);
		model.addAttribute("date", time1 );
		
		
		
		return "QuestioninsertQ";
	}

	@RequestMapping("Questioninsert")
	public String updateView(Question qes,Model model,String memberCode, Criteria cri) throws Exception {
		logger.info("insertCn");
		
		
		/*List<Question> list = question.first(memberCode);*/
		List<Question> list = question.listPage(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount());
		int currentPage = cri.getPage();
		question.insert(qes);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		
		Question as = question.first1(memberCode);
		model.addAttribute("f", list);
		model.addAttribute("b", as);
		
		return "Questionlist";
	}

	@RequestMapping("updatelist")
	public String updatelist(Model model,String memberCode,String qstnCode) throws Exception {
		logger.info("updatelist");
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		Question person = question.select(memberCode, qstnCode);
		model.addAttribute("v", person);
		System.out.println(person);
		model.addAttribute("date", time1 );
		
		return "Questionupdatelist";
	}

	@RequestMapping("QuestionUpdate")
	public String updateE(Model model,String memberCode,Question qes, Criteria cri) throws Exception {
		logger.info("updatelist");
		
		
		
		/*List<Question> list = question.first(memberCode);*/
		List<Question> list = question.listPage(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount());
		int currentPage = cri.getPage();
		question.update(qes);		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		Question as = question.first1(memberCode);
		model.addAttribute("f", list);
		model.addAttribute("b", as);

		
		return "Questionlist";
	}
	@RequestMapping("Questiondelete")
	public String delete(Model model,String memberCode,String qstnCode,Question qes, Criteria cri) throws Exception {
		
		
		
		/*List<Question> list = question.first(memberCode);*/
		List<Question> list = question.listPage(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount());
		int currentPage = cri.getPage();
		question.delete(memberCode, qstnCode);	
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		System.out.println(list);
		Question as = question.first1(memberCode);
			
		model.addAttribute("f", list);
		model.addAttribute("b", as);
		
		return "Questionlist";
		
	}
	

	
	
	@RequestMapping("Notice")
	public String listPage(Model model,String adminCode,String noticeCode,Criteria cri) throws Exception {
		logger.info("get list page");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		
		model.addAttribute("list", notice.listPage(cri));
		model.addAttribute("a", notice.sltone(adminCode));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		return "NoticeSWD";
	
	}

	@RequestMapping("view2")
	public String view2(Model model,String adminCode,String noticeCode) throws Exception {
		
		model.addAttribute("s", notice.select(adminCode,noticeCode));
		
		return "Noticeview2";
	}
	
	@RequestMapping("insertNotice")
	public String insertNotice(Model model,String adminCode) throws Exception {
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		
		model.addAttribute("date", time1 );
		model.addAttribute("s", notice.sltone(adminCode));
		
		return "NoticeinsertN";
	}
	@RequestMapping("insertNc")
	public String insertNoticeC(Model model,String adminCode,String noticeCode,Notice noti,Criteria cri) throws Exception {
		
		notice.insert(noti);
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		model.addAttribute("list", notice.listPage(cri));
		model.addAttribute("a", notice.sltone(adminCode));
		model.addAttribute("date", time1 );
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		return "NoticeSWD";
		
	}
	@RequestMapping("Noticeupdatelist")
	public String Noticeupdatelist(Model model,String adminCode,String noticeCode) throws Exception {
		logger.info("updatelist");
		
		
		Notice person =   notice.select(adminCode, noticeCode);
		model.addAttribute("person", person);
		System.out.println(person);
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("date", time1 );
		
		return "Noticeupdatelist";
	}
	
	
	@RequestMapping("Noticeupdate")
	public String Noticeupdate(Model model,String adminCode,String noticeCode,Notice noti,Criteria cri) throws Exception {
		logger.info("update해서 간다");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		
		notice.update(noti);
		model.addAttribute("list", notice.listPage(cri));
		model.addAttribute("a", notice.sltone(adminCode));
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("date", time1 );
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		
		return "NoticeSWD";
		
	}
	@RequestMapping("Noticedelete")
	public String Noticedelete(Model model,String adminCode,String noticeCode,Notice noti,Criteria cri) throws Exception {
		
		notice.delete(adminCode, noticeCode);
		model.addAttribute("list",notice.listPage(cri));
		
		return "NoticeSWD";
	}
	
	
	
}
