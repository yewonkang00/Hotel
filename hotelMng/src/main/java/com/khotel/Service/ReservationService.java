package com.khotel.Service;

import java.util.List;

import com.khotel.Vo.ReservationVo;
import com.khotel.Vo.RoomVo;

public interface ReservationService {
	public ReservationVo selectReservation(ReservationVo reservationVo) throws Exception;
	public void insertReservation(ReservationVo reservationVo) throws Exception;
	public void updateReservation(ReservationVo reservationVo) throws Exception;
	public void deleteReservation(ReservationVo reservationVo) throws Exception;
	public List<ReservationVo> selectReservationList(ReservationVo reservationVo) throws Exception;
}
