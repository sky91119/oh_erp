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

<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar.min.css" />
<script type="text/javascript" src="<c:url value='/js/fullcalendar.min.js'/>"></script>

<style>
.padding32{
padding : 32px;
}
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class = "padding32" align="center">

    <div style="font-size: 50px;">
    출퇴근기록 상세보기
    </div>
    
    <div id="calender"></div>

    
    <table board = "1">
    <thead>
    
    <tr>
    
    <th>사원코드</th>
    <th>사원이름</th>
    <th>날짜</th>
    <th>근무일정</th>
    <th>지점</th>
    <th>직무</th>
    <th>출근시간</th>
   <th>퇴근시간</th>
   <th>근무노트</th>
   <th>합계</th>
    
    </tr>
    
    </thead>
    
    <tbody>
    
    <c:forEach var = "attendance_detailDto" items = "$list">
    <tr>
    
    <td>${attendance_detailDto.member_code}</td>
    <td>${attendance_detailDto.member_name}</td>
    <td>
    
    <fmt:parseDate value="${attendance_detailDto.attendance_date}"
    var="time" pattern="yyyy_MM-dd"/>
     <fmt : formatDate value="${time}" pattern="yyyy_MM-dd"/>
    
    <!--${attendance_detailDto.attendance_date}</td>-->
    <td>${attendance_detailDto.attendance_spot}</td>
    <td>${attendance_detailDto.member_position}</td>
    
    <td>${attendance_detailDto.attendance_in_time1}:
        ${attendance_detailDto.attendance_in_time2}
        ${attendance_detailDto.attendance_in_time3}
    </td>
    
     <td>${attendance_detailDto.attendance_out_time1}:
        ${attendance_detailDto.attendance_out_time2}
        ${attendance_detailDto.attendance_out_time3}
    </td>
    
    <td>${attendance_detailDto.attendance_note}</td>
    <td>${attendance_detailDto.attendance_total}</td>
    
    </c:forEach>
    
    </tbody>
</table>
 </div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>