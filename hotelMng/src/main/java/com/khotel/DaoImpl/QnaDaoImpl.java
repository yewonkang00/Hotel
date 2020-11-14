package com.khotel.DaoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khotel.Dao.QnaDao;
import com.khotel.Vo.QnaVo;


@Repository("QnaDao")
public class QnaDaoImpl implements QnaDao {

	@Autowired 
	SqlSessionTemplate sqlSession;

	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getAttach(int QNACODE) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullName, int QNACODE) {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(QnaVo vo) throws Exception {
		sqlSession.insert("qna.insert", vo);

	}

	@Override
	public QnaVo read(int QNACODE) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(QnaVo vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int QNACODE) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<QnaVo> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return sqlSession.selectList("QNA.listAll");
	}

	@Override
	public void increaseViewcnt(int QNACODE) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}