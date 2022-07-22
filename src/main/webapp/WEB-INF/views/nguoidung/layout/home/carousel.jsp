<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="slidebar">
		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="${base }/dulieu/img/bgr.jpg"
						alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${base }/dulieu/img/bgr.jpg"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${base }/dulieu/img/bgr.jpg"
						alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> </a> <a
				class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> </a>
		</div>
	</div>