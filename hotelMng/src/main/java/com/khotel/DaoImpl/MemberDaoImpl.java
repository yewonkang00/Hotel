package com.khotel.DaoImpl;

import java.util.HashMap;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khotel.Controller.HomeController;
import com.khotel.Dao.MemberDao;
import com.khotel.Vo.MemberVo;


@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired 
	SqlSessionTemplate sqlSession;
	

	@Override
	public void insertUser(MemberVo memberVo) throws Exception {
		sqlSession.insert("member.insertUser", memberVo);
	}
	

}