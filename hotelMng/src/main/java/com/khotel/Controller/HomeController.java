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
import org.springframework.web.servlet.ModelAndView;

import com.khotel.Service.MemberService;
import com.khotel.Service.QnaService;
import com.khotel.Util.BoardPaging;
import com.khotel.Vo.MemberVo;
import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;
import com.khotel.Service.RoomService;
import com.khotel.ServiceImpl.Pager;
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
	
	@Autowired
	private QnaService qnaService;
	
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
	
	//濡쒓렇�븘�썐 泥섎━
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpServletRequest request) {
		
		Map map = new HashMap();
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/main";
	}
	
	//濡쒓렇�씤�뿉 �븘�씠�뵒, 鍮꾨�踰덊샇瑜� 諛쏆븘�꽌 濡쒓렇�씤 泥섎━�븯�뒗 �럹�씠吏�
	@RequestMapping(value = "/memeber/loginAction.do") 
	public @ResponseBody Map join(MemberVo loginMember, HttpServletRequest request) throws Exception {
		
		MemberVo selectMemberVo = new MemberVo();
		Map map = new HashMap();
		
		HttpSession session = request.getSession();
		System.out.println(loginMember.getUserId());
		
		//loginMember�뿉 �븘�씠�뵒, 鍮꾨�踰덊샇 �젙蹂닿� �엳怨� db�뿉�꽌 洹� �젙蹂댁뿉 �빐�떦�븯�뒗 member瑜� 李얠븘 selectMemberVo�뿉 ���엯
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
	

	//�쉶�썝媛��엯�쑝濡� �꽆寃⑥＜�뒗 �럹�씠吏�
	@RequestMapping(value = "/memeber/regist.do", method = RequestMethod.GET)
	public String signup(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/login/register";
	}	
	
	//�쉶�썝媛��엯 泥섎━�븯�뒗 �럹�씠吏�
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
	
	//�븘�씠�뵒 以묐났 泥댄겕
	@RequestMapping(value = "/memeber/idcheck.do") 
	public @ResponseBody Map check(MemberVo registMember, HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		MemberVo selectMemberVo = new MemberVo();
		
		selectMemberVo = memberService.selectMember(registMember);
		if(selectMemberVo != null) {
			map.put("resultMsg", "fail");
		} else {
			map.put("resultMsg", "success");
		}
		return map;
	}
	
	
	@RequestMapping(value="/admin/qnaview.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int QNACODE,
			@RequestParam int curPage,
			HttpSession session) throws Exception{
		
		qnaService.increaseViewcnt(QNACODE);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/qnaview");
		mav.addObject("dto", qnaService.read(QNACODE));
		mav.addObject("curpage", curPage);
		return mav;
		
	}
	
	@RequestMapping(value="/admin/delete.do", method=RequestMethod.GET)
	public String updat(
			@RequestParam int QNACODE) throws Exception{
		qnaService.delete(QNACODE);
		return "redirect:/admin/qnaList";
	}
	
	//愿�由ъ옄 �럹�씠吏� �쉶�썝 由ъ뒪�듃
	@RequestMapping(value = "/admin/memberList")
	public ModelAndView memberList(
			@RequestParam(defaultValue="1") int curPage,
			Locale locale, Model model, HttpServletRequest request) throws Exception {
		
		int count = memberService.selectBoardCount();
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<MemberVo> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/memberList");
		
		//�쉶�썝 媛��졇�삤湲� - check
		try {
			list = memberService.listMember(start, end, "", "");
			map.put("list", list);
			map.put("count", count);
			map.put("pager", pager);
		} catch (Exception e) {
			
		}
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("count", count);
		return mav;
	}
	
	//愿�由ъ옄 �럹�씠吏� 媛앹떎 �삁�빟
		@RequestMapping(value = "/admin/reservationList")
		public ModelAndView reservationList(
				@RequestParam(defaultValue="1") int curPage,
				Locale locale, Model model, HttpServletRequest request) throws Exception {
			int count = reservationService.countReservation();
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<ReservationVo> list = null;
			Map<String, Object> map = new HashMap<String, Object>();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/admin/reservationList");
			
			//�삁�빟 由ъ뒪�듃 媛��졇�삤湲�
			try {
				list = reservationService.listReservation(start, end, "", "");
				map.put("list", list);
				map.put("count", count);
				map.put("pager", pager);
			} catch (Exception e) {
				
			}
			mav.addObject("list", list);
			mav.addObject("pager", pager);
			mav.addObject("count", count);
			return mav;
		}
	
	
	@RequestMapping(value = "/admin/roomList")
	public String roomList(Locale locale, Model model, HttpServletRequest request) throws Exception {
		List<RoomVo> roomList = null;
		
		//회원 가져오기 - check
		try {
			roomList = roomService.listRoom();
		} catch (Exception e) {
			
		}
		model.addAttribute("roomList", roomList);
		return "admin/roomList";
	}
	
	
	
	@RequestMapping(value = "/admin")
	public String admin(Locale locale, Model model, HttpServletRequest request) throws Exception {
		return "/admin/admin";
	}

	//�떖�젰�뿉 �삁�빟 �쁽�솴 �몴�떆
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
		//寃��깋 �궇吏�
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//寃��깋 �궇吏� end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//�떎吏덉쟻�씤 �떖�젰 �뜲�씠�꽣 由ъ뒪�듃�뿉 �뜲�씠�꽣 �궫�엯 �떆�옉.
		//�씪�떒 �떆�옉 �씤�뜳�뒪源뚯� �븘臾닿쾬�룄 �뾾�뒗 �뜲�씠�꽣 �궫�엯
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//�궇吏� �궫�엯
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//�떖�젰 鍮덇납 鍮� �뜲�씠�꽣濡� �궫�엯
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		//諛곗뿴�뿉 �떞�쓬
		model.addAttribute("dateList", dateList);		//�궇吏� �뜲�씠�꽣 諛곗뿴
		model.addAttribute("today_info", today_info);
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("reservationList", reservationList);
		return "/admin/reservation";
	}
	
