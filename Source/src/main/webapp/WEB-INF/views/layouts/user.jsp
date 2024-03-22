<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<base href="<c:url value="${pageContext.servletContext.contextPath}"/>" />
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/bootstrap.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/font-awesome.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/elegant-icons.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/nice-select.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/jquery-ui.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/owl.carousel.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/slicknav.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/assets/user/css/style.css"/>" type="text/css">
<decorator:head />

<style>
.user-nav>* {
	padding: 0 2rem;
	cursor: pointer;
	height: 100%;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
}

.user-nav__user-photo {
	height: 30px;
	width:30px;
	border-radius: 50%;
	margin-right: 8px;
}
</style>
</head>


<body>

	<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>

	<decorator:body />

	<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>

	<!-- Js Plugins -->
	<script src="<c:url value="/assets/user/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/bootstrap.min.js"/>"></script>
	<script
		src="<c:url value="/assets/user/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/jquery-ui.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value="/assets/user/js/mixitup.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/main.js"/>"></script>
	<decorator:getProperty property="page.script"></decorator:getProperty>
	<script>
		$(window).on("load", function() {
			$(".set-bg").each(function() {
				var bg = $(this).data("setbg");
				$(this).css("background-image", "url(" + bg + ")");
			});
		})
	</script>
</body>
</html>