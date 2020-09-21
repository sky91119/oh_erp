<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
  <!--부서 검색창 -->
<!--<form action="search" method="post">
<span>부서리스트</span>

	<input type="text" name="keyword">
	
	
	<input type="submit" value="검색">
	
	<select name="type">
		<option value="department_no">부서코드</option>
		<option value="department_name">부서명</option>
		<option value="department_use">사용</option>
	</select>
	
</form>
-->
<div class="alert alert-success">
	<strong><h4>수당리스트</h4></strong>
</div>

 <table class="table table-hover">

	<thead>
		<tr>
			<td>수당항목명</td>
			<td>표시순서</td>
			<td>배율</td>
			<td>계산식</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="BenefitDto" items="${benefitList}">
			<tr>
				<td>${BenefitDto.benefit_name}</td>
				<td>${BenefitDto.benefit_order}</td>
				<td>${BenefitDto.benefit_rate}</td>
				<td>${BenefitDto.benefit_calculate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a href="${pageContext.request.contextPath}/benefit/regist" class="btn btn-info">수당등록</a>

