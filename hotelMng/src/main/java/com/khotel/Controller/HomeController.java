package com.khotel.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ArrayList;
import java.util.Calendar;

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
import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;
import com.khotel.Service.RoomService;
import com.khotel.Service.ReservationService;

import org.springframework.ui.Model;

import com.khotel.Util.DateData;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private RoomService roomService;
	
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
	
	//로그아웃 처리
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpServletRequest request) {
		
		Map map = new HashMap();
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/main";
	}
	
	//로그인에 아이디, 비밀번호를 받아서 로그인 처리하는 페이지
	@RequestMapping(value = "/memeber/loginAction.do") 
	public @ResponseBody Map join(MemberVo loginMember, HttpServletRequest request) throws Exception {
		
		MemberVo selectMemberVo = new MemberVo();
		Map map = new HashMap();
		
		HttpSession session = request.getSession();
		System.out.println(loginMember.getUserId());
		
		//loginMember에 아이디, 비밀번호 정보가 있고 db에서 그 정보에 해당하는 member를 찾아 selectMemberVo에 대입
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
			session.setAttribute("member", selectMemberVo);

		}else {
			map.put("resultMsg", "fail");
		}
		System.out.println(map);
		return map;
	}
	

	//회원가입으로 넘겨주는 페이지
	@RequestMapping(value = "/memeber/regist.do", method = RequestMethod.GET)
	public String signup(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/login/register";
	}	
	
	//회원가입 처리하는 페이지
	@RequestMapping(value = "/memeber/registAction.do") 
	public @ResponseBody Map regist(MemberVo registMember, HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		MemberVo selectMemberVo = new MemberVo();
		
		selectMemberVo = memberService.selectMember(registMember);
		if(selectMemberVo != null) {
			map.put("resultMsg", "IDDup");
		} else {		
			memberService.insertMember(registMember);
			map.put("resultMsg", "success");
		}
		return map;
	}
	
	//관리자 페이지
	@RequestMapping(value = "/admin/memberList")
	public String memberList(Locale locale, Model model, HttpServletRequest request) throws Exception {
		List<MemberVo> memberList = null;
		
		//회원 가져오기 - check
		try {
			memberList = memberService.listMember();
		} catch (Exception e) {
			
		}
		model.addAttribute("memberList", memberList );
		return "/admin/memberList";
	}
	
	//관리자 페이지
	@RequestMapping(value = "/admin/roomList")
	public String roomList(Locale locale, Model model, HttpServletRequest request) throws Exception {
		List<RoomVo> roomList = null;
		
		//회원 가져오기 - check
		try {
			roomList = roomService.listRoom();
		} catch (Exception e) {
			
		}
		model.addAttribute("roomList", roomList );
		return "/admin/roomList";
	}
	
	@RequestMapping(value = "/admin")
	public String admin(Locale locale, Model model, HttpServletRequest request) throws Exception {
		return "/admin/admin";
	}

	//달력에 예약 현황 표시
	@RequestMapping(value = "/admin/reservation.do", method = RequestMethod.GET)
	public String reservation(Model model, HttpServletRequest request, DateData dateData){
		
		HttpSession session = request.getSession();
		
		Object member = new MemberVo();
		member = session.getAttribute("member");
		String roomNo = request.getParameter("rno");
		String resdate = request.getParameter("resdate");
		
		System.out.println("roomNo :"+roomNo);
		System.out.println("member :"+member);
		System.out.println("resdate :" + resdate);
		
		List<RoomVo> reservationList = null;
		try {
			reservationList = roomService.listRoomReservation(roomNo);
		} catch (Exception e) {
			
		}
		System.out.println("reservationList: " + reservationList);
		
		
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("reservationList", reservationList);
		return "admin/reservation";
	}
	
	//예약이 가능한 방인지 확인
	@RequestMapping(value = "/admin/reservationCheck.do") 
	public @ResponseBody Map reservation(@RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception {
		HashMap<String, Object> roomMap = new HashMap();
		
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		String UserId = member.getUserId();
		String roomNo = map.get("roomNo").toString();
		String resdate = map.get("resdate").toString();
		roomMap.put("roomNo", roomNo);
		roomMap.put("resdate", resdate);
		roomMap.put("UserID", UserId);
		
		int resCnt = roomService.findRoomReservation(roomMap);
		
		System.out.println("resCnt :"+resCnt);
		Map resultMap = new HashMap();
		resultMap.put("resultMsg", resCnt);
		
		return resultMap;
	}
	
	//예약이 가능한 방인지 확인
		@RequestMapping(value = "/admin/datecheck.do") 
		public @ResponseBody Map datecheck(@RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception {
			HashMap<String, Object> roomMap = new HashMap();
			
			ReservationVo reservation = new ReservationVo();
			HttpSession session = request.getSession();
			
			String checkIn = map.get("ReservationCheckIn").toString();
			String checkOut = map.get("ReservationCheckOut").toString();
			String roomNo = map.get("roomNo").toString();
			
			roomMap.put("ReservationCheckIn", checkIn);
			roomMap.put("ReservationCheckOut", checkOut);
			roomMap.put("roomNo", roomNo);
			
			int resCnt = roomService.findRoom(roomMap);
			
			Map resultmap = new HashMap();
			if(resCnt == 0) {
				reservationService.insertReservation(reservation);
				resultmap.put("resultMsg", "success");
			} else {
				resultmap.put("resultMsg", "fail");
			}
			
			return resultmap;
		}
	
	
	
	//예약페이지
	@RequestMapping(value = "/admin/reservate.do", method = RequestMethod.GET)
	public String reservate(Model model, HttpServletRequest request) {
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		String UserId = member.getUserId();
		String roomNo = request.getParameter("roomNo");
		String resdate = request.getParameter("resdate");
		System.out.println("roomNo:" + roomNo);
		System.out.println("resdate:" + resdate);
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("resdate", resdate);
		model.addAttribute("UserId", UserId);
		return "/reservation/reservation2";
	}

	//예약페이지
	@RequestMapping(value = "/admin/reservateAction.do", method = RequestMethod.POST)
	public @ResponseBody Map reservateAction(ReservationVo reservation, HttpServletRequest request) throws Exception {
		HashMap<String, Object> roomMap = new HashMap();
		
		String checkIn = reservation.getReservationCheckIn();
		String checkOut = reservation.getReservationCheckOut();
		String roomNo = Integer.toString(reservation.getRoomCode());
		
		roomMap.put("ReservationCheckIn", checkIn);
		roomMap.put("ReservationCheckOut", checkOut);
		roomMap.put("roomNo", roomNo);
		
		int resCnt = roomService.findRoom(roomMap);
		
		Map resultmap = new HashMap();
		if(resCnt == 0) {
			reservationService.insertReservation(reservation);
			resultmap.put("resultMsg", "success");
		} else {
			resultmap.put("resultMsg", "fail");
		}
		
		return resultmap;
	}
	
	/*
	 * //예약 상세 페이지
	 * 
	 * @RequestMapping(value = "/admin/reservationDetail.do", method =
	 * RequestMethod.GET) public String reservationDetail(Model model,
	 * HttpServletRequest request, DateData dateData) { return
	 * "/admin/reservationDetail"; }
	 */
	
	
		
	//관리자 페이지에서 member에서 update버튼을 누르면 memberlevel을 바꿔줌
	@RequestMapping(value = "/admin/levelAction.do")
	public @ResponseBody Map level(MemberVo updateMember, HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		memberService.updateLevel(updateMember);
		map.put("resultMsg", "Success");
		return map;
	}
	
	//메인화면(홈화면)
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/main";
	}
	
	

	@RequestMapping(value = "/intro.do", method = RequestMethod.GET)
	public String intro(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);

      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

      String formattedDate = dateFormat.format(date);

      model.addAttribute("serverTime", formattedDate );

      return "/intro/introduction";
   }


	@RequestMapping(value = "/intro_hotel.do", method = RequestMethod.GET)
	   public String intro_hotel(Locale locale, Model model) {
	      logger.info("Welcome home! The client locale is {}.", locale);
	
	      Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	      String formattedDate = dateFormat.format(date);
	
	      model.addAttribute("serverTime", formattedDate );
	
	      return "/intro/introduction_hotel";
	   }
	
	@RequestMapping(value = "/room.do", method = RequestMethod.GET)
	   public String room(Locale locale, Model model) {
	      logger.info("Welcome home! The client locale is {}.", locale);
	
	      Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	      String formattedDate = dateFormat.format(date);
	
	      model.addAttribute("serverTime", formattedDate );
	
	      return "/room/suiteroom";
	   }
	
	@RequestMapping(value = "/room_standard.do", method = RequestMethod.GET)
	   public String room_standard(Locale locale, Model model) {
	      logger.info("Welcome home! The client locale is {}.", locale);
	
	      Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	      String formattedDate = dateFormat.format(date);
	
	      model.addAttribute("serverTime", formattedDate );
	
	      return "/room/standardroom";
	   }


	
	
}