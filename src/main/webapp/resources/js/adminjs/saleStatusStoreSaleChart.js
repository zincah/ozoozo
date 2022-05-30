/*
*  pie chart
*/

// line chart 
$(document).ready(function(){
	
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = "#292b2c";
	
	// get Data
	var slen = $("input[name=storePayment]").length;
	var storeSaleList = [];
	for(var i=0; i<slen; i++){
		storeSaleList[i] = $("input[name=storePayment]").eq(i).val();
	}
	
	var clen = $("input[name=companyName]").length;
	var companyNameList = [];
	for(var i=0; i<clen; i++){
		companyNameList[i] = $("input[name=companyName]").eq(i).val();
	}
	
	// Area Chart Example
	var ctx = document.getElementById("myPieChart"); // myBarChart
	var myLineChart = new Chart(ctx, {
	  type: "pie",
	  data: {
	    labels: companyNameList,
	    datasets: [
	      {
			label: '판매점 매출',
			data: storeSaleList,
			backgroundColor: [
				'#EF9F9F', '#FAD4D4'
			],
			hoverOffset: 4
	      
	      }
	    ]
	  }
	 
	});
	
})
