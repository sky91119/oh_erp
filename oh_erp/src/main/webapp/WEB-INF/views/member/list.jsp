<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <!--사원 검색창 -->
    
<form action="search" method="post">
<span>사원리스트</span>

	<input type="text" name="keyword">
	
	<input type="submit" value="검색" class="btn btn-info">
	
	<select name="type">
		<option value="member_code">사원번호</option>
		<option value="member_name">성명</option>
	</select>
	
</form>
	
	
<table class="table table-hover">
	<thead class="thead-dark">
        <br>
		<tr><th>사원번호</th><th>성명</th><th>부서명</th><th>입사일자<tr>
	</thead>
	<tbody>
		<c:forEach var="MemberListVo" items="${memberList}">
			<tr>
				<td>${MemberListVo.member_code}</td>
				<td>${MemberListVo.member_name}</td>
				<td>${MemberListVo.department_name}</td>
				<td>${MemberListVo.member_start_work}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>