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
<meta charset="UTF-8">
<title>admin</title>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/quantri/layout/css.jsp"></jsp:include>

</head>
<body>
	<div class="main">
		<jsp:include page="/WEB-INF/views/quantri/layout/meu.jsp"></jsp:include>
		<div class="content">
			<div class="header">
				<div class="form_search">
					<h3>Chi tiết đơn hàng</h3>
				</div>
				<jsp:include page="/WEB-INF/views/quantri/layout/acc.jsp"></jsp:include>
			</div>
			
			<jsp:include page="/WEB-INF/views/quantri/layout/donhang/chitietdonhang.jsp"></jsp:include>
			
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/quantri/layout/js.jsp"></jsp:include>
<script src="${base }/user/js/jquery.simplePagination.js"></script>
<script>
function xacnhan(poId) {
	var text = "Mặt hàng này đã được giao tới khách hàng?";
	if(confirm(text)){
		
		let data = {
				id: poId, 
			};
			jQuery.ajax({
				url: "/tinhtrang", //->action
				type: "post",
				contentType: "application/json",
				data: JSON.stringify(data),

				dataType: "json", // kieu du lieu tra ve tu controller la json
				success: function(jsonResult) {
					$('#'+poId).html(jsonResult.ht);
					
				},
				error: function(jqXhr, textStatus, errorMessage) {
					
				}
			});
	}
}
</script>
</html>