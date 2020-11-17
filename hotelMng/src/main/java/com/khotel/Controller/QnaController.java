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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.khotel.Service.QnaService;
import com.khotel.ServiceImpl.Pager;
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
	
	@RequestMapping(value="/qna/rewrite.do", method=RequestMethod.GET)
	public ModelAndView rewrite(@RequestParam int QNACODE,
			HttpSession session) throws Exception{
		qnaService.increaseViewcnt(QNACODE);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qna/rewriteQna");
		mav.addObject("dto", qnaService.read(QNACODE));
		return mav;
	}
	
	
	@RequestMapping(value = "/qna/list.do")
	public ModelAndView list(
			@RequestParam(defaultValue="1") int curPage
			) throws Exception {
		int count = 1000;
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<QnaVo> list = qnaService.listAll(start, end, "", "");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qna/list");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		mav.addObject("map", map);
		return mav;
	
	}
	
	@RequestMapping("/qna/insert.do")
	public String insert(@ModelAttribute QnaVo vo, HttpSession session) throws Exception {
		String writer = (String)session.getAttribute("userid");
		// if(writer == null) {} 로그인 하지 않았다면...
		vo.setQNAWRITER(writer);
		qnaService.create(vo);
		return "redirect:/qna/list.do";
	}
	
	@RequestMapping(value="/qna/view.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int QNACODE,
			@RequestParam int curPage,
			HttpSession session) throws Exception{

		qnaService.increaseViewcnt(QNACODE);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qna/view");

		mav.addObject("dto", qnaService.read(QNACODE));
		mav.addObject("curpage", curPage);
		return mav;
		
	}
	
	
	
	@RequestMapping(value="/qna/update.do", method=RequestMethod.GET)
	public String update(QnaVo vo)throws Exception {
		int QNACODE = vo.getQNACODE();
		vo = qnaService.read(QNACODE);
		qnaService.update(vo);
		return "redirect:/qna/list.do";
	}
	
	@RequestMapping(value="/qna/delete.do", method=RequestMethod.GET)
	public String updat(
			@RequestParam int QNACODE) throws Exception{
		qnaService.delete(QNACODE);
		return "redirect:/qna/list.do";
	}
	
	

}