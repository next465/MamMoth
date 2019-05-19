package kr.mycom.mytest.service;

import java.util.List;

import kr.mycom.mytest.model.Month_Board_ListVO;
import kr.mycom.mytest.model.Month_Board_ViewVO;
import kr.mycom.mytest.model.WriteFormPersonDataVO;
import kr.mycom.mytest.model.searchMonthBoardViewVO;

public interface Month_BoardService {

	public List<Month_Board_ListVO> listAll() throws Exception;
	public WriteFormPersonDataVO writeInfo() throws Exception;
	public Month_Board_ViewVO mView(searchMonthBoardViewVO vo) throws Exception;
	
}
