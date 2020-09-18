<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>





<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<h1>상세보기</h1>

<div class="container col-md-6">
	<div class="card">
		<div class="card-body">
			<h4 class="card-title mb-3">제목:${boardDto.board_title}</h4>
			<hr>
			<h6 class="card-subtitle text-muted mb-4">
				<i class="far fa-user"></i> 번호:${boardDto.board_no} · <i
					class="far fa-clock"></i> 사원번호:${boardDto.member_code} · <i
					class="far fa-clock"></i> 분류:${boardDto.board_type} <br> <i
					class="far fa-user"></i> 조회수:${boardDto.board_view} · <i
					class="far fa-clock"></i> 날짜:${boardDto.board_date}
				<hr>
				<h4 class="card-title mb-3">내용 <br><br>
				${boardDto.board_content}</h4>


<!-- 수정삭제목록으로 -->
				<div class="card-body">
					<a href="#" class="btn btn-outline-secondary btn-sm" role="button">수정</a>

					<a href="delete/${boardDto.board_no}" class="btn btn-outline-secondary btn-sm" role="button">삭제</a>
				</div>
				<div class="card-body">
					<a href="http://localhost:8080/oherp/board/list"
						class="btn btn-secondary" type="button">목록으로</a>
				</div>
		</div>
	</div>

	<!-- <h1>상세보기</h1> -->
	<%-- <h3>번호 : ${boardDto.board_no}</h3> --%>
	<%-- <h3>사원번호 : ${boardDto.member_code}</h3> --%>
	<%-- <h3>분류 : ${boardDto.board_type}</h3> --%>
	<%-- <h3>제목 : ${boardDto.board_title}</h3> --%>
	<%-- <h3>내용 : ${boardDto.board_content}</h3> --%>
	<%-- <h3>조회수 : ${boardDto.board_view}</h3> --%>
	<%-- <h3>날짜 : ${boardDto.board_date}</h3> --%>

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>