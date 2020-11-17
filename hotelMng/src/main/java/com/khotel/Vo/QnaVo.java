package com.khotel.Vo;

import java.util.Arrays;

import oracle.sql.DATE;

public class QnaVo {
	private int QNACODE;
	private String QNATITLE;
	private String QNACONTENT;
	private String QNAWRITER;
	private DATE QNAREGISTERDATE;
	private int QNAVIEWCOUNT;
	private String name;   //작성자 이름 (member 테이블과 조인)
	private String show;
	private String[] files;
	public int getQNACODE() {
		return QNACODE;
	}
	public void setQNACODE(int qNACODE) {
		QNACODE = qNACODE;
	}
	public String getQNATITLE() {
		return QNATITLE;
	}
	public void setQNATITLE(String qNATITLE) {
		QNATITLE = qNATITLE;
	}
	public String getQNACONTENT() {
		return QNACONTENT;
	}
	public void setQNACONTENT(String qNACONTENT) {
		QNACONTENT = qNACONTENT;
	}
	public String getQNAWRITER() {
		return QNAWRITER;
	}
	public void setQNAWRITER(String qNAWRITER) {
		QNAWRITER = qNAWRITER;
	}
	public DATE getQNAREGISTERDATE() {
		return QNAREGISTERDATE;
	}
	public void setQNAREGISTERDATE(DATE qNAREGISTERDATE) {
		QNAREGISTERDATE = qNAREGISTERDATE;
	}
	public int getQNAVIEWCOUNT() {
		return QNAVIEWCOUNT;
	}
	public void setQNAVIEWCOUNT(int qNAVIEWCOUNT) {
		QNAVIEWCOUNT = qNAVIEWCOUNT;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "QnaVo [QNACODE=" + QNACODE + ", QNATITLE=" + QNATITLE + ", QNACONTENT=" + QNACONTENT + ", QNAWRITER="
				+ QNAWRITER + ", QNAREGISTERDATE=" + QNAREGISTERDATE + ", QNAVIEWCOUNT=" + QNAVIEWCOUNT + ", name="
				+ name + ", show=" + show + ", files=" + Arrays.toString(files) + "]";
	}



}