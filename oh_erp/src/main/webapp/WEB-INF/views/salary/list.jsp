뷰 리스트
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	}	
	
</style>

<div class="container-fluid">
	<div>
		<p class="title">급여 계산 대장</p>
	</div>
    
    <div class="row padding32-bot">
    	<div class="col-2">
    		<input type="date" class="form-control">
    	</div>
		<div class="col-2">
			<form action=${pageContext.request.contextPath}/salary/insert method="post">
				<select class="form-control" name="type" onchange="this.form.submit()">
					<option value="all">전체</option>
					<option value="waiting">승인이 필요한 요청들</option>
				</select>
			</form>
        </div>

     </div>
     <div>
     	<table class="table left-font">
     		<thead>
     			<tr>
     				<th>귀속 연월</th>
     				<th>급여 구분</th>
     				<th>대장 명칭</th>
     				<th>월급 지급일</th>
     				<th>급여 계산</th>
     				<th>인원 수</th>
     				<th>급여 대장</th>
     				<th>지급 총액</th>
     			</tr>
     		</thead>
     		<tbody>
     			<c:forEach var="salaryDto" items="${list}">
     				<tr>	
     					<td>${salaryDto.salary_date}</td>
     					<td>${salaryDto.sortation}</td>
     					<td>${salaryDto.period_start}</td>
     					<td>${salaryDto.period_finish}</td>
     					<td>${salaryDto.payday}</td>
     					<td>${salaryDto.name}</td>
     					<td>${salaryDto.article}</td>
     					<td>${salaryDto.member}</td>
     				</tr>
		

		     			
     			</c:forEach>
     		</tbody>
     	</table>
     </div>
</div>