/*
	//�삁�빟�씠 媛��뒫�븳 諛⑹씤吏� �솗�씤
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

	
	//�삁�빟�솕硫댁뿉�꽌 �삁�빟�씠 媛��뒫�븳吏� �솗�씤
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
*/	
	
	
	//�삁�빟�럹�씠吏�
	@RequestMapping(value = "/admin/reservate.do", method = RequestMethod.GET)
	public String reservate(Model model, HttpServletRequest request) throws Exception {
		MemberVo member = new MemberVo();
		RoomVo room = new RoomVo();
		RoomVo roomVo = new RoomVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		
		String UserName = member.getUserName();
		String UserId = member.getUserId();
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		String resdate = request.getParameter("resdate");
		room.setRoomNo(roomNo);
		roomVo = roomService.selectRoom(room);
		System.out.println("roomNo:" + roomNo);
		System.out.println("resdate:" + resdate);
		System.out.println("room" + roomVo);
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("resdate", resdate);
		model.addAttribute("member", member);
		model.addAttribute("room", roomVo);
		return "/admin/reservation2";
	}

	//�삁�빟�럹�씠吏�
	@RequestMapping(value = "/admin/reservateAction.do")
	public @ResponseBody Map reservateAction(ReservationVo reservation, HttpServletRequest request) throws Exception {
		HashMap<String, Object> roomMap = new HashMap();
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		
		String checkIn = reservation.getReservationCheckIn();
		String checkOut = reservation.getReservationCheckOut();
		String roomNo = Integer.toString(reservation.getRoomCode());
		
		String mile = reservation.getMileage();
		String originmile = member.getUserMile();
		int totalmile = Integer.parseInt(mile) + Integer.parseInt(originmile);
		
		String grade = "";
		if(totalmile == 0) {
			grade = "NEW";
		} else if(totalmile < 10000) {
			grade = "SILVER";
		} else if(totalmile < 30000) {
			grade = "GOLD";
		} else if(totalmile < 60000) {
			grade = "PLATINUM";
		} else if(totalmile < 100000) {
			grade = "DIAMOND";
		} else if(totalmile < 150000) {
			grade = "VIP";
		} else if(totalmile < 300000) {
			grade = "VVIP";
		}
		System.out.println("mile: " + Integer.toString(totalmile));
		
		roomMap.put("ReservationCheckIn", checkIn);
		roomMap.put("ReservationCheckOut", checkOut);
		roomMap.put("roomNo", roomNo);
		
		int resCnt = roomService.findRoom(roomMap);
		
		Map resultmap = new HashMap();
		if(resCnt == 0) {
			member.setUserMile(Integer.toString(totalmile));
			member.setUserGrade(grade);
			memberService.updateMile(member);
			memberService.updateGrade(member);
			reservationService.insertReservation(reservation);
			resultmap.put("resultMsg", "success");
		} else {
			resultmap.put("resultMsg", "fail");
		}
		
		return resultmap;
	}
	
	//�삁�빟 �긽�꽭 �럹�씠吏�
	@RequestMapping(value = "/admin/reservationDetailAction.do", method = RequestMethod.GET) 
	public String reservationDetailAction(Model model, HttpServletRequest request) throws Exception { 
		ReservationVo reservation = new ReservationVo();
		ReservationVo resultVo = new ReservationVo();
		
		String ReservationCode = request.getParameter("reservationCode");
		
		reservation.setReservationCode(ReservationCode);
		resultVo = reservationService.selectReservation(reservation);
		
		System.out.println("result: " + resultVo);
		
		model.addAttribute("reservationVo", resultVo);
		
		return "/admin/reservationDetail"; 
	}
	
	@RequestMapping(value = "/admin/reservationDelete.do")
	public @ResponseBody Map resDelete(Model model, HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		ReservationVo reservation = new ReservationVo();
		ReservationVo resultVo = new ReservationVo();
		
		String ReservationCode = request.getParameter("rcode");
		reservation.setReservationCode(ReservationCode);
		resultVo = reservationService.selectReservation(reservation);
		
		MemberVo member = new MemberVo();
		HttpSession session = request.getSession();
		member = (MemberVo) session.getAttribute("member");
		
		String mile = resultVo.getMileage();
		String originmile = member.getUserMile();
		int totalmile = Integer.parseInt(originmile) -  Integer.parseInt(mile); 

		System.out.println("mile: " + Integer.toString(totalmile));
		
		member.setUserMile(Integer.toString(totalmile));
		memberService.updateMile(member);
		reservationService.deleteReservation(reservation);
		map.put("resultMsg", "Success");
		return map;
	}

	@RequestMapping(value = "/admin/memberDelete")
	public String memberDelete(Model model, HttpServletRequest request) throws Exception {
		MemberVo member = new MemberVo();
		String userId = request.getParameter("userId");
		member.setUserId(userId);
		memberService.deleteMember(member);
		return "/admin/memberList";
	}
		
	//愿�由ъ옄 �럹�씠吏��뿉�꽌 member�뿉�꽌 update踰꾪듉�쓣 �늻瑜대㈃ memberlevel�쓣 諛붽퓭以�
	@RequestMapping(value = "/admin/levelAction.do")
	public @ResponseBody Map level(MemberVo updateMember, HttpServletRequest request) throws Exception {
		Map map = new HashMap();
		memberService.updateLevel(updateMember);
		map.put("resultMsg", "Success");
		return map;
	}
	
	//愿�由ъ옄 �럹�씠吏��뿉�꽌 member�뿉�꽌 �빐�떦 �쉶�썝 �젙蹂댁� �삁�빟 �젙蹂� 媛��졇�샂
	@RequestMapping(value = "/admin/memberDetail.do")
	public String memberDetail(Model model, HttpServletRequest request) throws Exception {
		MemberVo member = new MemberVo();
		MemberVo memberDetail = new MemberVo();
		ReservationVo reservation = new ReservationVo();
		List <ReservationVo> resDetail = null;
		String UserId = request.getParameter("userId");
		member.setUserId(UserId);
		reservation.setUserId(UserId);
		
		memberDetail = memberService.selectMember(member);
		resDetail = reservationService.selectReservationList(reservation);
		model.addAttribute("memberDetail", memberDetail);
		model.addAttribute("resDetail", resDetail);
		System.out.println(memberDetail);
		
		return "/admin/memberDetail";
	}
	
	//愿�由ъ옄 �럹�씠吏��뿉�꽌 媛앹떎 �젙蹂� 媛��졇�샂
		@RequestMapping(value = "/admin/roomDetail.do")
		public String roomDetail(Model model, HttpServletRequest request) throws Exception {
			RoomVo room = new RoomVo();
			int roomNo = Integer.parseInt(request.getParameter("rno"));
			room.setRoomNo(roomNo);
			RoomVo roomdetail = new RoomVo();
			roomdetail = roomService.selectRoom(room);
			model.addAttribute("roomDetail", roomdetail);
			
			return "/admin/roomDetail";
		}
	
	//硫붿씤�솕硫�(�솃�솕硫�)
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
	

	
}