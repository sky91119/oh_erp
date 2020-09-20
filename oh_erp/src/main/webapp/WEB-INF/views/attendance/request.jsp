<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <!-- moment js : datepicker를 사용하기 위한 필수 의존성 파일 -->
    <script src="<%=request.getContextPath()%>/res/js/moment.min.js"></script>  
    <!-- date-range-picker -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/res/css/lightpick.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/res/css/request.css">
    <script src="<%=request.getContextPath()%>/res/js/lightpick.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />

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
    
   
<div class="container-fluid">
	<div>
		<p class="title">요청 관리</p>
	</div>
    
    <div class="row padding32-bot">
    	
    	<!-- 조회 날짜 선택 -->
    	<div class="col-6">
    		<form action=${pageContext.request.contextPath}/attendance/request method="post">
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
        	<span>총 요청수 : ${listCnt} </span>
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
     				<th>관리</th>
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
     					<td>	<!-- 승인/거절 버튼 -->
     						<c:if test="${manage eq '대기중'}">
     							<form action=${pageContext.request.contextPath}/attendance/request_manage method="post">
     								<input type="hidden" name="attendance_request_no" value="${memberRequestDto.attendance_request_no}">
     								<button class="btn btn-outline-primary btn-sm" name="management" value="승인">승인</button>
     								<button class="btn btn-outline-danger btn-sm" name="management" value="거절">거절</button>
     							</form>
     								
     						</c:if>
     					</td>
     			</tr>
     			</c:forEach>
     		</tbody>
     	</table>
     </div>
     
     
</div>