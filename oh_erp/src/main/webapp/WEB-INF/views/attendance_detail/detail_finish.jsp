<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>


<style>
.padding32{
padding : 32px;
}
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class = "padding32" align="center">

    <div style="font-size: 50px;">
    출퇴근기록 관리
    </div>
    
<form action = "admin_page" method="post">

<div class = "table-ssideopen">
<br><br>

<h1 align = "center">출퇴근기록</h1>
<hr width="90%">

<table>

<thead>
<tr>
<th width="20%">사원이름</th>
<th width= "10%">첫째 주 월</th>
<th width= "10%">첫째 주 화</th>
<th width= "10%">첫째 주 수</th>
<th width= "10%">첫째 주 목</th>
<th width= "10%">첫째 주 금</th>
<th width= "10%">첫째 주 토</th>
<th width= "10%">첫째 주 일</th>
<th width="10%"> 합계</th>
</tr>
</thead>

<tbody align="center">
<c:forEach var = "attendance_detailDto" items="${list}">
<tr>

<td>
${attendance_detailDto.attendance_name}
</td>

<td>
${attendance_detailDto.attendance_in_time1}:${attendance_detailDto.attendance_in_time2}
<br>
<hr>
${attendance_detailDto.attendance_out_time1}:${attendance_detailDto.attendance_out_time2}
<br>
${attendance_detailDto.attendance_spot}
</td>

<td>${attendance_detailDto.member_position}</td>
</c:forEach>
</tbody>
</table>
</div>

</form>
    
    </div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
