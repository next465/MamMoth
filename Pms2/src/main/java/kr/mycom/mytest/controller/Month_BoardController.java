package kr.mycom.mytest.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.mycom.mytest.model.CurrentDate;
import kr.mycom.mytest.model.Month_Board_ListVO;
import kr.mycom.mytest.model.WriteFormPersonDataVO;
import kr.mycom.mytest.model.searchMonthBoardViewVO;
import kr.mycom.mytest.service.Month_BoardService;

@RequestMapping("/mboard/*")
@Controller
public class Month_BoardController {
	
	@Inject
	Month_BoardService bs;
	//월간 업무 보고 처음 진입시 보여줄 페이지
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception{
		//월간 업무 보고에서 내가 작성한 월간 업무보고를 모두 보여주는 기능
		//List<Month_Board_ListVO> list = bs.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mboard/list");
		mav.addObject("list", bs.listAll());
		
		return mav;
	}//end list
	//작성페이지
	@RequestMapping("writeForm.do")
	public ModelAndView writeForm() throws Exception{
		//월간 업무 보고에서 작성자의 정보를 보여줄 기능
		WriteFormPersonDataVO wfpd=bs.writeInfo();
		ModelAndView mav=new ModelAndView();
		
		//오늘 날짜 출력
		CurrentDate date= new CurrentDate();
		
		mav.setViewName("mboard/writeForm");
		mav.addObject("writerInfo",wfpd);
		mav.addObject("cdate",date);
		return mav;
	}
	//월간 업무 보고서 뷰
	@RequestMapping(value="monthBoardView.do", method = RequestMethod.GET)
	public ModelAndView mBoardView(@ModelAttribute searchMonthBoardViewVO vo) throws Exception {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("mboard/MonthBoardView");
		mav.addObject("mbView", bs.mView(vo));
		return mav;
	}
	
	@RequestMapping(value="sList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Month_Board_ListVO> searchList(@ModelAttribute Month_Board_ListVO vo) throws Exception{
		System.out.println(vo.getMonth_Board_Posting_DATE());
		System.out.println(vo.getMonth_Board_Repost_DATE());
//		String -> Date 형변환
//		vo.setmBoardPos(new SimpleDateFormat("yy-MM-dd").parse(sDate));

		
		
		return bs.listAll();
	}
	
}
