package hotel_make.hotelmake.DTO;

public class ManagerVo {

    private Integer ManagerCode = null; // PK
    private String ManagerSex = null;
    private String ManagerBirth = null;
    private String ManagerName = null;
    private String ManagerPosition = null;
    private String ManagerEnterdate = null;
    private String ManagerDepartment = null;

    public Integer getManagerCode() {
        return ManagerCode;
    }

    public void setManagerCode(Integer managerCode) {
        ManagerCode = managerCode;
    }

    public String getManagerSex() {
        return ManagerSex;
    }

    public void setManagerSex(String managerSex) {
        ManagerSex = managerSex;
    }

    public String getManagerBirth() {
        return ManagerBirth;
    }

    public void setManagerBirth(String managerBirth) {
        ManagerBirth = managerBirth;
    }

    public String getManagerName() {
        return ManagerName;
    }

    public void setManagerName(String managerName) {
        ManagerName = managerName;
    }

    public String getManagerPosition() {
        return ManagerPosition;
    }

    public void setManagerPosition(String managerPosition) {
        ManagerPosition = managerPosition;
    }

    public String getManagerEnterdate() {
        return ManagerEnterdate;
    }

    public void setManagerEnterdate(String managerEnterdate) {
        ManagerEnterdate = managerEnterdate;
    }

    public String getManagerDepartment() {
        return ManagerDepartment;
    }

    public void setManagerDepartment(String managerDepartment) {
        ManagerDepartment = managerDepartment;
    }

    @Override
    public String toString() {
        return "ManagerVo{" +
                "ManagerCode=" + ManagerCode +
                ", ManagerSex='" + ManagerSex + '\'' +
                ", ManagerBirth='" + ManagerBirth + '\'' +
                ", ManagerName='" + ManagerName + '\'' +
                ", ManagerPosition='" + ManagerPosition + '\'' +
                ", ManagerEnterdate='" + ManagerEnterdate + '\'' +
                ", ManagerDepartment='" + ManagerDepartment + '\'' +
                '}';
    }
}