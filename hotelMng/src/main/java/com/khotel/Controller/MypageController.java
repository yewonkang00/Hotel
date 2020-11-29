package com.khotel.Controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khotel.Service.MemberService;
import com.khotel.Service.ReservationService;
import com.khotel.Vo.MemberVo;
import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/mypage/memberinfo")
	public String mypage(Locale locale, Model model, HttpServletRequest request) {
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		
		model.addAttribute("user", member);
		return "/mypage/memberinfo";
	}
	
	@RequestMapping(value = "/mypage/memberDelete")
	public String memberDelete(Locale locale, Model model, HttpServletRequest request) throws Exception {
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		memberService.deleteMember(member);
		session.invalidate();
		return "/mypage/memberinfo";
	}
	
	@RequestMapping(value = "/mypage/reservation")
	public String reservation(Locale locale, Model model, HttpServletRequest request) throws Exception{
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		if(member == null) return "/mypage/reservation";
		String UserId = member.getUserId();
		
		ReservationVo reservation = new ReservationVo();
		reservation.setUserId(UserId);
		List<ReservationVo> reservationList = null;
		ReservationVo reservationVo = new ReservationVo();
		
		reservationList = reservationService.selectReservationList(reservation);
		model.addAttribute("reservation", reservationList);
		System.out.println("reservation: "+ reservationList);
		return "/mypage/reservation";
	}
}
