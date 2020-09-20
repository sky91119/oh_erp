<%@page import="com.kh.oherp.repository.SalaryDao"%>
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

	.modal-dialog {
    max-width: 680px;
    margin: 1.75rem auto
    }
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
        <p class="title">총 급여현황</p>
    </div>

</div>


     <div class="sum-salary">
        	<span>총 등록대장 : ${salary_count} 개</span>
        </div>
    <div>
    
    <div class="row padding32-bot">
        <div class="col-2">
        <form action=${pageContext.request.contextPath}/salary/all method="get">
            <input type="month" name="salary_date" class="form-control" value="${salary_date}" onchange="this.form.submit()">
            <input type="hidden" name="member_code" value="${member_code }">
        </form>
        </div>
        <div class="col-2">
            <form action=${pageContext.request.contextPath}/salary/all method="get">
                <select class="form-control" name="member_code" onchange="this.form.submit()">
                    <option value="">사원 선택</option>
                <c:forEach var="memberDto" items="${member}">
                   <option value="${memberDto.member_code}" ${member_code == memberDto.member_code ? 'selected':'' }>${memberDto.member_name}</option>
                </c:forEach>
                </select>
                <input type="hidden" name="salary_date" value="${salary_date }">
            </form>
        </div>
        <form action="${pageContext.request.contextPath}/salary/all" method="get">
        	<input type="submit" class="btn btn-secondary"value="초기화" onclick="this.form.submit();">
        </form>
    </div>
							      <table class="table left-font">
          						  <thead>
							        	<tr>
							        	<th>귀속연월</th>
							        	<th>성명</th>
					                    <th>부서 </th>
					                    <th>직책</th>
					                    <th>급여</th>
					                    <th>식대</th>
					                    <th>차량유지비</th>
					                    <th>상여</th>
					                    <th>지급총액</th>
							        	</tr>
							      	</thead>
							      	<tbody>
							      	<c:forEach var="salaryDto" items="${member_salary}">
							      		<tr>
							      			<fmt:parseDate value="${salaryDto.SALARY_DATE}" 
											var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                       						 <td><fmt:formatDate value="${date}" pattern="YYYY/MM"/></td>
								      		<td>${salaryDto.MEMBER_NAME }</td>
								      		<td>${salaryDto.DEPARTMENT_NAME }</td>
								      		<td>${salaryDto.MEMBER_POSITION }</td>
								      		<td><fmt:formatNumber value="${salaryDto.MEMBER_BASIC_PAY}" pattern="#,###"/></td>
								      		<td><fmt:formatNumber value="${salaryDto.MEMBER_MEAL_PAY }" pattern="#,###"/></td>
								      		<td><fmt:formatNumber value="${salaryDto.MEMBER_CAR_PAY }" pattern="#,###"/></td>
								      		<td><fmt:formatNumber value="${salaryDto.SALARY_SORTATION == '기본급' ? '0':salaryDto.MEMBER_BASIC_PAY }" pattern="#,###"/></td>
								      		<td><fmt:formatNumber value="${salaryDto.PAY }" pattern="#,###"/></td>
							      		</tr>
							      		</c:forEach>
							      	</tbody>
							      	</table>
							      </div>
            </tbody>
