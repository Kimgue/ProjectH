

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

import com.hungpick.dto.Criteria;
import com.hungpick.dto.Notice;
import com.hungpick.dto.PageMaker;
import com.hungpick.dto.Question;
import com.hungpick.dto.QuestionVo;
import com.hungpick.service.IAnswerService;
import com.hungpick.service.IGifticonService;
import com.hungpick.service.INoticeService;
import com.hungpick.service.IQuestionSerivce;

@Controller
public class UserController {

	@Autowired
	private INoticeService notice;

	@Autowired
	private IQuestionSerivce question;

	@Autowired
	private IGifticonService gifticon;
	
	@Autowired
	private IAnswerService answer;
 	
	


	private static final Logger logger = LoggerFactory.getLogger(UserController.class);


	@RequestMapping(value = "/")
	public String home(Model model, String memberCode) {
		logger.info("home called ==========");

		return "redirect:/main.jsp";
	}

	@RequestMapping("Question")
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
		
		memberCode = (String) session.getAttribute("memberCode");
	
		List<QuestionVo> list = question.listPage(cri, memberCode);
	
		System.out.println(list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount(memberCode));
		int currentPage = cri.getPage();

		Question member = question.MemberCode(memberCode);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		model.addAttribute("listpage", list);
		model.addAttribute("member", member);

