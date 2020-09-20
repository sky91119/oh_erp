<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <!-- moment js : datepicker를 사용하기 위한 필수 의존성 파일 -->
    <script src="<%=request.getContextPath()%>/res/js/moment.min.js"></script>  
    <!-- date-range-picker -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/res/css/lightpick.css">
    <script src="<%=request.getContextPath()%>/res/js/lightpick.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />
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
		.padding15{
			padding:15px;
		}

	/*제목*/
		.title{
			font-size: 25px;
			float:left;			
			width: 50%;
			text-align:left;
        	}
        .titlediv{
        	padding-bottom:15px;
        }
        .title2{
        	font-size: 25px;
        	text-align:left;
        }
	/*총 요청수*/ 
		.sum-request{
			font-size:16px;
			text-align:right;
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
		}
	/*휴가생성요청  버튼*/	
		.plz{
         	text-align: center;	
		}	
		
		.textarea{
			resize: none;
			width:100%;
			border:1px solid #ced4da;
		}
		
		.text-right{
			float:right;
		}

	/*요청관리 상태별 조회*/	
		.manage{
			background-color:lightgray;	
		}
	
	/*텍스트*/
		.left-font{
			text-align:left;
		}
		
		.left-float40{
			float:left;			
			width: 38%;
			text-align:left;
		}
		
		.left-float60{
			float:left;			
			width: 62%;
			text-align:left;
		}
		.inline{
			display:inline;
		}
	/*승인 수락 버튼*/
		.btn-group-sm>.btn, .btn-sm {
   			 padding: .25rem .5rem;
   			 font-size: .875rem;
   			 line-height: 1.4;
  		  	 border-radius: .2rem;
		}	
		
		
	
	</style>

    <script>
        window.onload = function(){
            var options = {
                //대상 지정
                field: document.querySelector(".picker-start"),
                
                //두 번째 대상 지정
                secondField: document.querySelector(".picker-end"),
                
                //날짜 표시 형식 지정
                format: 'YYYY-MM-DD',
                
                //한 화면에 표시될 달의 개수
                numberOfMonths: 2,
                
                //시작일 지정
                //minDate:new Date(),//- 오늘부터 선택 가능
               // minDate:moment(new Date()).add(1, 'days'),
                
                //문서에 포함시켜 표시
                //inline:true,

                //시작요일(1:월 ~ 7:일)
                firstDay: 7,
                
                //자동으로 닫히지 않도록 설정
                //autoclose: false,
                
                //선택 방향 제어
                selectForward: true,
                selectBackword: false,
                
                //주말 제외
                disableWeekends:false,
                
                //날짜 제외
                disableDates:[
                ],
                
                //선택 후 이벤트 설정(start와 end는 momentjs의 객체)
                onSelect:function(start, end){
                    if(!start || !end) return; //둘 중 하나라도 없으면 계산 중지
                    var days = end.diff(start, 'days') + 1;
                    console.log(days);
                }
            };
            var picker = new Lightpick(options);
        };
      
    </script>
    
    <div class="container-fluid left-font">
    
		<div class="row titlediv">
			<span class="col-11 title">휴가 생성 요청</span>
		</div>
		<div class="row padding32-bot">
		<form action=${pageContext.request.contextPath}/attendance/request_do method="post">
				<span>휴가 유형 </span>
<%-- 				<input type="hidden" name="writer" value="${userinfo.member_code}"> --%>
				<select class="inline form-control col-6" name="requtype">
					<option value="">선택 안됨</option>
					<option value="오전반차">오전 반차</option>
					<option value="오후연차">오후 반차</option>
					<option value="연차">연차</option>
				</select>
				<br>
				<br>
				<span>요청 날짜</span>
					<input type="text" class="inline form-control picker-start col-5" name="restartDate" placeholder="시작날짜" value="${map.restartDate}">
  					<input type="text" class="inline form-control picker-end col-5" name="refinishDate" placeholder="종료날짜" value="${map.refinishDate}">
				<br>
				<br>
				<span>요청 사유</span>
				<br>
				<textarea class="textarea" rows="6" cols="63" name="cause" placeholder="요청 사유를 입력하세요.(필수)"></textarea>
				<br>
				<input type="submit" value="요청" class="text-right btn btn-outline-primary">
			</form>
		</div>
	</div>
    