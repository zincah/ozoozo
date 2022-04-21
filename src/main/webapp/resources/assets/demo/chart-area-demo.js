// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#292b2c";

// get Date
var today = new Date();
var month = today.getMonth() + 1;

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: "line",
  data: {
    labels: [month + "/" + (today.getDate() - 7), month + "/" + (today.getDate() - 6), month + "/" + (today.getDate() - 5), month + "/" + (today.getDate() - 4), month + "/" + (today.getDate() - 3), month + "/" + (today.getDate() - 2), month + "/" + (today.getDate() - 1), month + "/" + today.getDate()],
    datasets: [
      {
        label: "Sessions",
        lineTension: 0.3,
        backgroundColor: "rgba(255, 119, 142, 0.224)",
        borderColor: "rgba(255, 119, 142)",
        pointRadius: 5,
        pointBackgroundColor: "rgba(255, 119, 142)",
        pointBorderColor: "rgba(255,255,255,0.8)",
        pointHoverRadius: 5,
        pointHoverBackgroundColor: "rgba(255, 119, 142)",
        pointHitRadius: 50,
        pointBorderWidth: 2,
        data: [28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451],
      },
    ],
  },
  options: {
    scales: {
      xAxes: [
        {
          time: {
            unit: "date",
          },
          gridLines: {
            display: false,
          },
          ticks: {
            maxTicksLimit: 7,
          },
        },
      ],
      yAxes: [
        {
          ticks: {
            min: 0,
            max: 50000,
            maxTicksLimit: 5,
          },
          gridLines: {
            color: "rgba(0, 0, 0, .125)",
          },
        },
      ],
    },
    legend: {
      display: false,
    },
  },
});
