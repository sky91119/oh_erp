<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

   <form action="write" method="post">
 
	분류 : <input type="text" name="board_type"><br><br>
	제목 : <input type="text" name="board_title"><br><br>
	내용 : <input type="text" name="board_content"><br><br>	
	
	
	<input type="submit" value="등록">
</form>
<!--    <div class="form-group"> -->
<!--               <label for="exampleFormControlInput1">제목</label> -->
<!--             <input type="text" class="form-control" id="board_title" name="title" placeholder="제목을 작성해주세요."> -->
<!--           </div> -->
<!--         <div class="form-group"> -->
<!--               <label for="exampleFormControlInput1">제목</label> -->
<!--             <input type="text" class="form-control" id="board_title" name="title" placeholder="제목을 작성해주세요."> -->
<!--           </div> -->
<!--         <div class="form-group"> -->
<!--             <label for="exampleFormControlInput1">작성자</label> -->
<!--             <input type="text" class="form-control" id="member_code" name="crea_id" placeholder="이름을 적어주세요."> -->
<!--           </div> -->
<!--           <div class="form-group"> -->
<!--             <label for="exampleFormControlTextarea1">내용</label> -->
<!--             <textarea class="form-control" id="board_content" name="contents" rows="10"></textarea> -->
<!--           </div> -->
<!--         <input type="submit" class="btn btn-info">제출하기</button> -->
<!--         <button type="button" class="btn btn-secondary">목록으로</button> -->
<!--     </form> -->
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

