<%@page import="com.kh.oherp.repository.SalaryDao"%>
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
    .sum-request {
        font-size: 16px;
        text-align: right;
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
    
    <div class="col-6 sum-request">
        	<span>총 요청수 : ${salary_count}</span>
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