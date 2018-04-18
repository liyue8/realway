<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jqurey.js"></script>
<script type="text/javascript">
	$(function(){
		$("#kaptchaImage").click(function(){
		 	$(this).attr('src', 'Kaptcha.jpg?' + Math.floor(Math.random() * 100));
		})
		$("#btn").click(function(){
			$.post("loginUser.action",{"user.username":$("#username").val(),
				"user.password":$("#password").val(),
				"code":$("#code").val()},
					function(data){
				console.log(data);
			})
		})
	})
</script>
</head>
<body>
	<from action="loginUser.action" method="post">
		<p>用户名：<input type="text" name="user.username"></p>
		<p>用户密码：<input type="password" name="user.password"></p>
		<p>验证码：<input type="text" name="code">
			<img src="Kaptcha.jpg" id="kaptchaImage">换一张
		</p>
		<p><input type="button" value="登录" id="btn"></p>
	</from>
</body>
</html>