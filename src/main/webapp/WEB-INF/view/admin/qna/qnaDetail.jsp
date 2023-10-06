<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

				<form class="oneTableForm" method="post" action="/admin/qnaAnswer">
					<input type="hidden" name="qnaId" value="${qnaDetail.id}">
					<h2>문의사항 상세보기 페이지</h2>
					<table class = "oneTable">
					    <tbody>
					        <tr>
					            <td>제목</td>
					            <td><input type="text" name="title" value="${qnaDetail.title}" readonly></td>
					        </tr>
					        <tr>
					            <td>내용</td>
					            <td><textarea rows="10" cols="70" readonly>${qnaDetail.content}</textarea></td>
					        </tr>
					        <tr>
					            <td>답변</td>
					            <c:choose>
					            	<c:when test="${qnaDetail.qatContent != null}">
					            		<td><textarea rows="10" cols="70" name="content" readonly>${qnaDetail.qatContent}</textarea></td>
					            	</c:when>
					            	<c:otherwise>
					            		<td><textarea rows="10" cols="70" name="content"></textarea></td>
					            	</c:otherwise>
					            </c:choose>
					        </tr>
					    </tbody>
					</table>
					<c:if test="${empty qnaDetail.qatContent}">
						<input type="submit" value="답변하기">
					</c:if>
				</form>
		
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>