package com.khotel.Dao;

import com.khotel.Vo.RoomVo;
import com.khotel.Vo.ReservationVo;

public interface ReservationDao {
	public ReservationVo selectReservation(ReservationVo reservationVo) throws Exception;
	public void insertReservation(ReservationVo reservationVo) throws Exception;
	public void updateReservation(ReservationVo reservationVo) throws Exception;
	public void deleteReservation(ReservationVo reservationVo) throws Exception;
}
