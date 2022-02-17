

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
import com.hungpick.dto.Notice;
import com.hungpick.dto.PageMaker;
import com.hungpick.dto.Question;
import com.hungpick.dto.QuestionVo;
import com.hungpick.service.IAnswerService;
import com.hungpick.service.INoticeService;
import com.hungpick.service.IQuestionSerivce;

@Controller
public class UserController {

	@Autowired
	private INoticeService notice;

	@Autowired
	private IQuestionSerivce question;
	
	@Autowired
	private IAnswerService answer;
 	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	/*--------------------- 공지사항 등록 페이지로 이동 ---------------------*/
	@RequestMapping("noticeinsertN")
	public void noticeinsertN(Model model) {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("date", time1);
	}

	/*------------------- Q&A 리스트 조회 -----------------*/
	@RequestMapping("Questionlist")
	public String QA(Model model, String memberCode, @ModelAttribute("cri") Criteria cri, HttpSession session)
			throws Exception {
		logger.info("Q&A called ========== ");
		/*	
		json 객체 만드는 
	 	JSONObject jsonObj = new JSONObject();
		jsonObj.put("list", list);
		String jsonOut = jsonObj.toString();
		System.out.println(jsonOut);
		*/
		
		memberCode = (String)session.getAttribute("memberCode");	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount(memberCode));
		int currentPage = cri.getPage();

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("listpage", question.listPage(cri, memberCode));
		model.addAttribute("member", question.MemberCode(memberCode));
		
		
		return "Questionlist";
	}
	
	@RequestMapping("view1")
	public String view1(Model model, @RequestParam("memberCode") String memberCode,
			@RequestParam("qstnCode") String qstnCode, HttpSession session) {
		logger.info("insertMem called ==========");
		/*memberCode = (String) session.getAttribute("memberCode");*/
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(); 
		String time1 = format1.format(date);
		model.addAttribute("sltOne", question.sltOne(memberCode, qstnCode));
		model.addAttribute("selectOne", answer.selectQuestionview(memberCode, qstnCode));
		model.addAttribute("date", time1);
		
		
		
		return "Questionupdatelist";
	}

	@RequestMapping("insertQnA")
	public String insertUser(Model model, @RequestParam("memberCode") String memberCode, String qstnCode,
			HttpSession session) throws Exception {

		logger.info("insert");
		memberCode = (String) session.getAttribute("memberCode");
		System.out.println(memberCode);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);

		model.addAttribute("member", memberCode);

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

		return "Questionlist";
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

		return "Questionlist";
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

	
	/*-------------------------Notice insert 공지사항 -----------------*/
	@RequestMapping("Noticeinsert")
	public String insertNoticeC(Notice noti) throws Exception {
		
		notice.insert(noti);
		
	
		return "adminPage";

	}
	
	/*---------------------------공지사항 수정전 확인 --------------------------*/
	@RequestMapping("Noticeupdatepage")
	public String Noticeupdatelist(Model model, String adminCode ,String noticeCode,HttpSession session) throws Exception {
		logger.info("updatelist");
		
		adminCode = (String)session.getAttribute("adminCode");
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("date", time1);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		return "NoticeSWD";

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
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time1 = format1.format(date);
		
		model.addAttribute("adminCode", adminCode);
		model.addAttribute("date", time1);
		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		return "NoticeSWD";
	}
	
	//------------------------------answer 질문-------------------------------
	
	@RequestMapping("Nconfirm")
	public String selectconfirm(Model model, @ModelAttribute("cri")Criteria cri)throws Exception
	{
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.answerCount());
		int currentPage = cri.getPage();
		
		model.addAttribute("selectNlist", answer.selectN(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		
		return "answerconfirmList";
		
	}
	@RequestMapping("reply")
	public String reply(Model model,String memberCode,String qstnCode,@ModelAttribute("cri") Criteria cri,HttpSession session) 
	{

		
		String adminCode = (String)session.getAttribute("adminCode");
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
