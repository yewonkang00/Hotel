package com.khotel.Service;

import com.khotel.Vo.ReservationVo;

public interface ReservationService {
	public ReservationVo selectReservation(ReservationVo reservationVo) throws Exception;
	public void insertReservation(ReservationVo reservationVo) throws Exception;
	public void updateReservation(ReservationVo reservationVo) throws Exception;
	public void deleteReservation(ReservationVo reservationVo) throws Exception;
}
