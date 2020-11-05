package hotel_make.hotelmake.DTO;

public class QnaVo {

    private Integer QnaCode = null;       /*주키*/
    private String QnaTitle = null;
    private String QnaRegisterDate = null;
    private String QnaContent = null;
    private String UserId = null;   /*외래키*/

    public Integer getQnaCode() {
        return QnaCode;
    }

    public String getQnaContent() {
        return QnaContent;
    }

    public String getQnaRegisterDate() {
        return QnaRegisterDate;
    }

    public String getQnaTitle() {
        return QnaTitle;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String userId) {
        UserId = userId;
    }

    public void setQnaCode(Integer qnaCode) {
        QnaCode = qnaCode;
    }

    public void setQnaContent(String qnaContent) {
        QnaContent = qnaContent;
    }

    public void setQnaRegisterDate(String qnaRegisterDate) {
        QnaRegisterDate = qnaRegisterDate;
    }

    public void setQnaTitle(String qnaTitle) {
        QnaTitle = qnaTitle;
    }

    @Override
    public String toString() {
        return "QnaVo{" +
                "QnaCode=" + QnaCode +
                ", QnaTitle='" + QnaTitle + '\'' +
                ", QnaRegisterDate='" + QnaRegisterDate + '\'' +
                ", QnaContent='" + QnaContent + '\'' +
                ", UserId='" + UserId + '\'' +
                '}';
    }
}