<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--부서 검색창 -->
<form action="union" method="post">
<span>부서리스트</span>

	<input type="text" name="keyword">
	
	
	<input type="submit" value="검색">
	
	<select name="type">
		<option value="department_code">부서코드</option>
		<option value="department_name">부서명</option>
		<option value="department_use">사용</option>
	</select>
	
</form>

<table border="1">
	<thead>
		<tr>
			<td>부서코드</td>
			<td>부서명</td>
			<td>사용</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="DepartmentDto" items="${list}">
			<tr>
				<td>${DepartmentDto.department_no}</td>
				<td>${DepartmentDto.department_name}</td>
				<td>${DepartmentDto.department_use}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>