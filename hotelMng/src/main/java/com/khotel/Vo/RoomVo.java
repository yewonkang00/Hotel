package hotel_make.hotelmake.DTO;

public class RoomVo {

    private Integer RoomCode = null; // PK
    private String RoomInfo = null;
    private String RoomType = null;
    private Integer RoomMaxpeople = null;
    private Integer RoomFee = null;
    private String Roomthings = null;
    private String RoomSize = null;
    private Integer ManagerCode = null; // FK
    private String RoonView = null;


    public Integer getRoomCode() {
        return RoomCode;
    }

    public void setRoomCode(Integer roomCode) {
        RoomCode = roomCode;
    }

    public String getRoomInfo() {
        return RoomInfo;
    }

    public void setRoomInfo(String roomInfo) {
        RoomInfo = roomInfo;
    }

    public String getRoomType() {
        return RoomType;
    }

    public void setRoomType(String roomType) {
        RoomType = roomType;
    }

    public Integer getRoomMaxpeople() {
        return RoomMaxpeople;
    }

    public void setRoomMaxpeople(Integer roomMaxpeople) {
        RoomMaxpeople = roomMaxpeople;
    }

    public Integer getRoomFee() {
        return RoomFee;
    }

    public void setRoomFee(Integer roomFee) {
        RoomFee = roomFee;
    }

    public String getRoomthings() {
        return Roomthings;
    }

    public void setRoomthings(String roomthings) {
        Roomthings = roomthings;
    }

    public String getRoomSize() {
        return RoomSize;
    }

    public void setRoomSize(String roomSize) { RoomSize = roomSize; }

    public Integer getStaffCode() {
        return ManagerCode;
    }

    public void setStaffCode(Integer staffCode) {
        ManagerCode = staffCode;
    }

    public String getRoonView() {
        return RoonView;
    }

    public void setRoonView(String roonView) {
        RoonView = roonView;
    }

    @Override
    public String toString() {
        return "RoomVo{" +
                "RoomCode=" + RoomCode +
                ", RoomInfo='" + RoomInfo + '\'' +
                ", RoomType='" + RoomType + '\'' +
                ", RoomMaxpeople=" + RoomMaxpeople +
                ", RoomFee=" + RoomFee +
                ", Roomthings='" + Roomthings + '\'' +
                ", RoomSize='" + RoomSize + '\'' +
                ", ManagerCode=" + ManagerCode +
                ", RoonView='" + RoonView + '\'' +
                '}';
    }
}