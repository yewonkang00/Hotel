package com.khotel.DaoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khotel.Controller.HomeController;
import com.khotel.Dao.ReservationDao;
import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;

@Repository("reservationDao")
public class ReservationDaoImpl implements ReservationDao{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	SqlSessionTemplate sqlSession;

	@Override
	public void insertReservation(ReservationVo reservationVo) throws Exception {
		sqlSession.insert("reservation.insertReservation", reservationVo);
		
	}

	@Override
	public void updateReservation(ReservationVo reservationVo) throws Exception {
		sqlSession.update("reservation.updateReservation", reservationVo);
		
	}

	@Override
	public void deleteReservation(ReservationVo reservationVo) throws Exception {
		sqlSession.delete("reservation.deleteReservation", reservationVo);
		
	}

	@Override
	public ReservationVo selectReservation(ReservationVo reservationVo) throws Exception {
		return sqlSession.selectOne("reservation.selectReservation", reservationVo);
	}

	@Override
	public List<ReservationVo> selectReservationList(ReservationVo reservationVo) throws Exception {
		return sqlSession.selectList("reservation.selectReservationList", reservationVo);
	}
	
	
}
