package com.khotel.Vo;

public class ReservationVo {
	private String ReservationCode = null;
	private String ReservationCheckIn = null;
	private String ReservationCheckOut = null;
	private String ReservationPeopleNumber = null;
	private String ReservationDate = null;
	private String ReservationMemo = null;
	private String UserId = null;
	private int RoomCode = 0;
	private int ReservationDays = 0;
	private String Breakfast = null;
	private String TotalPrice = null;
	private String Mileage = null;
	
	public String getReservationCode() {
		return ReservationCode;
	}
	public void setReservationCode(String reservationCode) {
		ReservationCode = reservationCode;
	}
	public String getReservationCheckIn() {
		return ReservationCheckIn;
	}
	public void setReservationCheckIn(String reservationCheckIn) {
		ReservationCheckIn = reservationCheckIn;
	}
	public String getReservationCheckOut() {
		return ReservationCheckOut;
	}
	public void setReservationCheckOut(String reservationCheckOut) {
		ReservationCheckOut = reservationCheckOut;
	}
	public String getReservationPeopleNumber() {
		return ReservationPeopleNumber;
	}
	public void setReservationPeopleNumber(String reservationPeopleNumber) {
		ReservationPeopleNumber = reservationPeopleNumber;
	}
	public String getReservationDate() {
		return ReservationDate;
	}
	public void setReservationDate(String reservationDate) {
		ReservationDate = reservationDate;
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public int getRoomCode() {
		return RoomCode;
	}
	public void setRoomCode(int roomCode) {
		RoomCode = roomCode;
	}
	public String getReservationMemo() {
		return ReservationMemo;
	}
	public void setReservationMemo(String reservationMemo) {
		ReservationMemo = reservationMemo;
	}
	public int getReservationDays() {
		return ReservationDays;
	}
	public void setReservationDays(int reservationDays) {
		ReservationDays = reservationDays;
	}
	public String getBreakfast() {
		return Breakfast;
	}
	public void setBreakfast(String breakfast) {
		Breakfast = breakfast;
	}
	public String getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		TotalPrice = totalPrice;
	}
	public String getMileage() {
		return Mileage;
	}
	public void setMileage(String mileage) {
		Mileage = mileage;
	}
	
	

}
