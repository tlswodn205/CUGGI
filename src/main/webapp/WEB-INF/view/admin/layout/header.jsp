<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<style>
html,body{
	height: 100%;
}

.wrap{
	height: 100%;
}

.topBar{
	background-color: #ccc;
	border: 1px solid; 
	height: 50px;
}

.logo{
	height : 40px;
}

.container{
	display: flex;
	height: 100%;
}

.sideBar{
	background-color: #ccc;
	border-right: 1px solid; 
	border-left: 1px solid; 
	border-bottom: 1px solid; 
	width:200px;
	height: 100%;
}

.mainConsole{
	flex-grow:1;
}

.listTableForm{
	margin-top: 50px;
	margin-left: 30px;
}

.insertButton{
}

.listTable{
	margin-top: 4px;
	
	
	border: 1px solid; 	
    border-collapse: collapse;
    
	text-align: center;
}

.listTable th {
    border: 1px solid #444444;
    
	background-color: #ccc;
	
    padding: 10px;
}
  
.listTable td {
    border: 1px solid #444444;
    padding: 10px;
}

.oneTableForm{
	margin-top: 54px;
	margin-left: 30px;
}

.oneTable{
	
	border: 1px solid; 	
    border-collapse: collapse;
}

.oneTable td {
    border: 1px solid #444444;
    padding: 10px;
}


.oneTable td:first-child{
	text-align: center;
	background-color: #ccc;
}
  
.oneTable td:last-child{
	background-color: #fff;
	width: 500px;
}
  
.oneTable input[type=text] {
	width: 300px;
}

.oneTableForm input[type=submit] {
	margin-top:4px;
	float: left;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class = "topBar">
			<a href="#">
				<img class = "logo" src="/image/logo.png">admin
			</a>
		</div>
		<div class="container">
			<div class="sideBar">
				<div>
					<a href="#">오프라인매장관리</a>
				</div>
			</div>
			<div class= "mainConsole">