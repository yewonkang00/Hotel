package com.khotel.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	

	@RequestMapping(value = "/room_main.do", method = RequestMethod.GET)
	   public String room_main(Locale locale, Model model) {
	      logger.info("Welcome home! The client locale is {}.", locale);
	
	      Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	      String formattedDate = dateFormat.format(date);
	
	      model.addAttribute("serverTime", formattedDate );
	
	      return "/room/room_main";
	   }
	
	@RequestMapping(value = "/room_standard.do", method = RequestMethod.GET)
	   public String room_standard(Locale locale, Model model) {
	      logger.info("Welcome home! The client locale is {}.", locale);
	
	      Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
	      String formattedDate = dateFormat.format(date);
	
	      model.addAttribute("serverTime", formattedDate );
	
	      return "/room/standard_room";
	   }

	@RequestMapping(value = "/room_deluxe.do", method = RequestMethod.GET)
	public String room_deluxe(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "/room/deluxe_room";
	}

	@RequestMapping(value = "/room_executive.do", method = RequestMethod.GET)
	public String room_executive(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "/room/executive_room";
	}

	@RequestMapping(value = "/room_suite.do", method = RequestMethod.GET)
	public String room_suite(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "/room/suite_room";
	}

	
}