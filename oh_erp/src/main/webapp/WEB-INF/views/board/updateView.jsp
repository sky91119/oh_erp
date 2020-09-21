<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript">
    $(document).ready(function() {
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });
    })
    function addFile() {
        var str = "<div class='file-group'><input type='file' name='file'><a href='#this' name='file-delete'>삭제</a></div>";
        $("#file-list").append(str);
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });
    }
 
    function deleteFile(obj) {
        obj.parent().remove();
    }
</script>




<form action="write" method="post">

<div class="form-group">
	<label for="exampleFormControlInput1">분류</label> 
	<select class="form-control" id="sel1" name="board_type">
		<option>통합</option>
		<option>공지사항</option>
		<option>회사규정</option>
		<option>인사발령</option>
	</select>
</div>

<div class="form-group">
	<label for="exampleFormControlInput1">제목</label> <input type="text"
		class="form-control" id="board_title" name="board_title"
		placeholder="제목을 작성해주세요.">
</div>
<div class="form-group">
	<label for="exampleFormControlTextarea1">내용</label>
	<textarea class="form-control" id="board_content" name="board_content"
		rows="10"></textarea>
</div>


<!-- <form action="write" method="post" enctype="multipart/form-data">
    생략
    <div class="form-group" id="file-list">
        <a href="#this" onclick="addFile()">파일추가</a>
        <div class="file-group">
            <input type="file" name="file"><a href='#this' name='file-delete'>삭제</a>
        </div>
    </div>
    <button type="submit" class="btn btn-default"></button>
</form>
 -->


<!-- 목록으로 -->
<input type="submit" class="btn btn-info">
</form>
<a href="http://localhost:8080/oherp/board/list" class="btn btn-secondary" type="submit">목록으로</a>

