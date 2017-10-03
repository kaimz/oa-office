<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login OA</title>
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="${ctx}/css/reset.css">
        <link rel="stylesheet" href="${ctx}/css/supersized.css">
        <link rel="stylesheet" href="${ctx}/css/style.css">
<script>

</script>
</head>
<body>
<div class="page-container">
            <h1>Login OA</h1>
            <span id="message" style="font-family: sans-serif; color: red;
             display: block; height: 21px;margin-top: 40px;">${param.errorMessage}</span>
            <form action="userlogin" method="post" id="form">
                <input type="text" name="loginname" class="username" placeholder="Username">
                <input type="password" name="password" class="password" placeholder="Password">
                <button type="submit">Sign me in</button>
                <div class="error"><span>+</span></div>
            </form>

        <!-- Javascript -->
        <script src="${ctx}/js/jquery-1.7.2.min.js"></script>
        <script src="${ctx}/js/supersized.3.2.7.min.js"></script>
        <script src="${ctx}/js/supersized-init.js"></script>
		<script src="${ctx}/js/scripts.js"></script>

</body>
</html>