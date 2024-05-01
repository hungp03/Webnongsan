<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath }/">
<link rel="stylesheet" href="assets/user/css/error.css"
	type="text/css">
</head>
<body>
	<section class="page">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 ">
					<div class="col-sm-offset-1 text-center">
						<div class="four_zero_four_bg">
							<h1 class="text-center ">404</h1>


						</div>

						<div class="contant_box">
							<h3 class="h2">${qoutes }</h3>

							<p>${mess }</p>

							<a href="index.htm" class="btn btn-custom">Go to Home</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>