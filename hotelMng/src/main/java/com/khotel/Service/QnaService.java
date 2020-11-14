package com.khotel.Service;

import java.util.List;

import com.khotel.Vo.QnaVo;

public interface QnaService {
	
	public void deleteFile(String fullName); //÷������ ����
	
	public List<String> getAttach(int QNACODE); //÷������ ���
	
	public void addAttach(String fullName); //÷������ ����
	
	public void updateAttach(String fullName, int QNACODE); //÷������ ����
	
	public void create(QnaVo vo) throws Exception; //�۾���
	
	public QnaVo read(int QNACODE) throws Exception; //���б�
	
	public void update(QnaVo vo) throws Exception; //�ۼ���
	
	public void delete(int QNACODE) throws Exception; //�ۻ���
	
	
	//���(������ ������, �˻� ��� ����)
	public List<QnaVo> listAll(
			int start, int end, String search_option, String keyword) throws Exception;
	
	
	//��ȸ�� ���� ó��
	public void increaseViewcnt(int QNACODE) throws Exception;
	
	
	//���ڵ� ���� ���
	public int countArticle(String search_option, String keyword) throws Exception;
}