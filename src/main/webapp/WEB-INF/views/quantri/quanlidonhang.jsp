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
					<h3>Trang quản lí đơn hàng</h3>
				</div>
				<jsp:include page="/WEB-INF/views/quantri/layout/acc.jsp"></jsp:include>
			</div>
			
			<jsp:include page="/WEB-INF/views/quantri/layout/donhang/donhang.jsp"></jsp:include>
			
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/quantri/layout/js.jsp"></jsp:include>
<script src="${base }/user/js/jquery.simplePagination.js"></script>
<script>
$("#ordered").change(function () {
	$('#btnSearch').trigger('click');
})
$( document ).ready(function() {
	$("#ordered").val(${searchModel.ordered });
	$("#paging").pagination({
		currentPage: ${saleO.currentPage},
        items: ${saleO.totalItems},
        itemsOnPage: 8,
        cssStyle: 'dark-theme',
        onPageClick: function(pageNumber, event) {
        	$('#page').val(pageNumber);
        	$('#btnSearch').trigger('click');
		},
    });
});
</script>
</html>