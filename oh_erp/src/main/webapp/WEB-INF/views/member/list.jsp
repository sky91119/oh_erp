<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!--사원 검색창 -->
    <!--  
<form action="search" method="post">
<span>사원리스트</span>

	<input type="text" name="keyword">
	
	
	<input type="submit" value="검색">
	
	<select name="type">
		<option value="member_code">사원번호</option>
		<option value="member_name">성명</option>
	</select>
	
</form>
	-->
	
<table border="1">
	<thead>
		<tr>
			<td>사원번호</td>
			<td>성명</td>
			<td>부서명</td>
			<td>입사일자</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="MemberListVo" items="${list}">
			<tr>
				<td>${MemberListVo.member_code}</td>
				<td>${MemberListVo.member_name}</td>
				<td>${MemberListVo.department_name}</td>
				<td>${MemberListVo.member_start_work}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>