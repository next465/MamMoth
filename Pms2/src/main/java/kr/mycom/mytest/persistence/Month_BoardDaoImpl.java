package kr.mycom.mytest.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.mycom.mytest.model.Month_Board_ListVO;
import kr.mycom.mytest.model.Month_Board_ViewVO;
import kr.mycom.mytest.model.WriteFormPersonDataVO;
import kr.mycom.mytest.model.searchMonthBoardViewVO;

@Repository
public class Month_BoardDaoImpl implements Month_BoardDAO {

	@Inject
	SqlSession session;

	@Override
	public List<Month_Board_ListVO> listAll() throws Exception {

		return session.selectList("board.listAll");
	}

	@Override
	public WriteFormPersonDataVO writerInfo() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("board.writeFormPersonData");
	}

	@Override
	public Month_Board_ViewVO mView(searchMonthBoardViewVO vo) throws Exception {
		
		return session.selectOne("board.monthBoardView",vo);
	}

}
