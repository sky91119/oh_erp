<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>

/*마진*/	
	.margin100 {
		margin: 100px 100px 100px 100px;
	}
	
/*패딩*/
	.padding32 {
		padding:32px;
	}	
	.padding32-bot{
		padding-bottom:32px;
	}

/*제목*/
	.title{
		font-size: 25px;
		padding-bottom:15px;
        }
/*총 요청수*/ 
	.sum-request{
		font-size:16px;
		text-align:right;
	}       

</style>

<div class="padding32 container-fluid">
	<div>
		<p class="title">요청 관리</p>
	</div>
    
    <div class="row padding32-bot">
    	<div class="col-3">
    		<input type="date" class="form-control">
    	</div>
		<div class="col-3">
			<select class="form-control">
				<option>모든 요청들</option>
				<option>승인이 필요한 요청들</option>
				<option>완료된 요청들</option>
			</select>
        </div>
        <div class="col-6 sum-request">
        	<span>총 요청수 : 3</span>
        </div>

     </div>
     <div>
     	<table class="table">
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
     			<c:forEach var="attendanceDto" items="${list}">
     				<tr>
     					<td>${attendanceDto.attendance_request_type}</td>
     					<td>${attendanceDto.member_code}</td>
     					<td>${attendanceDto.attendance_request_content}</td>
     					<td>${attendanceDto.attendance_request_cause}</td>
     					<td>${attendanceDto.attendance_request_management}</td>
     					<td>${attendanceDto.attendance_request_today}</td>
     					<td>승인/거절</td>
     			</tr>
     			</c:forEach>
     		</tbody>
     	</table>
     </div>
     
     
</div>

