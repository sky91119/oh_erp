<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>

	
</head>


<body>
	<style>
.padding32 {
	padding: 32px;
}

.left {
	text-align: left;
	padding: 50px;
}

.inline {
	display: inline-block;
}

.hidden_code {
	padding: 30px;
	.
	row
	{
	padding
	:
	30px;
}

.col-4 {
	text-align: left;
}
</style>

	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!--<div class=hidden_code>
			★부서코드(안보이게 해야됨)<input type="text" name="department_no">
			</div>  
-->
			
		



	<form action="regist" method="post">
		<div class="container-fluid">

			 <h1>부서</h1>

<div id="styled-select">   
    <select name="department_no" id="group">
		<c:forEach var="DepartmentDto" items="${departmentList}">
        <option value="${DepartmentDto.department_no}">${DepartmentDto.department_name}</option>
		</c:forEach>
    </select>   
</div> 
 	
	

		<br><br>
			<hr>

			<br>

			<div class="row">


				<div class="col">
					<h1>사원정보</h1>
					<br>
					<br>
				</div>
				<div class="col">
					<h1>계좌정보</h1>
					<br>
					<br>
				</div>
				<div class="col">
					<h1>급여정보</h1>
					<br>
					<br>
				</div>
			</div>

			<div class="row">

				<!-- <div class="offset-4 col-4">
                <h4>입력하슈</h4>
            </div>-->
			</div>

			<div class="row">

				<div class="col-4">
					비밀번호<br><input type="password" name="member_pw"> <br> <br>
					성명<br><input type="text" name="member_name"> <br> <br>
					주민등록번호<br><input type="text" name="member_resident_number"> <br>
					<br> 입사일자 <input type="date" class="form-control" name="member_start_work">
					<br>  직위/직급<br><input type="text" name="member_position">					
					<br> <br>
					퇴사일자<input type="date" class="form-control"  name="member_last_work"> 
					<br>  
					퇴사사유<br><input type="text" name="member_last_work_cause">
					 <br>
					<br>우편번호<br><input type="text" name="member_post"> 
					<br> <br> 
					주소<br><input type="text" name="member_address">
				</div>

				<div class="col-4">
					은행<br><input type="text" name="member_bank"> <br>
					<br> 계좌번호<br><input type="text" name="member_account"> <br>
					<br> 예금주<br><input type="text" name="member_bank_name"> <br>

				</div>

				<div class="col-4">
					기본급<br><input type="text" name="member_basic_pay"> <br> <br>
					식대<br><input type="text" name="member_meal_pay"> <br> <br>
					차량유지비<br><input type="text" name="member_car_pay"> <br> <br>
				</div>

			</div>


		</div>

		<!-- --------------------------- -->
		<div align="center">
			<input type="submit" value="사원등록하기" class="btn btn-info">
		</div>
	</form>
</body>
</html>
