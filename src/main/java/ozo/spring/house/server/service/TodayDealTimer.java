package ozo.spring.house.server.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class TodayDealTimer {
	
	public void dealTimer() {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		System.out.println("timer : " + sdf.format(new Date()));
	}

}
