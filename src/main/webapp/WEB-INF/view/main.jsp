<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
          
          <%@ include file="/WEB-INF/view/layout/header.jsp" %>

        <main>
        	<div class="main-coulmn">
	            <div class="main-img">
	            	<img alt="트래블" src="/images/image/travel.jpg">
	            	<div class="see">
	            		<button class="main-btn" onclick="location.href='/product/list?secondCategoryId=1'">컬렉션 만나보기</button>
	            	</div>
	            </div>
	            <div class="main-img">
	            	<img alt="핸드백" src="/images/image/handbag.webp">
	            	<div class="see">
	            		<button class="main-btn"  onclick="location.href='/product/list?secondCategoryId=6'">컬렉션 만나보기</button>
	            	</div>
	            </div>
	            <div class="main-img">
	            	<img alt="지갑" src="/images/image/wallet.webp">
	            	<div class="see">
	            		<button class="main-btn"  onclick="location.href='/product/list?secondCategoryId=12'">컬렉션 만나보기</button>
	            	</div>
	            </div>
	            <div class="main-img">
	            		<img alt="쥬얼리&시계" src="/images/image/jewelry.jpg" />
	            		<div class="see">
	            			<button class="main-btn"  onclick="location.href='/product/list?secondCategoryId=15'">컬렉션 만나보기</button>
	            		</div>
	            </div>
            </div>
            
        </main>

          <%@ include file="/WEB-INF/view/layout/footer.jsp" %>
