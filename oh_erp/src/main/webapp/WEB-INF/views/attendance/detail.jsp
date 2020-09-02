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
<div class = "padding32">

<h1>출퇴근기록 생성하기(사원조회가능 + 보기만 가능)</h1>
<br>
<br>
<!-- 날짜 -->

<form>
<label>날짜</label>
<input type = "Month">
</form>

<form>
<select>
<option value="">활성직원</option> 
<option value="">출퇴근기록이 있는 직원만</option> 
</select>
</form>

<form>
<select>
<option value="지각 표시 범위">2분</option> <!--for문으로 될 수 있을 것같소만 -->
<option value="">출퇴근기록이 있는 직원만</option> 
</select>
</form>

<table board = "2">

<thead>
<tr>

<th>




</table>


</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>