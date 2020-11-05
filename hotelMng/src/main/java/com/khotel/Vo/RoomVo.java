package com.khotel.Vo;

public class RoomVo {

    private int RoomCode = null; // PK
    private String RoomInfo = null;
    private String RoomType = null;
    private int RoomMaxpeople = null;
    private int RoomFee = null;
    private String Roomthings = null;
    private String RoomSize = null;
    private int ManagerCode = null; // FK
    private String RoonView = null;


    public int getRoomCode() {
        return RoomCode;
    }

    public void setRoomCode(int roomCode) {
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

    public int getRoomMaxpeople() {
        return RoomMaxpeople;
    }

    public void setRoomMaxpeople(int roomMaxpeople) {
        RoomMaxpeople = roomMaxpeople;
    }

    public int getRoomFee() {
        return RoomFee;
    }

    public void setRoomFee(int roomFee) {
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

    public void setRoomSize(String roomSize) {
        RoomSize = roomSize;
    }

    public int getStaffCode() {
        return StaffCode;
    }

    public void setStaffCode(int staffCode) {
        StaffCode = staffCode;
    }

    public String getRoonView() {
        return RoonView;
    }

    public void setRoonView(String roonView) {
        RoonView = roonView;
    }
}