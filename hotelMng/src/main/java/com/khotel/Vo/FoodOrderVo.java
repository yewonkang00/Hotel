package hotel_make.hotelmake.DTO;

public class FoodOrderVo {

    private Integer FoodOrderCode= null; /* 주키 */
    private String FoodOrderTime = null;
    private Integer Order = null;
    private String UserId = null;/* 외래키 */
    /* 음식코드 삭제 */

    public Integer getFoodOrderCode() {
        return FoodOrderCode;
    }

    public Integer getOrder() {
        return Order;
    }

    public String getFoodOrderTime() {
        return FoodOrderTime;
    }

    public String getUserId() {
        return UserId;
    }

    public void setFoodOrderCode(Integer foodOrderCode) {
        FoodOrderCode = foodOrderCode;
    }

    public void setFoodOrderTime(String foodOrderTime) {
        FoodOrderTime = foodOrderTime;
    }

    public void setOrder(Integer order) {
        Order = order;
    }

    public void setUserId(String userId) {
        UserId = userId;
    }
}