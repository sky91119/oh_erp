<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<%=request.getContextPath()%>/js/lightpick.js"></script>

<!--<%@ Attendance_detailDto adao = new Attendance_detailDto();%>-->

<div style = "padding-left : 100px;" align="left">
<h1 style = "font-size : 50px;">출퇴근기록 관리
<br>


<!-- 날짜 검색 -->
<script>
window.onload = function() {
	var options = {
		//대상 지정
		field : document.querySelector(".picker-start"),
		//두 번째 대상 지정
		secondField : document.querySelector(".picker-end"),
		//날짜 표시 형식 지정
		format : 'YYYY-MM-DD',
		//한 화면에 표시될 달의 개수
		numberOfMonths : 1,
		//시작요일(1:월 ~ 7:일)
		firstDay : 7,
		//자동으로 닫히지 않도록 설정
		//autoclose: false,
		//선택 방향 제어
		selectForward : true,
		selectBackword : false,
		repick : true,
	};
	var picker = new Lightpick(options);
};
</script>
</h1>
</div>

<hr>

<tr>
		<th>일자</th>
		<td><input type="text" class="picker-start" name="start"><span>~</span><input
							type="text" class="picker-end" name="finish"></td>
</tr>
<hr>

<table border="1">

<thead>
<tr>

<th>근태일자</th>
<th>사원번호</th>
<th>근태</th>
<th>휴가</th>
<th>뭐적지</th>
</tr>
</thead>
<tbody>
<c:forEach var = "attendance_detailDto" items ="${list}">


</c:forEach>
<tr>