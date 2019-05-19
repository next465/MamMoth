package kr.mycom.mytest.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CurrentDate {
	
	private String today;
	
	
	public CurrentDate() {
		formatDate();
	}

	public void formatDate() {
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		this.today=sd.format(date);
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

		
}
