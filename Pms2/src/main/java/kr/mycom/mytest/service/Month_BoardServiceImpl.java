package kr.mycom.mytest.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.mycom.mytest.model.Month_BoardVO;
import kr.mycom.mytest.model.Month_Board_ListVO;
import kr.mycom.mytest.model.Month_Board_ViewVO;
import kr.mycom.mytest.model.WriteFormPersonDataVO;
import kr.mycom.mytest.model.searchMonthBoardViewVO;
import kr.mycom.mytest.persistence.Month_BoardDAO;

@Service
public class Month_BoardServiceImpl implements Month_BoardService {
	@Inject
	Month_BoardDAO dao;

	@Override
	public List<Month_Board_ListVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public WriteFormPersonDataVO writeInfo() throws Exception {
		
		
		return dao.writerInfo();
	}

	@Override
	public Month_Board_ViewVO mView(searchMonthBoardViewVO vo) throws Exception {
		
		return dao.mView(vo);
	}

	

}
