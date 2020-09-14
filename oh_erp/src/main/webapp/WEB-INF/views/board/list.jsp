<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



       <div class="container">
        <h2>통합 게시판</h2>
        <table class="board_list">
            <colgroup>
                <col width="10%"/>
                <col width="10%"/>
                <col width="10%"/>
                <col width="10%"/>
                <col width="40%"/>
                <col width="10%"/>
                <col width="10%"/>
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">사원번호</th>
                    <th scope="col">분류</th>
                    <th scope="col">제목</th>
                    <th scope="col">내용</th>
                    <th scope="col">조회수</th>
                    <th scope="col">날짜</th>
                </tr>
                
            </thead>    
            	<tbody>
		<c:forEach var="boardDto" items="${list}">
		<tr>
			<td>${boardDto.board_no}</td>
			<td>${boardDto.member_code}</td>
			<td>${boardDto.board_type}</td>
			<td>${boardDto.board_title}</td>
			<td>${boardDto.board_content}</td>
			<td>${boardDto.board_view}</td>
		
			<td>
				<fmt:parseDate value="${boardDto.board_date}" 
							var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		</c:forEach>
	</tbody>       
    </table>
        <a href="http://localhost:8080/oherp/board/write" class="btn">글 쓰기</a>
    </div>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>