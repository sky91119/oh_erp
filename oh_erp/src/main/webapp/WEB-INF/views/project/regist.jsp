<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="alert alert-success">
	<strong><h4>프로젝트명</h4></strong>
</div>
<div class="media border p-3">
	<img src="${pageContext.request.contextPath}/res/image/son.jpg"
		alt="John Doe" class="rounded-circle" alt="Cinque Terre" width="200"
		height="150"">
	<div class="media-body">
		<h4>
			 ${sessionScope.userinfo.member_name} <small><i>님 프로젝트 명을 입력해주세요</i></small>
		</h4>
		<p>Please enter the name of the Project.</p>
		<form action="regist" method="post">
			<input type="text" name="project_name"> <br><br> 
			<input type="submit" value="저장" class="btn btn-info">
		</form>
	</div>
</div>






<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>