<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="alert alert-success">
	<strong><h4>수당등록</h4></strong>
</div>
<div class="media border p-3">
	<div class="media-body">
		<h4>
			 ${sessionScope.userinfo.member_name} <small><i>님 수당등록을 입력해주세요</i></small>
		</h4>
		<p>Please enter allowance registration.</p>

<form action="regist" method="post">
수당항목명<br>
<input type="text" name="benefit_name">
<br>
표시순서<br>
<input type="text" name="benefit_order">
<br>
배율<br>
<input type="text" name="benefit_rate">
<br>
계산식<br>
<input type="text" name="benefit_calculate">
<br>
<br>
<input type="submit" value="저장" class="btn btn-info">
</form>
</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>