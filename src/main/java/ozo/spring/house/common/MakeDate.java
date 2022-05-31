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

		// �ش� ���� 1�� ����
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
