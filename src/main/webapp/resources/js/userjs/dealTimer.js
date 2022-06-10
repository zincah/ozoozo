/**
 *  datebase에서 deal 끝나는 시간 받아와서 띄워주기
 */

	// timer 설정하기
	const getTime =()=>{
	
		// 현재 시간 받아오기
		const now = new Date();
		let year = now.getFullYear();
		let month = now.getMonth();
		let days = now.getDate();
		let hours = now.getHours();
 		let minutes = now.getMinutes();
		let seconds = now.getSeconds();
		
		hours = hours < 10 ? `0`+hours : hours;
		minutes = minutes < 10 ? `0`+minutes : minutes;
		seconds = seconds < 10 ? `0`+seconds : seconds;
		
		//var dealtimelist = ${dealtimelist};
		
		// deal 종료 시간 계산
		for(var i=0; i<dealtimelist.length; i++){
			var dealtime = dealtimelist[i];
			var postid = dealtime.deal_postid;
			var endtime = dealtime.deal_endtime;

			var s_t = endtime.replaceAll('"', '').split(' ');

			var datelayer = s_t[0];
			var timelayer = s_t[1];

			var s_date = datelayer.split("-");
			var endY = s_date[0];
			var endM = s_date[1];
			var endD = s_date[2];
			
			var s_time = timelayer.split(":");
			var endh = s_time[0];
			var endm = s_time[1];
			var ends = s_time[2];
			
			var date1 = new Date(year, month, days, hours, minutes, seconds);
			var date2 = new Date(endY, endM-1, endD, endh, endm, ends);
			
			if(endM < month || endD  < days){
				//console.log("date1 " + date1 + " date2 " + date2);
			}
			var makeSec = parseInt((date2.getTime() - date1.getTime())/1000%60);
			var makeMin = parseInt((date2.getTime() - date1.getTime())/1000/60%60);
			var makeHou = parseInt((date2.getTime() - date1.getTime())/1000/3600);
			
			if(makeHou == 0 && makeMin == 0 && makeSec == 0){
				location.reload();
			}
			
			makeMin = makeMin < 10 ? `0`+makeMin : makeMin;
			makeSec = makeSec < 10 ? `0`+makeSec : makeSec;
			
			var timer = makeHou + ":" + makeMin + ":" + makeSec;
			$(".b_" + postid).find('div').text(timer);

		}
	}
	
	getTime();
	setInterval(getTime, 1000);
	
