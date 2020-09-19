<%@page import="com.kh.oherp.repository.Daily_workDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <p class="title">급여 계산 대장</p>
    </div>
	<div class="row titlediv">
<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#myModal" style="margin:15px; padding:5px;">
  신규
</button>
</div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" align="left">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
    <form action=${pageContext.request.contextPath}/salary/insert_do method="post">
	<table>
	<thead>급여정보입력</thead>
	<p></p>
		<tr>
			<td>귀속연월</td>
			<td><input type="month" class="form-control" id="salary_date" name="salary_date">
			</td>
		</tr>
		<p></p>
		<tr>
			<td>급여구분</td>
			<td><select class="form-control" id="salary_sortation" name="salary_sortation">
					<option value="기본급">기본급</option>
					<option value="기본급+상여">기본급+상여</option>
			</select></td>
		</tr>
<p></p>
		<tr>
			<td>대상기간</td>

			<td><input type="date" class="form-control"
				name="salary_period_start" id="salary_period_start"></td>
			<td>&nbsp;/&nbsp;</td>
			<td><input type="date" class="form-control"
				name="salary_period_finish" id="salary_period_finish"></td>
		</tr>
		<p></p>
		<tr>
			<td>지급일</td>
			<td><input type="date" class="form-control" name="salary_payday" id="salary_payday"></td>
		</tr>
		<p></p>
		<tr>
			<td>급여대장명칭</td>
			<td><input type="text" class="form-control" name="salary_name" id="salary_name"></td>
		</tr>
		<p></p>
		<tr>
			<td>대상사원</td>
			<td><input type="checkbox" id="salary_member" name="salary_member" value="전체"> 
			<label for="salary_member">전체</label> 
			
			<select name="salary_member" id="salary_member" class="form-control" required>
				<option>사원 선택</option>
                <c:forEach var="memberDto" items="${member}">
                   <option value="${memberDto.member_code}">${memberDto.member_name}</option>
                </c:forEach>
            </select>
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
    <div class="col-6 sum-salary">
        	<span>총 등록대장 : ${salary_count} 개</span>
        </div>
<div class="container-fluid">

    <div class="row padding32-bot">
        <div class="col-2">
            <input type="date" class="form-control">
        </div>
        <div class="col-2">
            <form action=${pageContext.request.contextPath}/salary/list method="post">
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
                    <th>급여</th>
                    <th>사원이름</th>
                </tr>
            </thead>
            <tbody>
               <c:forEach var="salaryDto" items="${member_salary}">
                    <tr>
                    
                   			 <fmt:parseDate value="${salaryDto.salary_date}" 
							var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                        <td><fmt:formatDate value="${date}" pattern="YYYY/MM"/></td>
 		                       <td>${salaryDto.salary_sortation}</td>
								<td>${salaryDto.salary_name}</td>			
 							<fmt:parseDate value="${salaryDto.salary_payday}" 
							var="payday" pattern="yyyy-MM-dd HH:mm:ss"/>
                        <td><fmt:formatDate value="${payday}" pattern="YYYY/MM/dd"/></td>
<%-- 							<td><fmt:formatNumber value="${salaryDto.member_basic_pay}" pattern="#,###"/></td> --%>
  		                   		<td><button type="button" class="btn btn-outline-info btn-xs" data-toggle="modal" data-target="#myModal" style="margin:1px; padding:1px;">
							  조회
							</button>
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header" align="left">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel" align="left">급여대장</h4>
							      </div>
							      <div class="modal-body">
							        Modal 내용
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							      </div>
							    </div>
							  </div></div>
							  </td>
  		                     	 <td>${salaryDto.member_name}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>