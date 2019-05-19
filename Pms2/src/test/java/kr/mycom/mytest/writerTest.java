package kr.mycom.mytest;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.mycom.mytest.model.Month_Board_ListVO;
import kr.mycom.mytest.model.Month_Board_ViewVO;
import kr.mycom.mytest.model.WriteFormPersonDataVO;
import kr.mycom.mytest.persistence.Month_BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class writerTest {
	@Inject
	private Month_BoardDAO dao;
	@Test
	public void writerInf() {
		try {
			List<Month_Board_ListVO> vo=dao.listAll();
			System
			.out.println(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
