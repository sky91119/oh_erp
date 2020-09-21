<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    
     <style>
/*마진*/	
	.margin20 {
		margin: 20px 20px 20px 20px;
	}
	
/*패딩*/
	.padding32 {
		padding:32px;
	}	
	.padding32-bot{
		padding-bottom:32px;
	}
	.padding10{
		padding:10px;
	}
/*제목*/
	.title{
		font-size: 25px;
		text-align:left;
		padding-bottom:15px;
        }
/*총 요청수*/ 
	.sum-request{
		font-size:16px;
		align:right;
	}       
/*요청관리 상태*/
	.waiting{
         background-color: #D27300;
         margin: 0px 3px 0px 0px;
         padding: 2px 8px;
         color: #ffffff;
         text-align: center;
         font-size: 0.75rem;
         border-radius: 2px;
	}
	.ok{
	     background-color: #01853d;
         margin: 0px 3px 0px 0px;
         padding: 2px 8px;
         color: #ffffff;
         text-align: center;
         font-size: 0.75rem;
         border-radius: 2px;
	}
	.no{
	 	 background-color: #bf0920;
         margin: 0px 3px 0px 0px;
         padding: 2px 8px;
         color: #ffffff;
         text-align: center;
         font-size: 0.75rem;
         border-radius: 2px;
         #bf0920
	}
/*텍스트*/
	.left-font{
		text-align:left;
		
		
		.add{
		font-size:16px;
		text-align:right;
		}
		
		.search{
		display: inline-black;
		}
	}	
	
</style>

<h1>정상출근 사원목록</h1>




<h1>지각출근 사원목록</h1>


    <script>
        $(function(){
            //차트를 그리기 전에 서버에서 데이터를 미리 불러와야 한다.
            $.get("http://localhost:8080/oherp/attendance_detail/count_page", function(response){
                console.log(response);
                //response는 배열이므로 반복문을 돌리면서 label과 data로 분리

                var label = [];
                var data = [];

                for(var i=0; i < response.length; i++){
                    label.push(response[i].month);
                    data.push(response[i].count);
                }

                //response가 label과 data로 분리가 되었기 때문에
                //이 시점 이후에 차트를 생성(차트 생성 코드가 이곳에 위치)

                //canvas는 그림을 그릴 수 있는 태그
                //- context는 그림을 그릴 수 있는 도구를 의미
                //- canvas를 이용해서 2D 또는 3D 그림을 그릴 수 있다.

                //2D 그리기 도구를 ctx라는 이름으로 저장
                var ctx = document.querySelector("#chart").getContext("2d");

                //차트 생성 코드
                var chart = new Chart(ctx, {
                    // 만들고 싶은 차트의 유형
                    type: 'bar',

                    // 실제 차트를 구성하는 데이터
                    data: {

                        //축에 표시될 라벨 정보
                        labels: label,

                        //실제 데이터
                        datasets: [{
                            label: '시간대별 출근통계표',
                            data: data, 

                            //데이터 배경색 및 테두리 색상 설정
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            
                        }],

                    },

                    // 기타 제어용 옵션
                    // - y축의 최소/최대값
                    options: {
                        scales: {
                            yAxes:[{
                                ticks:{
                                    //beginAtZero:true,     //0부터 시작
                                    suggestedMin : 0,         //최소값 지정
                                    suggestedMax : 12,    //최대값 지정
                                }
                            }]
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
    <canvas id="chart"></canvas>
</body>
</html>