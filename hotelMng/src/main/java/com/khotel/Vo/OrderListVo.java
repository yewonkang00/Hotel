package com.khotel.Vo;

public class OrderList() {
    private int FoodOrderCode = null;
    private int FoodCode = null;

    public int getFoodOrderCode() {
        return FoodOrderCode;
    }

    public int getFoodCode() {
        return FoodCode;
    }

    public void setFoodOrderCode(int foodOrderCode) {
        FoodOrderCode = foodOrderCode;
    }

    public void setFoodCode(int foodCode) {
        FoodCode = foodCode;
    }
}