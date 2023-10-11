<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
  <nav>
    <div class="logo">
      <div>
        <a href="/"><img src="/images/logo/logo.png" alt="" /></a>
      </div>
      <div class="logo-nav">
        <ul>
          <li class="basketBtn"><i class="fa-solid fa-bag-shopping"></i></li>
          <li class="profileBtn"><i class="fa-regular fa-user"></i></li>
          <li class="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></li>
        </ul>
      </div>
      <div class="search-area">
        <form action="/product/list" id="searchForm">
          <input type="text" name="searchData" id="searchInput" />
        </form>
      </div>
    </div>

    <ul class="menu">
      <li>트래블</li>
      <li>핸드백</li>
      <li>지갑</li>
      <li>쥬얼리&시계</li>
      <div class="submenu">
        <span class="close">X</span>
        <div class="subcategory">
          <ul>
            <li>더블백</li>
            <li>캐리어</li>
            <li>하드쉘</li>
          </ul>
          <ul>
            <li>탑 핸들백</li>
            <li><a href="/product/list?secondCategoryId=7">토트백</a></li>
            <li>숄더백</li>
            <li>크로스백</li>
            <li>미니백</li>
            <li>클러치</li>
          </ul>
          <ul>
            <li>카드 지갑</li>
            <li>반지갑</li>
            <li>장지갑</li>
            <li>체인지갑</li>
          </ul>
          <ul>
            <li>패션 주얼리</li>
            <li>파인 주얼리</li>
            <li>실버 주얼리</li>
            <li>시계</li>
          </ul>
        </div>
      </div>
    </ul>
  </nav>
</header>

 