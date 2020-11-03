package com.khotel.Vo;

public class FoodVo() {

    private int FoodCode = null;
    private String FoodType = null;
    private String FoodName = null;
    private int Price = null;
    private int FoodCost = null;

    public int getFoodCode() {
        return FoodCode;
    }

    public int getFoodCost() {
        return FoodCost;
    }

    public int getPrice() {
        return Price;
    }

    public String getFoodName() {
        return FoodName;
    }

    public String getFoodType() {
        return FoodType;
    }

    public void setFoodCode(int foodCode) {
        FoodCode = foodCode;
    }

    public void setFoodCost(int foodCost) {
        FoodCost = foodCost;
    }

    public void setFoodName(String foodName) {
        FoodName = foodName;
    }

    public void setFoodType(String foodType) {
        FoodType = foodType;
    }

    public void setPrice(int price) {
        Price = price;
    }


    Member member = new Member();
    Reservation reservation = new Reservation();

    reservation.getUser
}