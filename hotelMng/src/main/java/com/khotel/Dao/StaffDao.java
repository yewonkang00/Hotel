package com.khotel.Dao;

import java.util.List;

import com.khotel.Vo.StaffVo;

public interface StaffDao {
	public List<StaffVo> listStaff() throws Exception;
}
