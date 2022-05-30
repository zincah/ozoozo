package ozo.spring.house.common;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service("makeDate")
public class MakeDate {

	// ��ȸ�� ��¥�� �Ϸ� ���ϴ� �޼ҵ�
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
	
	// ���� ��¥�� �Ϸ� ���ϴ� �޼ҵ�
	public String makeToday() {
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date today = new Date();
        
        Calendar cal = Calendar.getInstance();

        cal.setTime(today);
        cal.add(Calendar.DATE, 1);
        
        String strDate = dateFormat.format(cal.getTime());

        return strDate;

	}
	
	// ���� ù°���� ������ �� ������ �޼ҵ�
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
