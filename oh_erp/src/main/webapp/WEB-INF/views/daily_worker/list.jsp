<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="alert alert-success">
	<strong><h4>일용직 &nbsp;목록</h4></strong>
</div>

 <table class="table table-hover">
	<thead>
		<tr>

			<td>일용직순번</td>
			<td>이름</td>
			<td>개인정보</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="Daily_workerDto" items="${list}">
			<tr>
				<td>${Daily_workerDto.daily_worker_code}</td>
				<td>${Daily_workerDto.daily_worker_name}</td>
				<td>${Daily_workerDto.daily_worker_resident_number}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!--  
------------------------------------------
-----------------일용직 등록 모달---------------
------------------------------------------
-->
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" style="margin:15px; padding:15px;">
<!--모달 버튼이름을 적어-->  
일용직 등록
</button>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" align="left">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<!--          <h4 class="modal-title" id="myModalLabel"></h4>-->
      </div>
      <div class="modal-body">
<!--       깜빡깜빡 -->
    <div class="spinner-grow text-muted"></div>
  <div class="spinner-grow text-primary"></div>
  <div class="spinner-grow text-success"></div>
  <div class="spinner-grow text-info"></div>
  <div class="spinner-grow text-warning"></div>
  <div class="spinner-grow text-danger"></div>
  <div class="spinner-grow text-secondary"></div>
  <div class="spinner-grow text-dark"></div>
   <div class="spinner-grow text-info"></div>
  <div class="spinner-grow text-muted"></div>
  <div class="spinner-grow text-primary"></div>
  <div class="spinner-grow text-success"></div>
  

  
  
<form action="regist" method="post">
이름<br>
<input type="text" name="daily_worker_name">
<br>
주민등록번호<br>
<input type="text" name="daily_worker_resident_number" placeholder="-없이 13자리 입력">
<br>
<!--  사용여부<input type="text" name="department_use">-->
<input type="submit" value="일용직등록" class="btn btn-info">
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div></div>
  
  
  