		return "Questionlist";
	}
	
	

	@RequestMapping("view1")
	public String view1(Model model, @RequestParam("memberCode") String memberCode,
			@RequestParam("qstnCode") String qstnCode, HttpSession session) {
		logger.info("insertMem called ==========");
		memberCode = (String) session.getAttribute("memberCode");

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("sltOne", question.sltOne(memberCode, qstnCode));
		System.out.println(question.sltOne(memberCode, qstnCode));
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

	@RequestMapping("Questioninsert")
	public String updateView(Question qes, Model model, @RequestParam("memberCode") String memberCode, Criteria cri,
			HttpSession session) throws Exception {
		logger.info("insertCn");

		question.insert(qes);

		memberCode = (String) session.getAttribute("memberCode");
		/* List<Question> list = question.first(memberCode); */
		List<QuestionVo> list = question.listPage(cri, memberCode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount(memberCode));
		int currentPage = cri.getPage();

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		Question member = question.MemberCode(memberCode);
		model.addAttribute("listpage", list);
		model.addAttribute("member", member);

		return "Questionlist";
	}

	@RequestMapping("QuestionUpdate")
	public String updateE(Model model, @RequestParam("memberCode") String memberCode, Question qes, Criteria cri,
			HttpSession session) throws Exception {
		logger.info("updatelist");

		question.update(qes);
		memberCode = (String) session.getAttribute("memberCode");
		/* List<Question> list = question.first(memberCode); */
		List<QuestionVo> list = question.listPage(cri, memberCode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount(memberCode));
		int currentPage = cri.getPage();

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		Question member = question.MemberCode(memberCode);
		model.addAttribute("listpage", list);
		model.addAttribute("member", member);

		return "Questionlist";
	}

	@RequestMapping("Questiondelete")
	public String delete(Model model, @RequestParam("memberCode") String memberCode, String qstnCode, Question qes,
			Criteria cri, HttpSession session) throws Exception {

		question.delete(memberCode, qstnCode);
		memberCode = (String) session.getAttribute("memberCode");

		/* List<Question> list = question.first(memberCode); */
		List<QuestionVo> list = question.listPage(cri, memberCode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount(memberCode));
		int currentPage = cri.getPage();

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		System.out.println(list);
		Question member = question.MemberCode(memberCode);

		model.addAttribute("listpage", list);
		model.addAttribute("member", member);

		return "Questionlist";

	}

	// ----------------------------------------공지사항-----------------------------//

	@SuppressWarnings("unused")
	@RequestMapping("Notice")
	public String listPage(Model model, @Param("adminCode") String adminCode, String noticeCode,
			@ModelAttribute("cri") Criteria cri, HttpSession session) throws Exception {
		logger.info("get list page");
		String memberCode = (String) session.getAttribute("memberCode");
		/*String adminCode = (String) session.getAttribute("adminCode");*/
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		System.out.println(notice.noticeCode(adminCode));

		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("noticecode", notice.noticeCode(adminCode));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		

		
		if( memberCode != null || memberCode == null)
		{
			return "NoticePage";
		}
		else
			
			return "NoticeSWD";
			
			
	}

	@RequestMapping("NoticeMember")
	public String listPag(Model model, String adminCode, String noticeCode, @ModelAttribute("cri") Criteria cri)
			throws Exception {
		logger.info("list page");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();

		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("noticecode", notice.noticeCode(adminCode));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		return "NoticePage";

	}

	@RequestMapping("view2")
	public String view2(Model model, String adminCode, String noticeCode) throws Exception {

		model.addAttribute("noticecontent", notice.sltOneNoice(adminCode, noticeCode));

		return "Noticeview2";
	}

	@RequestMapping("insertNotice")
	public String insertNotice(Model model, String adminCode) throws Exception {

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);

		model.addAttribute("date", time1);
		model.addAttribute("noticecode", notice.noticeCode(adminCode));

		return "noticeinsertN";
	}

	@RequestMapping("insertNc")
	public String insertNoticeC(Model model, String adminCode, String noticeCode, Notice noti, Criteria cri)
			throws Exception {

		notice.insert(noti);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("noticecode", notice.noticeCode(adminCode));
		model.addAttribute("date", time1);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		return "NoticeSWD";

	}

	@RequestMapping("Noticeupdatepage")
	public String Noticeupdatelist(Model model, String adminCode, String noticeCode) throws Exception {
		logger.info("updatelist");

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("date", time1);
		model.addAttribute("person", notice.sltOneNoice(adminCode, noticeCode));

		return "Noticeupdatelist";
	}

	@RequestMapping("Noticeupdate")
	public String Noticeupdate(Model model, String adminCode, String noticeCode, Notice noti, Criteria cri)
			throws Exception {
		logger.info("update해서 간다");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();

		notice.update(noti);
		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("noticecode", notice.noticeCode(adminCode));
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("date", time1);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		return "NoticeSWD";

	}

	@RequestMapping("Noticedelete")
	public String Noticedelete(Model model, String adminCode, String noticeCode, Notice noti, Criteria cri)
			throws Exception {
		System.out.println("delete");
		notice.delete(adminCode, noticeCode);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time1 = format1.format(date);
		model.addAttribute("date", time1);
		model.addAttribute("noticecode", notice.noticeCode(adminCode));
		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		return "NoticeSWD";
	}

	// ----------------------------GIFTICON--------------------------------

	@RequestMapping("GifticonList")
	public String GifticonList(Model model) throws Exception {

		System.out.println(gifticon.selectgift());
		model.addAttribute("gifticonlist", gifticon.selectgift());
		System.out.println("ㅇㅇ");

		return "GifticonList";
	}
	
	//------------------------------answer-------------------------------
	
	@RequestMapping("Nconfirm")
	public String selectconfirm(Model model, @ModelAttribute("cri") Criteria cri)throws Exception
	{
		
		
		model.addAttribute("list", question.selectN(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.answerCount());
		int currentPage = cri.getPage();
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		
		return "answerconfirmList";
		
	}
	@RequestMapping("reply")
	public String reply(Model model,String memberCode,String qstnCode) 
	{
		model.addAttribute("sltOne", question.sltOne(memberCode, qstnCode));
		System.out.println(answer);
		
		/*
		  <select id="sltOne" parameterType="String" resultType="qesDto">
			SELECT * 
			FROM 
			QUESTION
			WHERE MEMBER_CODE = #{ memberCode } AND
			QSTN_CODE = #{ qstnCode  } 
			</select>
		 
		 */
		return "answerview";
		
	}
}
