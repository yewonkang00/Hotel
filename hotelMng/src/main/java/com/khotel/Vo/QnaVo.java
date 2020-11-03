package com.khotel.Vo;

public class QnaVo() {

    private int QnaCode = null;       /*주키*/
    private String QnaTitle = null;
    private String QnaRegisterDate = null;
    private String QnaContent = null;
    private string UserId = null;   /*외래키*/

    public int getQnaCode() {
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

    public string getUserId() {
        return UserId;
    }

    public void setUserId(string userId) {
        UserId = userId;
    }

    public void setQnaCode(int qnaCode) {
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
}