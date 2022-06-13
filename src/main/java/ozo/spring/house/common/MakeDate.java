package ozo.spring.house.common;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

@Service("makeDate")
public class MakeDate {

	// 조회한 날짜에 하루 더하는 메소드
	public String makedate(String enddate) {

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;

        try {
               date = dateFormat.parse(enddate);
        } catch (ParseException e) {
               e.printStackTrace();
        }

        Calendar cal = Calendar.getInstance();

        cal.setTime(date);
        cal.add(Calendar.DATE, 1);

        String strDate = dateFormat.format(cal.getTime());

        return strDate;
	}
	
	// 현재 날짜에 하루 더하는 메소드
	public String makeToday() {
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date today = new Date();
        
        Calendar cal = Calendar.getInstance();

        cal.setTime(today);
        cal.add(Calendar.DATE, 1);
        
        String strDate = dateFormat.format(cal.getTime());

        return strDate;

	}
	
	// 달의 첫째날과 마지막 날 얻어오는 메소드
	public String findFirstDay(int year, int month) {
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			
			cal.set(year, month-1, 1);
			String firstDay = dateFormat.format(cal.getTime());
			
			return firstDay;
	}
	
	public String findLastDay(int year, int month) {
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		cal.set(year, month, 1);
		int lDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		cal.set(year, month, lDay);
		String lastDay = dateFormat.format(cal.getTime());

		return lastDay;
	}
	
	public List<String> makeWholeMonth(int year, int month) {
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();

		// 해당 월의 1일 세팅
		int day = 1;
		cal.set(year, month-1, 1);
		int lday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

		List<String> monthList = new ArrayList<String>();
		
		while(true) {

			if(lday <= day) {
				break;
			}
			
			cal.set(year, month-1, day);
			String strDate = dateFormat.format(cal.getTime());
			monthList.add(strDate);
			
			day++;
			
		}

		return monthList;
	}

}
