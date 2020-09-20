<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--부서 검색창 -->
<form action="search" method="post">
<span>부서리스트</span>

	<input type="text" name="keyword">
	
	
	<input type="submit"  class="btn btn-info" value="검색">
	
	<select name="type">
		<option value="department_no">부서코드</option>
		<option value="department_name">부서명</option>
		<option value="department_use">사용</option>
	</select>
	
</form>

<table class="table table-hover">
	<thead class="thead-dark">
		
		<br>
			<tr><th>부서코드</th><th>부서명</th><th>사용</th><th>수정</th><th>삭제<tr>
		
	</thead>
	<tbody>
		<c:forEach var="DepartmentDto" items="${departmentList}">
			<tr>
				<td>${DepartmentDto.department_no}</td>
				<td>${DepartmentDto.department_name}</td>
				<td>${DepartmentDto.department_use}</td>
				<td><a href="update/${DepartmentDto.department_no}" class="btn btn-secondary">수정</a></td>
				<td><a href ="delete/${DepartmentDto.department_no}" class="btn btn-secondary">삭제</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!--  
------------------------------------------
-----------------부서 등록 모달---------------
------------------------------------------
-->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin:15px; padding:15px;">
<!--모달 버튼이름을 적어-->  
부서등록
</button>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" align="left">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<!--          <h4 class="modal-title" id="myModalLabel"></h4>-->
      </div>
      <div class="modal-body">
   <h3> 부서등록</h3>
<form action="regist" method="post">
부서명<input type="text" name="department_name">
<!--  사용여부<input type="text" name="department_use">-->
<input type="submit" value="저장" class="btn btn-primary">
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div></div>
  
