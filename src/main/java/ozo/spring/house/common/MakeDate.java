package ozo.spring.house.common;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
			
			cal.set(year, month, 1);
			
			String firstDay = dateFormat.format(cal.getActualMinimum(Calendar.DAY_OF_MONTH));
			
			return firstDay;
	}
	
	public String findLastDay(int year, int month) {
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		cal.set(year, month, 1);
		
		String lastDay = dateFormat.format(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		
		return lastDay;
	}

}
