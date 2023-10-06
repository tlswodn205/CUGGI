<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

				<div class="oneTableForm">
					<h2>문의사항 리스트 페이지</h2>
					<table class = "oneTable">
						<thead>
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>답변처리</td>
								<td>작성일</td>
							</tr>
						</thead>
					    <tbody>
					    	<c:choose>
					    		<c:when test="${qnaList != null}">
					    			<c:forEach var="qna" items="${qnaList}">
								        <tr>
								            <td>${qna.id}</td>
								            <td><a href="/admin/qnaDetail/${qna.id}">${qna.title}</a></td>
								            <td>${qna.state}</td>
								            <td>${qna.createdAt}</td>
								        </tr>
							        </c:forEach>
						        </c:when>
					        </c:choose>
					    </tbody>
					</table>
				</div>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>