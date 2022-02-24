package com.hungpick.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hungpick.dto.AnswerDto;
import com.hungpick.dto.Criteria;
import com.hungpick.dto.PageMaker;
import com.hungpick.dto.Question;
import com.hungpick.dto.QuestionVo;
import com.hungpick.service.IAnswerService;
import com.hungpick.service.IQuestionSerivce;

@Controller
public class QnAController {

	@Autowired
	private IQuestionSerivce question;
	
	@Autowired
	private IAnswerService answer;
 	
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);

	/*------------------- Q&A 리스트 조회 -----------------*/
	@RequestMapping("Questionlist")
	public String QA(Model model, String memberCode, @ModelAttribute("cri") Criteria cri, HttpSession session)
			throws Exception {
		logger.info("Q&A called ========== ");
		
		
		memberCode = (String)session.getAttribute("memberCode");
		String adminCode = (String)session.getAttribute("adminCode");
		System.out.println("확인 : " + adminCode);
		
		if(memberCode == null && adminCode == null)
		{
			String msg = "로그인이 필요합니다.";
			String url = "userLogin";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "main";        
		} else if(memberCode != null) {
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(question.listCount(memberCode));
			int currentPage = cri.getPage();
			
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("listpage", question.listPage(cri, memberCode));
			model.addAttribute("member", question.MemberCode(memberCode));
			
			return "Questionlist";
			
		} else {
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(question.answerCount());
			int currentPage = cri.getPage();
			
			model.addAttribute("selectNlist", answer.selectN(cri));
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("currentPage", currentPage);
			
			return "answerconfirmList";
		}
	}
	
	@RequestMapping("view1")
	public String view1(Model model, @RequestParam("memberCode") String memberCode,
			@RequestParam("qstnCode") String qstnCode, HttpSession session) {
		
		logger.info("update in");
		/*memberCode = (String) session.getAttribute("memberCode");*/
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date(); 
		String time1 = format1.format(date);
		model.addAttribute("sltOne", question.sltOne(memberCode, qstnCode));
		model.addAttribute("selectOne", answer.selectQuestionview(memberCode, qstnCode));
		model.addAttribute("date", time1);		
		
		return "Questionupdatelist";
	}

	@RequestMapping("sltOneQnA")
	public String sltOneQnA(Model model, @RequestParam("memberCode") String memberCode, String qstnCode,
			HttpSession session) throws Exception {

		memberCode = (String) session.getAttribute("memberCode");
		model.addAttribute("sltOne", question.sltOne(memberCode, qstnCode));	
		model.addAttribute("selectOne", answer.selectQuestionview(memberCode, qstnCode));
		
		
		return "questionsltoneQ&A";
	}
	
	@RequestMapping("insertQnA")
	public String insertUser(Model model, @RequestParam("memberCode") String memberCode, String qstnCode,
			HttpSession session) throws Exception {

		memberCode = (String) session.getAttribute("memberCode");
		System.out.println(memberCode);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String time1 = format1.format(date);

		model.addAttribute("member", memberCode);
		model.addAttribute("sltOne", question.sltOne(memberCode, qstnCode));
		model.addAttribute("date", time1);

		return "QuestioninsertQ";
	}

	
	/*-------------------------Q&A 작성 ------------------*/
	@RequestMapping("Questioninsert")
	public String updateView(Question qes, Model model, @RequestParam("memberCode") String memberCode, Criteria cri,
			HttpSession session) throws Exception {
		logger.info("insertCn");

		question.insert(qes);

		memberCode = (String) session.getAttribute("memberCode");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount(memberCode));
		int currentPage = cri.getPage();

		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("listpage", question.listPage(cri, memberCode));
		model.addAttribute("member",question.MemberCode(memberCode));

		return "redirect:/Questionlist";
	}

	/*-----------------------Q&A 업데이트 -------------------------*/
	@RequestMapping("QuestionUpdate")
	public String updateE(Model model, @RequestParam("memberCode") String memberCode, Question qes, Criteria cri,
			HttpSession session,String qstnCode) throws Exception {
		logger.info("updatelist");
		
		question.update(qes);
		memberCode = (String) session.getAttribute("memberCode");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount(memberCode));
		int currentPage = cri.getPage();

		model.addAttribute("sltOne", question.sltOne(memberCode, qstnCode));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		Question member = question.MemberCode(memberCode);
		model.addAttribute("listpage", question.listPage(cri, memberCode));
		model.addAttribute("member", member);

		return "redirect:/Questionlist";
	}
	
	
	/*-----------------------------Q&A 삭제-----------------------*/
	@RequestMapping("Questiondelete")
	public String delete(Model model, @RequestParam("memberCode") String memberCode, String qstnCode, Question qes,
			Criteria cri, HttpSession session) throws Exception {

		question.delete(memberCode, qstnCode);
		memberCode = (String)session.getAttribute("memberCode");


		List<QuestionVo> list = question.listPage(cri, memberCode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount(memberCode));
		int currentPage = cri.getPage();

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("listpage", list);
		model.addAttribute("member", question.MemberCode(memberCode));

		return "redirect:/Questionlist";

	}

	//------------------------------answer 질문-------------------------------
	
	
	@RequestMapping("reply")
	public String reply(Model model,String memberCode,String qstnCode,@ModelAttribute("cri") Criteria cri,HttpSession session) 
	{

		
		String adminCode = (String)session.getAttribute("adminCode");
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time1 = format1.format(date);
		
		model.addAttribute("date", time1);
		model.addAttribute("adminCode", adminCode);
		model.addAttribute("sltOne", question.sltOne(memberCode, qstnCode));
		
		return "answerview";
		
	}
	@RequestMapping("insertreply")
	public String insertreply(Model model,@Param("memberCode") String memberCode,@Param("qstnCode")String qstnCode,@ModelAttribute("cri") Criteria cri,AnswerDto ans
		) throws Exception 
	{
		
		answer.insert(ans);
		logger.info("insert 성공");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.answerCount());
		int currentPage = cri.getPage();
		
		model.addAttribute("selectNlist", answer.selectN(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		
		return "answerconfirmList";
			
	}
	
}
