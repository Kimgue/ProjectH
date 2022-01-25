package com.hungpick.controller;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hungpick.dto.Criteria;
import com.hungpick.dto.MenuVo;
import com.hungpick.dto.Notice;
import com.hungpick.dto.PageMaker;
import com.hungpick.dto.Question;
import com.hungpick.dto.UserDto;
import com.hungpick.service.IBrandService;
import com.hungpick.service.IMenuService;
import com.hungpick.service.INoticeService;
import com.hungpick.service.IQuestionSerivce;
import com.hungpick.service.IReviewService;
import com.hungpick.service.IUserService;

@Controller
public class UserController {

	@Autowired
	private INoticeService notice;

	@Autowired
	private IQuestionSerivce question;

	/*------------------------정진욱------------------------*/
	@Autowired
	private IBrandService brandService;

	@Autowired
	private IMenuService menuService;

	@Autowired
	private IReviewService reviewService;

	@Autowired
	private IUserService userService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/")
	public String home(Model model, String memberCode) {
		logger.info("home called ==========");

		return "redirect:/main.jsp";
	}

	@RequestMapping("Question")
	public String QA(Model model, String memberCode, @ModelAttribute("cri") Criteria cri) throws Exception {
		logger.info("Q&A called ==========");

		/* List<Question> list = question.first(memberCode); */

		
		List<Question> list = question.listPage(cri,memberCode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount());
		int currentPage = cri.getPage();
		Question member = question.MemberCode(memberCode);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		model.addAttribute("listpage", list);
		model.addAttribute("member", member);

		return "Questionlist";
	}

	@RequestMapping("view1")
	public String view1(Model model, String memberCode, String qstnCode) {
		logger.info("insertMem called ==========");

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("sltOne", question.sltOne(memberCode, qstnCode));
		System.out.println(question.sltOne(memberCode, qstnCode));
		model.addAttribute("date", time1);

		return "Questionupdatelist";
	}

	@RequestMapping("insertQnA")
	public String insertUser(Model model, String memberCode, String qstnCode) throws Exception {

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);

		Question member = question.MemberCode(memberCode);

		model.addAttribute("member", member);
		System.out.println("memberCode " + member);
		model.addAttribute("date", time1);

