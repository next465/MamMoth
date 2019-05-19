package kr.mycom.mytest.model;

import java.util.Date;

public class Month_Board_ListVO {

	private int month_Board_INDEX;
	private String employee_NAME;
	private String department_NAME;
	private String month_Board_TITLE;
	private String month_Board_Posting_DATE;
	private Date mBoardPos;
	private String month_Board_Repost_DATE;
	private Date mBoardRep;
	
	
	
	public String getMonth_Board_Posting_DATE() {
		return month_Board_Posting_DATE;
	}
	public void setMonth_Board_Posting_DATE(String month_Board_Posting_DATE) {
		this.month_Board_Posting_DATE = month_Board_Posting_DATE;
	}
	public Date getmBoardPos() {
		return mBoardPos;
	}
	public void setmBoardPos(Date mBoardPos) {
		this.mBoardPos = mBoardPos;
	}
	public String getMonth_Board_Repost_DATE() {
		return month_Board_Repost_DATE;
	}
	public void setMonth_Board_Repost_DATE(String month_Board_Repost_DATE) {
		this.month_Board_Repost_DATE = month_Board_Repost_DATE;
	}
	public Date getmBoardRep() {
		return mBoardRep;
	}
	public void setmBoardRep(Date mBoardRep) {
		this.mBoardRep = mBoardRep;
	}
	public int getMonth_Board_INDEX() {
		return month_Board_INDEX;
	}
	public void setMonth_Board_INDEX(int month_Board_INDEX) {
		this.month_Board_INDEX = month_Board_INDEX;
	}
	public String getEmployee_NAME() {
		return employee_NAME;
	}
	public void setEmployee_NAME(String employee_NAME) {
		this.employee_NAME = employee_NAME;
	}
	public String getDepartment_NAME() {
		return department_NAME;
	}
	public void setDepartment_NAME(String department_NAME) {
		this.department_NAME = department_NAME;
	}
	public String getMonth_Board_TITLE() {
		return month_Board_TITLE;
	}
	public void setMonth_Board_TITLE(String month_Board_TITLE) {
		this.month_Board_TITLE = month_Board_TITLE;
	}
	
}
