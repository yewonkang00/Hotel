package hotel_make.hotelmake.DTO;

class OrderListVO {
    private Integer FoodOrderCode = null;
    private Integer FoodCode = null;

    public Integer getFoodOrderCode() {
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