package com.khotel.Dao;

import java.util.HashMap;
import java.util.List;

import com.khotel.Vo.MemberVo;

public interface MemberDao {
	
	public void insertUser(MemberVo memberVo) throws Exception;
}
