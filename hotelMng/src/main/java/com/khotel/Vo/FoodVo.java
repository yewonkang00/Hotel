package hotel_make.hotelmake.DTO;

public class FoodVo {

    private Integer FoodCode = null;
    private String FoodType = null;
    private String FoodName = null;
    private Integer Price = null;
    private Integer FoodCost = null;

    public Integer getFoodCode() {
        return FoodCode;
    }

    public Integer getFoodCost() {
        return FoodCost;
    }

    public Integer getPrice() {
        return Price;
    }

    public String getFoodName() {
        return FoodName;
    }

    public String getFoodType() {
        return FoodType;
    }

    public void setFoodCode(Integer foodCode) {
        FoodCode = foodCode;
    }

    public void setFoodCost(Integer foodCost) {
        FoodCost = foodCost;
    }

    public void setFoodName(String foodName) {
        FoodName = foodName;
    }

    public void setFoodType(String foodType) {
        FoodType = foodType;
    }

    public void setPrice(Integer price) {
        Price = price;
    }


    @Override
    public String toString() {
        return "FoodVo{" +
                "FoodCode=" + FoodCode +
                ", FoodType='" + FoodType + '\'' +
                ", FoodName='" + FoodName + '\'' +
                ", Price=" + Price +
                ", FoodCost=" + FoodCost +
                '}';
    }
}