<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
       <div class="container">
        <h2>공지사항 게시판</h2>
               <table class="board_list">
            <colgroup>
                <col width="10%">
                <col width="10%">
                <col width="10%">
                <col width="10%">
                <col width="40%">
                <col width="10%">
                <col width="10%">
            </colgroup>
					<table class="table table-hover">
						<thead>
							<tr><th>번호 </th><th>사원번호</th><th>분류</th>
							<th>제목</th><th>내용</th><th>조회수</th><th>날짜</th>
						</thead>
            	<tbody>
		<c:forEach var="boardDto" items="${list}">
		<tr>
			<td>${boardDto.board_no}</td>
			<td>${boardDto.member_code}</td>
			<td>${boardDto.board_type}</td>
			<td><a href="../board/content?board_no=${boardDto.board_no}">${boardDto.board_title}</a></td>
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
    	<a href="http://localhost:8080/oherp/board/write" 
    	class="btn btn-secondary" type="submit">글 쓰기</a><br><br>

    </div>
    
    
     <!-- 페이징 -->
   <div>
    <section>
        <div id="data-container"></div>
        <div id="pagination"></div>
    </section>
</div>
    
    

</script>

        
  
    <!-- 검색창 -->
<form action="union" method="post">

	<select name="type">
		<option value="board_title" ${param.type == 'board_title' ? 'selected':''}>제목</option>
		<option value="member_code" ${param.type == 'member_code' ? 'selected':''}>사원번호</option>
	</select>	
	<input type="text" name="keyword" placeholder="검색어" value="${param.keyword}">	
	<input type="submit" value="검색">	
</form>
<br>

  
<!--   <div> -->
<%--     <span th:each="pageNum : ${pageList}" th:inline="text"> --%>
<%--         <a th:href="@{'/?page=' + ${pageNum}}">[[${pageNum}]]</a> --%>
<!--     </span> -->
<!-- </div> -->

