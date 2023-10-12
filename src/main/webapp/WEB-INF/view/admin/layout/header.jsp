<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
a{
	color: #000; 
	text-decoration: none; 
	outline: none
}

ul{
   list-style:none;
   padding:0px;
   margin : 0px;
}

li{
   list-style:none;
   padding-left:0px;
}

.admin-wrap{
	height: 100%;
	padding: 0;
	margin: 0;
}

.admin-wrap .top-bar{
	background-color: #ccc;
	border: 1px solid; 
	height: 50px;
}

.admin-wrap .logo{
	height : 40px;
}

.admin-wrap .container{
	display: flex;
	height: 100%;
}

.admin-wrap .side-bar{
	background-color: #ccc;
	border-right: 1px solid; 
	border-left: 1px solid; 
	border-bottom: 1px solid; 
	width:200px;
	height: 100%;
}

.admin-wrap .side-bar ul{
	margin-left: 5px;
	margin-top :
}

.admin-wrap .side-bar li{
   list-style:inside;
}
   
.admin-wrap .side-bar a:hover{
	color: #fff;
}

.admin-wrap .main-console{
	flex-grow:1;
}

.admin-wrap .list-table-form{
	margin-top: 50px;
	margin-left: 30px;
}

.admin-wrap .top-menu{
	display: flex;
	justify-content: space-between;
}

.admin-wrap .insert-btn{
}
.admin-wrap .list-table{
	margin-top: 4px;
	
	
	border: 1px solid; 	
    border-collapse: collapse;
    
	text-align: center;
}

.admin-wrap .list-table th {
    border: 1px solid #444444;
    
	background-color: #ccc;
	
    padding: 10px;
}
  
.admin-wrap .list-table td {
    border: 1px solid #444444;
    padding: 10px;
}

.admin-wrap .one-table-form{
	margin-top: 54px;
	margin-left: 30px;
}

.admin-wrap .one-table{
	
	border: 1px solid; 	
    border-collapse: collapse;
}

.admin-wrap .one-table td {
    border: 1px solid #444444;
    padding: 10px;
}


.admin-wrap .one-table td:first-child{
	text-align: center;
	background-color: #ccc;
}
  
.admin-wrap .one-table td:last-child{
	background-color: #fff;
	width: 500px;
}
  
.admin-wrap .one-table input[type=text] {
	width: 300px;
}

.admin-wrap .one-table-form input[type=submit] {
	margin-top:4px;
	float: left;
}

.admin-wrap .pagination{
	display: flex;
	justify-content: center;
	margin-top:4px;
}



.admin-wrap .pagination li{
	border: 1px solid #000;
	margin-left:4px;
	margin-right:4px;
	list-style: none; /* kjh */
}

.admin-wrap .pagination a{
	color: #00f;
	padding: 4px;
}

.admin-wrap .pagination label{
	color: #000;
	padding: 4px;
}


</style>


</head>
<body>
	<div class="admin-wrap">
		<div class = "top-bar">
			<a href="/">
				<img class = "logo" src="/images/logo/logo.png">admin
			</a>
		</div>
		<div class="container">
			<div class="side-bar">
				<div>
					<ul>
						<li>
							<a href="/admin/offlineStoreManagement">오프라인매장관리</a>
						</li>
						<li>
							<a href="/admin/qnaList">문의사항관리</a>
						</li>
						<li>
					    <a href="/admin/product">상품관리</a>
						</li>
					</ul>
				</div>
			</div>
			<div class= "main-console">