<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
</head>
<body>
  <body>
	<form action="${pageContext.request.contextPath }/login">
	<div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>Login</h1>
			</div>
			<div class="login-form">
				<div class="control-group">
				<span>${msg }</span>
				</div>
				<div class="control-group">
				<input type="text" class="login-field" value="" placeholder="username" id="login-name" name="username">
				<label class="login-field-icon fui-user" for="login-name"></label>
				</div>
				<div class="control-group">
				<input type="password" class="login-field" value="" placeholder="password" id="login-pass" name="password">
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>
				<input type="submit" class="btn btn-primary btn-large btn-block" value="登陆"/>
			</div>
		</div>
	</div>
</body>
  </form>
</body>
</html>
