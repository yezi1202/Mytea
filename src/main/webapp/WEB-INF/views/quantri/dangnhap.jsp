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
<title>admin</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/nguoidung/layout/css.jsp"></jsp:include>
</head>
<body style="background: white;">
	<div class="container mt-4">
		<div class="row d-flex justify-content-center mt-4">
			<div class="col-6 mt-4"
				style="border: 1px dashed #ccc; box-shadow: 0 0 1rem #ccc; padding: 2rem 1rem;">
				<form class="form" id="form2" method="POST"
					action="${base }/perform_login">

					<h3 class="text-center orange-color mb-4">Đăng Nhập</h3>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<c:if test="${not empty param.login_error}">
						<div class="alert alert-danger" role="alert">
							Tài khoản hoặc mật khẩu không chính xác<br>Vui lòng nhập
							lại!!!
						</div>
					</c:if>
					<div class="form-group d-md-flex">
						<div class="col-sm-12 col-md-4">
							<label for="username" class="orange-color">Tài khoản:</label>
						</div>
						<div class="col-sm-12 col-md-8 pr-4">
							<input type="text" name="username" id="username"
								class="form-control">
						</div>


					</div>
					<div class="form-group d-md-flex">
						<div class="col-sm-12 col-md-4">
							<label for="password" class="orange-color">Mật khẩu:</label>
						</div>
						<div class="col-sm-12 col-md-8">
							<div class="d-flex">
								<input type="password" name="password" id="password"
									class="form-control">&nbsp
								<button type="button"
									style="border: none; background: none; outline: none;">
									<i class="fa fa-eye orange-color" id="eye" aria-hidden="true"></i>
								</button>
							</div>
						</div>


					</div>
					<div class="form-group d-flex justify-content-center mt-4 pt-4">
						<input type="submit" name="submit" class="btn orange-btn btn-md"
							value="submit">
					</div>

				</form>
				<smaill class="float-right"> <a href="/Forgotpass"
					style="text-decoration: underline;">Quên mật khẩu?</a></smaill>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/nguoidung/layout/js.jsp"></jsp:include>

<script src="${base }/user/js/jquery.simplePagination.js"></script>
<script>
	var m = true
	$('#eye').click(function() {
		if (m) {
			$('#password').attr('type', 'text');
			$('#eye').addClass("fa-eye-slash").removeClass("fa-eye");
			m = false;
		} else {
			$('#password').attr('type', 'password');
			$('#eye').addClass("fa-eye").removeClass("fa-eye-slash");
			m = true
		}

	});
</script>
</html>