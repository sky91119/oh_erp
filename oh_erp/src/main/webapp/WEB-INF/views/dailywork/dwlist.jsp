<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script src="<%=request.getContextPath()%>/res/js/lightpick.js"></script>
	
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
// function samp
</script>
<style>
    /*마진*/
    .margin20 {
        margin: 20px 20px 20px 20px;
    }

    /*패딩*/
    .padding32 {
        padding: 32px;
    }

    .padding32-bot {
        padding-bottom: 32px;
    }

    .padding10 {
        padding: 10px;
    }

    /*제목*/
    .title {
        font-size: 25px;
        text-align: left;
        padding-bottom: 15px;
    }

    /*총 요청수*/
    .sum-salary {
        font-size: 16px;
        text-align:right;
    }

    /*요청관리 상태*/
    .waiting {
        background-color: #D27300;
        margin: 0px 3px 0px 0px;
        padding: 2px 8px;
        color: #ffffff;
        text-align: center;
        font-size: 0.75rem;
        border-radius: 2px;
    }

    .ok {
        background-color: #01853d;
        margin: 0px 3px 0px 0px;
        padding: 2px 8px;
        color: #ffffff;
        text-align: center;
        font-size: 0.75rem;
        border-radius: 2px;
    }

    .no {
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
    .left-font {
        text-align: left;
    }
</style>
<div class="container-fluid">
 <div>
        <p class="title">일용직 급여 계산 대장</p>
    </div>

</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" align="left">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
    <form action=${pageContext.request.contextPath}/dailywork/dwinsert method="post">
	<table>
	<thead>일용직 근무 입력</thead>
	<p></p>
		<tr>
			<td>일용직 사원</td>
			<select name="daily_worker_code" id="daily_worker_code" class="form-control" required>
				<option value="">사원 선택</option>
                <c:forEach var="worker" items="${daily_worker}">
                   <option value="${worker.DAILY_WORKER_CODE}">${worker.DAILY_WORKER_NAME}</option>
                </c:forEach>
            </select>
		</tr>
		<p></p>
		<tr>
			<td>근무날짜</td>
			<td><input type="date" class="form-control"
				name="daily_work_date" id="daily_work_date"></td>
		</tr>
		<p></p>
		<tr>
			<td>시급</td>
			<td><input type="text" id="daily_work_pay" class="form-control" name="daily_work_pay"></td>
		</tr>
<p></p>
		<p></p>
		<tr>
			<td>근무시간</td>
			<td><input type="text" class="form-control" name="daily_work_time" id="daily_work_time"></td>
		</tr>
		<p></p>
		</div>
	</table>	
	<p></p>
		<input type="submit" value="저장" onclick="sampleModalPopup();">
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
  </div>
<div class="container-fluid">
    <div class="row padding32-bot">
        <div class="col-2">
        <form action=${pageContext.request.contextPath}/salary/list method="get">
            <input type="date" name="daily_work_date" class="form-control" value="${daily_work_date}" onchange="this.form.submit()">
            <input type="hidden" name="daily_worker_code" value="${daily_worker_code}">
        </form>
        </div>
        <div class="col-2">
            <form action=${pageContext.request.contextPath}/salary/list method="get">
                <select class="form-control" name="member_code" onchange="this.form.submit()">
                    <option>사원 선택</option>
                <c:forEach var="daily_workerDto" items="${member}">
                   <option value="${memberDto.member_code}" ${member_code == memberDto.member_code ? 'selected':'' }>${memberDto.member_name}</option>
                </c:forEach>
                </select>
                <input type="hidden" name="salary_date" value="${salary_date }">
            </form>
        </div>
        <form action="${pageContext.request.contextPath}/salary/list" method="get">
        	<input type="submit" class="btn btn-secondary"value="초기화" onclick="this.form.submit();">
        </form>
    </div>
    	<div class="row titlediv">
<button type="button"  class="btn btn-dark" data-toggle="modal" data-target="#myModal" style="margin-right: auto;">
  근무등록
</button>
</div>
     <div class="sum-salary">
        	<span>총  : ${salary_count} 개</span>
        </div>
    <div>
        <table class="table left-font">
            <thead>
                <tr>
                    <th>성명</th>
                    <th>근무 날짜</th>
                    <th>근무시간</th>
                    <th>시급</th>
                    <th>일당</th>
                </tr>
            </thead>
            <tbody>
               <c:forEach var="salaryDto" items="${member_salary}">
                    <tr>
                   			 <fmt:parseDate value="${salaryDto.SALARY_DATE}" 
							var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                        <td><fmt:formatDate value="${date}" pattern="YYYY/MM"/></td>
 		                       <td>${salaryDto.SALARY_SORTATION}</td>
								<td>${salaryDto.SALARY_NAME}</td>			
 							<fmt:parseDate value="${salaryDto.SALARY_PAYDAY}" 
							var="payday" pattern="yyyy-MM-dd HH:mm:ss"/>
                        <td><fmt:formatDate value="${payday}" pattern="YYYY/MM/dd"/></td>
				<td><fmt:formatNumber value="${salaryDto.MEMBER_BASIC_PAY}" pattern="#,###"/></td>
  		                     	 <td>${salaryDto.MEMBER_NAME}</td>
                   					<td>${total_salary}</td>
                   </c:forEach>
                   
                    </tr>
            </tbody>
        </table>
    </div>
</div>
</div>