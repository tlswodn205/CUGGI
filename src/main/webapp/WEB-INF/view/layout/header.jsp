<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
  <link rel="stylesheet" href="/css/style.css">
</head>

<body>
	<header>
	    <nav>
	        <div class="logo">
	            <a href="/"><img src="/images/logo/logo.png" alt=""></a>
	        </div>
	        <ul class="menu">
	            <li>트래블</li>
	            <li>핸드백</li>
	            <li>지갑</li>
	            <li>쥬얼리&시계</li>
	            <div class="submenu">
		                	<span class="close">X</span>
		                	<c:set var="modelObject" value="${AopParameter.before()}"/>

							<c:out value="${modelObject.test}"/>
		                <div class="subcategory">
			                <ul>
			                <c:forEach items="${secondCategoryList}" var="secondCategory" varStatus="loop">
			                <c:if test="${not loop.first && secondCategory.firstCategoryId ne previousItem.firstCategoryId}">
			                </ul>
			                <ul>
			                </c:if>
			                <li><a href="/product/list?secondCategoryId=${secondCategory.id}">${secondCategory.secondCategoryName}</a></li>
			                <c:if test="${loop.last}">
			                </ul>
			                </c:if>
			                <c:set var="previousItem" value="${secondCategory}" />
			                </c:forEach>
			                </ul>
		            	</div>
	            </div>
	        </ul>
	    </nav>
	</header>