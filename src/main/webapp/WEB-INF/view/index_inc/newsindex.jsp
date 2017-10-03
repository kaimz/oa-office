<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/news/normalize.css" />

	<link rel="stylesheet" type="text/css" href="css/news/default.css">

	<link href="css/news/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="css/news/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />

    <link href="css/news/site.css" rel="stylesheet" type="text/css" />
    
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".demo2").bootstrapNews({

	    newsPerPage: 4,

	    autoplay: true,

		pauseOnHover: true,

		navigation: false,

	    direction: 'down',

	    newsTickerInterval: 2500,

	    onToDo: function () {

	    }

	});
	
	
});

function readMore(id) {
	$(window.parent.newsDetails(id));
}

</script>
</head>
<body>
	<div class="col-md-4">

					<div class="panel panel-default">

						<div class="panel-heading">

							<span class="glyphicon glyphicon-list-alt"></span><b>News</b></div>

						<div class="panel-body">

							<div class="row">

								<div class="col-xs-12">

									<ul class="demo2">

										<!-- <li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>

										<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>

										<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>

										<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>

										<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>

										<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li> -->

										<c:forEach var="item" items="${list }">
											<li class="news-item"><span style="color: gray;">[${item[2] }]</span><span style="font-weight:bold;">
											<c:choose>
												<c:when test="${fn:length(item[1]) > 10}">
													<c:out value="${fn:substring(item[1], 0, 10)}..." />
												</c:when>
												<c:otherwise>
													<c:out value="${item[1]}" />
												</c:otherwise>
											</c:choose>
											</span><span style="float: right;color: gray;"><fmt:formatDate value="${item[4] }"
								pattern="yyyy-MM-dd HH:mm:ss"/></span> <br>
								${item[3] }...<a href="javascript:void(0);" onclick="readMore('${item[0]}')"  style="float:right;">更多...</a></li>
										</c:forEach>

									</ul>

								</div>

							</div>

						</div>

						<div class="panel-footer">



						</div>

					</div>

				</div>
</body>
</html>