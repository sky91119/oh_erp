<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>사진 등록</h1>

<form action="add" method="post" enctype="multipart/form-data">
	<input type="text" name="member_code" placeholder="사원번호"><br>
<!--   <br> <input type="text" name="photo_no" placeholder="사진번호">

	<br>-->
	<br> <input type="text" name="photo_name"
		placeholder="사진제목(부서명 +이름을 적어주세요.)"><br>
	<br> <input type="file" name="file" accept=".jpg, .png, .gif"><br>
	<br> <input type="submit" value="프로필등록">

</form>
