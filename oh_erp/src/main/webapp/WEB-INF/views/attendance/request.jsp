<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
     			<tr>
     				<td>근무 일정 생성</td>
     				<td>김수미</td>
     				<td>8월 31일 (월) 9:00 AM - 1:30 PM</td>
     				<td>병원 갔다옴</td>
     				<td>대기중</td>
     				<td>08/28 10:34AM</td>
     				<td>승인/거절</td>
     			</tr>
     			<tr>
     				<td>근무 일정 생성</td>
     				<td>김수미</td>
     				<td>8월 31일 (월) 9:00 AM - 1:30 PM</td>
     				<td>병원 갔다옴</td>
     				<td>대기중</td>
     				<td>08/28 10:34AM</td>
     				<td>승인/거절</td>
     			</tr>
     			<tr>
     				<td>근무 일정 생성</td>
     				<td>김수미</td>
     				<td>8월 31일 (월) 9:00 AM - 1:30 PM</td>
     				<td>병원 갔다옴</td>
     				<td>대기중</td>
     				<td>08/28 10:34AM</td>
     				<td>승인/거절</td>
     			</tr>
     			<tr>
     				<td>근무 일정 생성</td>
     				<td>김수미</td>
     				<td>8월 31일 (월) 9:00 AM - 1:30 PM</td>
     				<td>병원 갔다옴</td>
     				<td>대기중</td>
     				<td>08/28 10:34AM</td>
     				<td>승인/거절</td>
     			</tr>
     			 <tr>
     				<td>근무 일정 생성</td>
     				<td>김수미</td>
     				<td>8월 31일 (월) 9:00 AM - 1:30 PM</td>
     				<td>병원 갔다옴</td>
     				<td>대기중</td>
     				<td>08/28 10:34AM</td>
     				<td>승인/거절</td>
     			</tr>
     			
     		</tbody>
     	</table>
     </div>
     
     
</div>

