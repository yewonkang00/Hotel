package com.khotel.ServiceImpl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

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

	@Inject
	MemberDao memberDao;
	
	@Override
	public List<MemberVo> selectMemberList(MemberVo memberVo) throws Exception {
		return memberDao.selectMemberList(memberVo);
	}
	
	@Override
	public MemberVo selectMember(MemberVo memberVo) throws Exception {
		return memberDao.selectMember(memberVo);
	}
	
	@Override
	public void insertMember(MemberVo memberVo) throws Exception {
		memberDao.insertMember(memberVo);
	}
	
	@Override
	public void updateMember(MemberVo memberVo) throws Exception {
		memberDao.updateMember(memberVo);
	}
	
	@Override
	public void deleteMember(MemberVo memberVo) throws Exception {
		memberDao.deleteMember(memberVo);
	}

	@Override
	public MemberVo checkId(String id) throws Exception {
		return memberDao.checkId(id);
	}

	@Override
	public List<MemberVo> listMember() throws Exception {
		return memberDao.listMember();
	}

	@Override
	public int selectBoardCount() {
		return memberDao.selectBoardCount();
	}

	@Override
	public List<MemberVo> listBlockSelect(HashMap<String, Object> map) {
		return memberDao.listBlockSelect(map);
	}

	@Override
	public MemberVo boardView(String id) {
		return memberDao.boardView(id);
	}

	@Override
	public List<MemberVo> listFindName(HashMap<String, Object> map) {
		return memberDao.listFindName(map);
	}

	@Override
	public int findNameTotal(HashMap<String, Object> map) {
		return memberDao.findNameTotal(map);
	}

	@Override
	public List<MemberVo> viewList(HashMap<String, Object> map) {
		return memberDao.viewList(map);
	}

	@Override
	public int findDateTotal(HashMap<String, Object> map) {
		return memberDao.findDateTotal(map);
	}

}