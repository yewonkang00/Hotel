package com.khotel.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.khotel.Service.QnaService;
import com.khotel.Vo.QnaVo;

@Controller
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@Inject
	QnaService qnaService;

	@RequestMapping(value="/qna/write.do")
	public String write() {
		return "qna/writeQna";
	}


	@RequestMapping(value = "/qna/list.do")
	public ModelAndView list() throws Exception {
		List<QnaVo> list = qnaService.listAll(0, 0, "", "");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qna/list");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		mav.addObject("map", map);
		return mav;

	}

	@RequestMapping("insert.do")
	public String insert(@ModelAttribute QnaVo vo, HttpSession session) throws Exception {
		String writer = (String)session.getAttribute("userid");
		vo.setQNAWRITER(writer);
		qnaService.create(vo);
		return "redirect:/qna/list.do";
	}



} 