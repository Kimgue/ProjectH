
package com.hungpick.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;

import com.hungpick.dto.Criteria;
import com.hungpick.dto.Notice;
import com.hungpick.dto.PageMaker;
import com.hungpick.dto.Question;
import com.hungpick.dto.QuestionVo;
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
	
	


	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	private String path = "G:\\rbtjd\\WebProject\\src\\main\\webapp\\resources\\images\\Q&AImg";

	@RequestMapping("/form")
	public String form() {
		return "form";
	}

	@RequestMapping("result")
	public String result(@RequestParam("file1") MultipartFile multi,HttpServletRequest request, HttpServletResponse response, Model model) {
		String url = null;
		System.out.println("확인");
		try {

			// String uploadpath = request.getServletContext().getRealPath(path);
			String uploadpath = path;
			String originFilename = multi.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			long size = multi.getSize();
			String saveFileName = genSaveFileName(extName);

			System.out.println("uploadpath : " + uploadpath);

			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);

			if (!multi.isEmpty()) {
				System.out.println("gdgd");
				File file = new File(uploadpath, multi.getOriginalFilename());
				System.out.println("1 : " + file);
				multi.transferTo(file);
				System.out.println("2 : " + file);

				model.addAttribute("filename", multi.getOriginalFilename());
				System.out.println("3 : " + file);
				model.addAttribute("uploadPath", file.getAbsolutePath());
				System.out.println("4 : " + file);

				return "filelist";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:form";
	}

	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";

		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;

		return fileName;
	}

	@RequestMapping(value = "/")
	public String home(Model model, String memberCode) {
		logger.info("home called ==========");

		return "redirect:/main.jsp";
	}

	@RequestMapping("Question")
	public String QA(Model model, String memberCode, @ModelAttribute("cri") Criteria cri, HttpSession session)
			throws Exception {

		logger.info("Q&A called ========== ");

		memberCode = (String) session.getAttribute("memberCode");
		System.out.println("코드 : " + memberCode);

		List<QuestionVo> list = question.listPage(cri, memberCode);
		System.out.println(list);
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
		pageMaker.setTotalCount(question.listCount());
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
		pageMaker.setTotalCount(question.listCount());
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
		pageMaker.setTotalCount(question.listCount());
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

	@RequestMapping("Notice")
	public String listPage(Model model, @Param("adminCode") String adminCode, String noticeCode,
			@ModelAttribute("cri") Criteria cri, HttpSession session) throws Exception {
		logger.info("get list page");
		System.out.println(session.getAttribute("memberCode"));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(notice.listCount());
		int currentPage = cri.getPage();
		System.out.println(notice.noticeCode(adminCode));

		model.addAttribute("listpage", notice.listPage(cri));
		model.addAttribute("noticecode", notice.noticeCode(adminCode));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("currentPage", currentPage);

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

}
