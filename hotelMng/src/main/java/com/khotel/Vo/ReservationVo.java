package hotel_make.hotelmake.DTO;

public class ReservationVo {
	private String ReservationCode = null;
	private String ReservationCheckIn = null;
	private String ReservationCheckOut = null;
	private String ReservationPeopleNumber = null;
	private String ReservationDate = null;
	private String UserId = null;
	private Integer RoomCode = null;
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
	public Integer getRoomCode() {
		return RoomCode;
	}
	public void setRoomCode(Integer roomCode) {
		RoomCode = roomCode;
	}
	
	

}
