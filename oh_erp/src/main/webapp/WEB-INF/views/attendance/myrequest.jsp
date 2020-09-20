<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <!-- moment js : datepicker를 사용하기 위한 필수 의존성 파일 -->
    <script src="<%=request.getContextPath()%>/res/js/moment.min.js"></script>  
    <!-- date-range-picker -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/res/css/lightpick.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/res/css/myrequest.css">
    <script src="<%=request.getContextPath()%>/res/js/lightpick.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />

	<%if(request.getParameter("reque_error") != null) { %>
	<script>
		alert("휴가 유형,날짜 선택 후 사유를 입력해주세요.");
	</script>
	<%} %>
	
    <script>
        window.onload = function(){
            var start = document.querySelectorAll(".picker-start");//2개 , start[0] , start[1]
            var end = document.querySelectorAll(".picker-end");//2개 , end[0] , end[1]
            
            var options = {
                    //대상 지정
                    field: start[0],
                    
                    //두 번째 대상 지정
                    secondField: end[0],
                    
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
                
                options = {
                   //대상 지정
                   field: start[1],
                   
                   //두 번째 대상 지정
                   secondField: end[1],
                   
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
               picker = new Lightpick(options);
        };
      
    </script>
    
   
<div class="container-fluid">
	<div class="row titlediv">
		<span class="col-11 title">요청 내역</span>
		<button type="button" class="col-1 btn btn-primary btn-sm plz" data-toggle="modal" data-target="#myModal">
			휴가 생성 요청
		</button>
	</div>
	<!-- 모달 창 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" align="left">
  	<div class="modal-dialog" role="document">
    	<div class="modal-content">
      	<div class="modal-header">
      		<p class="title2">휴가 생성 요청</p>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<!--          <h4 class="modal-title" id="myModalLabel"></h4>-->
      	</div>
      	<div class="modal-body">
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
      	<div class="modal-footer">
        	<button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>
      	</div>
    	</div>
  	</div></div>
	<!-- -------------------------- -->

    <div class="row padding32-bot">
    	
    	    	<!-- 조회 날짜 선택 -->
    	<div class="col-6 margin1">
    		<form action=${pageContext.request.contextPath}/attendance/myrequest method="post">
    			<div class="left-float40 inline">
    				<input type="text" class="inline form-control picker-start col-5" name="startDate" placeholder="시작날짜" value="${map.startDate}">
  					<input type="text" class="inline form-control picker-end col-5" name="finishDate" placeholder="종료날짜" value="${map.finishDate}">
  				</div>
   
		<!-- 상태 선택 -->
				<div class="left-float60">
					<select class="inline form-control col-6" name="type" onchange="this.form.submit()">
						<option value="" class="manage">${map.type}</option>
						<option value="모든 요청들">모든 요청들</option>
						<option value="승인이 필요한 요청들">승인이 필요한 요청들</option>
						<option value="완료된 요청들">완료된 요청들</option>
					</select>
				</div>
			</form>
        </div>
        
        <div class="col-6 sum-request">
        	<span>총 요청수 : ${mylistCnt} </span>
        </div>

     </div>
     
     <div>
     	<table class="table left-font">
     		<thead>
     			<tr>
     				<th>요청 종류</th>
     				<th>요청 보낸 사람</th>
     				<th>요청 사항</th>
     				<th>요청 사유</th>
     				<th>상태</th>
     				<th>신청일자</th>
     			</tr>
     		</thead>
     		<tbody>
     			<c:forEach var="memberRequestDto" items="${list}">
     				<tr>	
     					<td>${memberRequestDto.attendance_request_type}</td>
     					<td>${memberRequestDto.member_name}</td>
     					<td>${memberRequestDto.attendance_request_content}</td>
     					<td>${memberRequestDto.attendance_request_cause}</td>
     					<td>
							<c:set var="manage" value="${memberRequestDto.attendance_request_management}" />
							<c:choose>
								<c:when test="${manage eq '거절됨'}">
									<div class="no offset-2 col-6">
     									${memberRequestDto.attendance_request_management}
     								</div>
								</c:when>
								<c:when test="${manage eq '승인됨'}">
								  	 <div class="ok offset-2 col-6">
     									${memberRequestDto.attendance_request_management}
     								</div>
								</c:when>
								<c:otherwise>
									<div class="waiting offset-2 col-6">
     									${memberRequestDto.attendance_request_management}
     								</div>
								</c:otherwise>
							</c:choose>			
     					</td>
     					<td>
     						<fmt:parseDate value="${memberRequestDto.attendance_request_today}" 
							var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${time}" pattern="MM/dd hh:mm a"/>
     					</td>
     			</tr>
     			</c:forEach>
     		</tbody>
     	</table>
     </div>
</div>