		return "QuestioninsertQ";
	}

	@RequestMapping("Questioninsert")
	public String updateView(Question qes, Model model, String memberCode, Criteria cri) throws Exception {
		logger.info("insertCn");

		/* List<Question> list = question.first(memberCode); */
		List<Question> list = question.listPage(cri,memberCode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount());
		int currentPage = cri.getPage();
		question.insert(qes);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

		Question member = question.MemberCode(memberCode);
		model.addAttribute("listpage", list);
		model.addAttribute("member", member);

		return "Questionlist";
	}

	@RequestMapping("updatelist")
	public String updatelist(Model model, String memberCode, String qstnCode) throws Exception {
		logger.info("updatelist");

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		Question sltOne = question.sltOne(memberCode, qstnCode);
		model.addAttribute("sltOne", sltOne);
		System.out.println(sltOne);
		model.addAttribute("date", time1);

		return "Questionupdatelist";
	}

	@RequestMapping("QuestionUpdate")
	public String updateE(Model model, String memberCode, Question qes, Criteria cri) throws Exception {
		logger.info("updatelist");

		/* List<Question> list = question.first(memberCode); */
		List<Question> list = question.listPage(cri,memberCode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount());
		int currentPage = cri.getPage();
		question.update(qes);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		Question member = question.MemberCode(memberCode);
		model.addAttribute("listpage", list);
		model.addAttribute("member", member);

		return "Questionlist";
	}

	@RequestMapping("Questiondelete")
	public String delete(Model model, String memberCode, String qstnCode, Question qes, Criteria cri) throws Exception {

		/* List<Question> list = question.first(memberCode); */
		List<Question> list = question.listPage(cri,memberCode);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(question.listCount());
		int currentPage = cri.getPage();
		question.delete(memberCode, qstnCode);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		System.out.println(list);
		Question member = question.MemberCode(memberCode);

		model.addAttribute("listpage", list);
		model.addAttribute("member", member);

		return "Questionlist";

	}

	@RequestMapping("Notice")
	public String listPage(Model model, String adminCode, String noticeCode, Criteria cri) throws Exception {
		logger.info("get list page");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();

		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("sltOne", notice.sltone(adminCode));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		return "NoticeSWD";

	}

	@RequestMapping("view2")
	public String view2(Model model, String adminCode, String noticeCode) throws Exception {

		model.addAttribute("s", notice.select(adminCode, noticeCode));

		return "Noticeview2";
	}

	@RequestMapping("insertNotice")
	public String insertNotice(Model model, String adminCode) throws Exception {

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);

		model.addAttribute("date", time1);
		model.addAttribute("s", notice.sltone(adminCode));

		return "NoticeinsertN";
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
		model.addAttribute("list", notice.listPage(cri));
		model.addAttribute("a", notice.sltone(adminCode));
		model.addAttribute("date", time1);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);
		return "NoticeSWD";

	}

	@RequestMapping("Noticeupdatelist")
	public String Noticeupdatelist(Model model, String adminCode, String noticeCode) throws Exception {
		logger.info("updatelist");

		Notice person = notice.select(adminCode, noticeCode);
		model.addAttribute("person", person);
		System.out.println(person);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String time1 = format1.format(date);
		model.addAttribute("date", time1);

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
		model.addAttribute("list", notice.listPage(cri));
		model.addAttribute("a", notice.sltone(adminCode));
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

		notice.delete(adminCode, noticeCode);
		model.addAttribute("list", notice.listPage(cri));

		return "NoticeSWD";
	}

	/*------------------------김혜성------------------------*/

	// 회원조회
		@RequestMapping("userView")
		public String userView(UserDto Dto, Model model) {
			logger.info("userView called ==========");

			List<UserDto> list = userService.sltMulti(Dto);

			model.addAttribute("LIST", list);
			return "userView";
		}

		// 회원가입 페이지
		@RequestMapping("userRegist")
		public String userRegist() {
			logger.info("userRegist called ==========");
			return "userRegist";
		}

		// 회원가입
		@RequestMapping("userRegistSubmit")
		public String userRegistSubmit(UserDto Dto) throws Exception {
			logger.info("userRegistSubmit called ==========");
			userService.userRegist(Dto);
			return "redirect:/main.jsp";
		}

		// 로그인 페이지
		@RequestMapping("userLogin")
		public String userLogin() {
			logger.info("login called ==========");
			return "userLogin";
		}

		// 로그인
		@RequestMapping("userLoginConfirm")
		public ModelAndView userLoginConfirm(@Param("memberId") String memberId, @Param("memberPw")String memberPw, HttpSession session) throws Exception {
			logger.info("userLoginConfirm called ==========");
			ModelAndView mav = new ModelAndView();
			UserDto Dto = userService.userLogin(memberId, memberPw, session);
			
			if(Dto != null) {
				System.out.println("불러온 DTO : " + Dto);
				session.setAttribute("memberDTO", Dto);
				mav.setViewName("redirect:/main.jsp");
			} else {
				session.setAttribute("loginNotice", "올바른 아이디 혹은 비밀번호를 입력해주세요");
				mav.setViewName("redirect:/userLogin");
			}
			return mav;
		}

		// 로그아웃
		@RequestMapping("userLogout")
		public String userLogout(HttpSession session) throws Exception {
			userService.userLogout(session);
			return "redirect:/main.jsp";
		}

		// ID 중복검사
		@RequestMapping(value = "IdChkCtrl.do", produces = "application/text;charset=UTF-8")
		@ResponseBody
		public String idChk(@ModelAttribute("id") String memberId) {
			String idChk = userService.checkId(memberId);
			boolean result = false;
			if (idChk.equals("0")) {
				result = true;
			}

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("result", result);

			String jsonOut = jsonObj.toString();
			System.out.println("=====" + jsonOut);

			return jsonOut;
		}

	/*------------------------정진욱------------------------*/
	@RequestMapping("brand")
	public void brand(Model model) throws Exception {
		logger.info("brand called ========");
		model.addAttribute("brand", brandService.sltMulti());
	}

	@RequestMapping("menu")
	public void menu(Model model) throws Exception {
		logger.info("menu called ========");
		model.addAttribute("menu", menuService.sltMulti());
	}

	@RequestMapping("menuResult")
	public void menuVo(@RequestParam(required = false) String brandName,
			@RequestParam(required = false) String menuPrice, @RequestParam(required = false) String menuIngredients,
			@RequestParam(required = false) String menuName, Model model) throws Exception {
		logger.info("menuVo called ========");
		List<MenuVo> list = menuService.sltSearch(brandName, menuPrice, menuIngredients, menuName);
		String ResultMsg;
		if (list.size() > 0) {
			ResultMsg = "정상 조회되었습니다.";
		} else {
			ResultMsg = "죄송합니다. 해당되는 상품이 없습니다.";
		}
		model.addAttribute("ResultMsg", ResultMsg);
		model.addAttribute("menuVo", menuService.sltSearch(brandName, menuPrice, menuIngredients, menuName));
	}

	@RequestMapping("review")
	public void review(@RequestParam String brandCode, @RequestParam String menuCode, String menuName, Model model)
			throws Exception {
		logger.info("review called ========");
		model.addAttribute("menuName", menuName);
		model.addAttribute("review", reviewService.sltReviewList(brandCode, menuCode));
	}

	@RequestMapping("reviewLookup")
	public void reviewLookup(@RequestParam String brandCode, @RequestParam String menuCode,
			@RequestParam String reviewCode, @RequestParam String memberCode, Model model) throws Exception {

		logger.info("reviewLookup called =======");
		model.addAttribute("Lookup", reviewService.sltLookUp(brandCode, menuCode, reviewCode, memberCode));
	}
}
