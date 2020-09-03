<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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
		text-align:right;
	}       
/*요청관리*/
	.waiting{
         background-color: #D27300;
         margin: 0px 3px 0px 0px;
         padding: 2px 8px;
         color: #ffffff;
         text-align: center;
         font-size: 0.75rem;
         border-radius: 2px;
	}
/*텍스트*/
	.left-font{
		text-align:left;
	}	
	
</style>

<div class="container-fluid">
	<div>
		<p class="title">요청 관리</p>
	</div>
    
    <div class="row padding32-bot">
    	<div class="col-2">
    		<input type="date" class="form-control">
    	</div>
		<div class="col-2">
			<select class="form-control">
				<option>모든 요청들</option>
				<option>승인이 필요한 요청들</option>
				<option>완료된 요청들</option>
			</select>
        </div>
        <div class="col-8 sum-request">
        	<span>총 요청수 : 3</span>
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
     			<c:forEach var="attendanceDto" items="${list}">
     				<tr>
     					<td>${attendanceDto.attendance_request_type}</td>
     					<td>${attendanceDto.member_code}</td>
     					<td>${attendanceDto.attendance_request_content}</td>
     					<td>${attendanceDto.attendance_request_cause}</td>
     					<td>
     						<div class="waiting offset-2 col-6">
     							${attendanceDto.attendance_request_management}
     						</div>
     					</td>
     					<td>
     						<fmt:parseDate value="${attendanceDto.attendance_request_today}" 
							var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${time}" pattern="MM/dd hh:mm a"/>
     					</td>
     					<td>
     						<button class="btn btn-outline-primary btn-sm">승인</button>
     						<button class="btn btn-outline-danger btn-sm">거절</button>
     					</td>
     			</tr>
     			</c:forEach>
     		</tbody>
     	</table>
     </div>
     
     
</div>

