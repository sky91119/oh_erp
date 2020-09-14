<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



       <div class="container">
        <h2>공지사항 게시판</h2>
        <table class="board_list">
            <colgroup>
                <col width="15%"/>
                <col width="*"/>
                <col width="15%"/>
                <col width="20%"/>
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">글번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">조회수</th>
                    <th scope="col">작성일</th>
                </tr>
            </thead>
<!--             <tbody> -->
<%--                 <tr th:if="${#lists.size(list)} > 0" th:each="list : ${list}"> --%>
<%--                     <td th:text="${list.boardIdx}"></td> --%>
<%--                     <td class="title"><a href="/board/openBoardDetail.do?boardIdx=" th:attrappend="href=${list.boardIdx}" th:text="${list.title}"></a></td> --%>
<%--                     <td th:text="${list.hitCnt}"></td> --%>
<%--                     <td th:text="${list.createdDatetime}"></td> --%>
<!--                 </tr>  -->
<%--                 <tr th:unless="${#lists.size(list)} > 0"> --%>
<!--                     <td colspan="4">조회된 결과가 없습니다.</td> -->
<!--                 </tr> -->
<!--             </tbody> -->
        </table>
        <a href="/board/openBoardWrite.do" class="btn">글 쓰기</a>
    </div>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>