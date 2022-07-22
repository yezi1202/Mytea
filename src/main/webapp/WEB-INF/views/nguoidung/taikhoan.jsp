<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Mytea</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/nguoidung/layout/css.jsp"></jsp:include>
</head>
<body style="background: white;">

	<!-- big screen nav -->
	<jsp:include page="/WEB-INF/views/nguoidung/layout/navbar.jsp"></jsp:include>
	<!-- end -->
	<jsp:include page="/WEB-INF/views/nguoidung/layout/taikhoan/taikhoan.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/nguoidung/layout/js.jsp"></jsp:include>

<script>
if(${tbal.length()>0}){
	alert(${tbal})
}
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#showavt').css("background", "url("+e.target.result+")no-repeat center").css("background-size","cover");
		}
		reader.readAsDataURL(input.files[0]);
	}
}
$("#avatarup").change(function() {
	readURL(this);
});
	function avtup() {
		$('#avatarup').trigger("click")
	}
	var m = true
	$('.eye_item').click(function() {
		if (m) {
			$(this).parent().parent().children().attr('type', 'text');
			$(this).addClass("fa-eye-slash").removeClass("fa-eye");
			m = false;
		} else {
			$(this).parent().parent().children().attr('type', 'password');
			$(this).addClass("fa-eye").removeClass("fa-eye-slash");
			m = true
		}

	});
	$('#passwordx').change(function() {
		if ($(this).val() != $('#password').val()) {
			/* this.innerHTML+="<br> Mật khẩu không trùng khớp!" */
			$('#error_password').html("Mật khẩu không trùng khớp!")
		} else {
			$('#error_password').html("")
		}
	})
</script>
</html>