<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/e8f010a863.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"
      integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="/css/style.css">
  
</head>

<body>
	<header>
	    <nav>
		    <div class="logo">
		      <div class="logo-image">
		        <a href="/"><img src="/images/logo/logo.png" alt="" /></a>
		      </div>
		      <div class="logo-nav">
		        <ul>
		          <li class="basketBtn"><i class="fa-solid fa-bag-shopping"></i></li>
		          <li class="profileBtn"><i class="fa-regular fa-user"></i></li>
		          <li class="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></li>
		        </ul>
		      </div>
		      <div class="logo-service">
		      	<span><a class="common-black-line-link" href="/offlineStore"></a></span>
		      </div>
		      <div class="account-area">
		      	<c:choose>
		      	<c:when test="${principal == null}">
		      	<div class="login-no">
			      	<div><a class="common-black-font" href="/user/signIn">로그인</a></div>
			      	<div><a class="common-black-font" href="/user/signUp">회원가입</a></div>
			    </div>
			    </c:when>
			    <c:otherwise>
			    <div class="login-ok">
			    	<input type="hidden" id="is-login" value='${principal ne null}'>
			    	<div><a class="common-black-font" href="/user/updateForm">마이페이지</a></div>
			    	<div><a class="common-black-font" href="/user/logout">로그아웃</a></div>
			    	<div><a class="common-black-font" href="/order/orderList">주문내역</a></div>
			    	
			    	<c:if test="${principal.level >= 5 }">
			    	<div><a class="common-black-font" href="/admin/">관리자페이지</a></div>
			    	</c:if>
			    </div>
			    </c:otherwise>
		      	</c:choose>
		      </div>
		      <div class="search-area">
		        <form action="/product/list" id="searchForm" autocomplete="off">
		          <input type="text" name="searchData" id="searchInput" placeholder="검색어를 입력하세요."/>
		        </form>
		        <div class="content-area">
		        	<div class="search-productname">

		        	</div>
		        	<div class="search-image-area">

		        	</div>
		        </div>
		      </div>
		    </div>
	        <ul class="menu">
	            <li>트래블</li>
	            <li>핸드백</li>
	            <li>지갑</li>
	            <li>쥬얼리&시계</li>
	            <div class="submenu">
                	<span class="close">X</span>
						
						<c:forEach var="item" items="${secondCategoryList}" varStatus="loop">
						<c:if test="${loop.first}">
						<div class="subcategory">
                		<div class="sub-image"><a href="/product/list?firstCategoryId=${item.firstCategoryId}"><img src="/images/image/menu${item.firstCategoryId}.jpg"></a></div>
                		<ul>
						</c:if>
						<c:if test="${not loop.first && item.firstCategoryId ne previousItem}">
							</ul>
							</div>
							<div class="subcategory">
							<div class="sub-image"><a href="/product/list?firstCategoryId=${item.firstCategoryId}"><img src="/images/image/menu${item.firstCategoryId}.jpg"></a></div>
							<ul>
						</c:if>
							<li><a href="/product/list?secondCategoryId=${item.id}">${item.secondCategoryName}</a></li>
							
							<c:set var="previousItem" value="${item.firstCategoryId}" />
		            	
		            	</c:forEach>
		            	</ul>
		            	</div>
	        </ul>
	    </nav>
	    

	    
	    <script type="text/javascript">
	    // 헤더 검색	    
	    $("#searchInput").keyup(function(){     
	            let searchData = $('#searchInput').val().trim();
	         	// ajax 통신
	         	if(searchData) {
		            $.ajax({
		                type : "GET",            
		                url : "/product/search?searchData="+encodeURIComponent(searchData),    
		                success : function(data){ 
		                    $('.search-productname').text('');
	    					        $('.search-image-area').text('');
		                    	for(var i=0 in data){                            
		                            $('.search-productname').append('<p><a class="common-black-font" href="/product/detail?productId='+data[i].productId+'">'+data[i].productName+'</a></p>');
		                            $('.search-image-area').append('<a href="/product/detail?productId='+data[i].productId+'"><img src='+data[i].image+'></a>');
		                        }     
		                },
		                error : function(XMLHttpRequest, textStatus, errorThrown){ 
		                    alert("통신 실패.");
		                }
		            });
	         	}else{
                $('.search-productname').text('');
					      $('.search-image-area').text('');
	         	}
	        });
	    </script>
	</header>
