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
<th>근태번호</th>
    <th>사원번호</th>
    <th>성명</th>
    <th>날짜</th>
    <th>출근시간</th>
   <th>퇴근시간</th>
   <th>근무노트</th>
   <th>합계</th>

		</tr>
	</thead>
	<tbody>
		<c:forEach var="Attendance_detailListVo" items="${list}">
			<tr>
				<td>${Attendance_detailListVo.attendance_no}</td>
				<td>${Attendance_detailListVo.member_code}</td>
				<td>${Attendance_detailListVo.member_name}</td>
				<td>${Attendance_detailListVo.attendance_date}</td>
				
				
				<td>${Attendance_detailListVo.attendance_in_time1} :
				${Attendance_detailListVo.attendance_in_time2}
				${Attendance_detailListVo.attendance_in_time3}</td>
				
				<td>${Attendance_detailListVo.attendance_out_time1} :
				${Attendance_detailListVo.attendance_out_time2}
				${Attendance_detailListVo.attendance_out_time3}</td>
				
				<td>${Attendance_detailListVo.attendance_note}</td>
				<td>${Attendance_detailListVo.attendance_total}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>