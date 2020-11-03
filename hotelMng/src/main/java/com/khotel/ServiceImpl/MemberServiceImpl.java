package com.khotel.ServiceImpl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.khotel.Controller.HomeController;
import com.khotel.Dao.MemberDao;
import com.khotel.Service.MemberService;
import com.khotel.Vo.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	private final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource(name="memberDao")
	MemberDao memberDao;



	@Override
	public void insertUser(MemberVo memberVo) throws Exception {
		memberDao.insertUser(memberVo);
	}

}