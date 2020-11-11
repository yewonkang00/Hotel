package com.khotel.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khotel.Service.MemberService;
import com.khotel.Util.BoardPaging;
import com.khotel.Vo.MemberVo;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired 
	private BoardPaging boardPaging;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/main";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/login/login";
	}	
	
	@RequestMapping(value = "/memeber/join.do") 
	public @ResponseBody Map join(MemberVo loginMember, HttpServletRequest request) throws Exception {
		MemberVo memberVo = new MemberVo();
		MemberVo selectMemberVo = new MemberVo();
		Map map = new HashMap();
		
		HttpSession session = request.getSession();
		//session.invalidate();
		System.out.println(loginMember.getUserId());
		selectMemberVo = memberService.selectMember(loginMember);
		if(selectMemberVo == null) {
			map.put("resultMsg", "IDfail");
		}
		else if(!selectMemberVo.getUserPassword().equals(loginMember.getUserPassword())){
			map.put("resultMsg", "Passwordfail");
		}
		else if(selectMemberVo.getUserPassword().equals(loginMember.getUserPassword())){
			if(selectMemberVo.getUserLevel().equals("2")) {
				map.put("resultMsg", "Manager");
			} else {
				map.put("resultMsg", "Success");
			}
			session.setAttribute("sessionUID" , selectMemberVo.getUserId());
			String json = new ObjectMapper().writeValueAsString(selectMemberVo);
			session.setAttribute("result", json );
			session.setAttribute("loginMemberSession" , selectMemberVo);
		}else {
			map.put("resultMsg", "fail");
		}
		System.out.println(map);
		return map;
	}
	

	@RequestMapping(value = "/memeber/signup.do", method = RequestMethod.GET)
	public String singup(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/login/register";
	}	
	
	
	@RequestMapping(value = "/memeber/regist.do") 
	public @ResponseBody Map regist(MemberVo registMember, HttpServletRequest request) throws Exception {
		MemberVo memberVo = new MemberVo();
		MemberVo insertMemberVo = new MemberVo();
		Map map = new HashMap();
		MemberVo selectMemberVo = new MemberVo();
		
		selectMemberVo = memberService.selectMember(registMember);
		if(selectMemberVo != null) {
			map.put("resultMsg", "IDDup");
		} else {		
		memberService.insertMember(registMember);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("resultMsg", "success");
		}
		return map;
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpServletRequest request) {
		
		Map map = new HashMap();
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/login/login";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/main";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String main2(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/main";
	}
	
	@RequestMapping(value = "/home2", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/home2";
	}
	
	
	@RequestMapping(value = "/introduction", method = RequestMethod.GET)
	public String introduction(Locale locale, Model model) {
	
		return "/main/introduction";
	}
	

	
}