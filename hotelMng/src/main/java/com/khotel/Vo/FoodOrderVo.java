package com.khotel.Vo;

public class FoodOrderVo() {

    private int FoodOrderCode= null; /* 주키 */
    private String FoodOrderTime = null;
    private int Order = null;
    private String UserId = null;/* 외래키 */
    /* 음식코드 삭제 */

    public int getFoodOrderCode() {
        return FoodOrderCode;
    }

    public int getOrder() {
        return Order;
    }

    public String getFoodOrderTime() {
        return FoodOrderTime;
    }

    public String getUserId() {
        return UserId;
    }

    public void setFoodOrderCode(int foodOrderCode) {
        FoodOrderCode = foodOrderCode;
    }

    public void setFoodOrderTime(String foodOrderTime) {
        FoodOrderTime = foodOrderTime;
    }

    public void setOrder(int order) {
        Order = order;
    }

    public void setUserId(String userId) {
        UserId = userId;
    }
    get
}