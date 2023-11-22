<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>
<div class="main-console ms-4 container">
	<div class="list-table-form table-responsive">
		<div class="h2 mt-3">문의사항 상세보기 페이지</div>
		<hr>
		<form method="post" action="/admin/qnaAnswer">
			<input type="hidden" name="qnaId" value="${qnaDetail.id}">
			<table class="list-table table text-center align-middle table-bordered">
				<tbody>
					<tr>
						<th>제목</th>
						<td><input class="form-control" type="text" name="title" value="${qnaDetail.title}" readonly></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control" rows="10" cols="70" readonly>${qnaDetail.content}</textarea></td>
					</tr>
					<tr>
						<th>답변</th>
						<c:choose>
							<c:when test="${qnaDetail.qatContent != null}">
								<td><textarea class="form-control" rows="10" cols="70" name="content" readonly>${qnaDetail.qatContent}</textarea></td>
							</c:when>
							<c:otherwise>
								<td><textarea class="form-control" rows="10" cols="70" name="content"></textarea></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</tbody>
			</table>
			<c:if test="${empty qnaDetail.qatContent}">
				<div class="text-end">
				<input class="btn btn-outline-secondary" type="submit" value="답변하기">
				</div>
			</c:if>
		</form>
	</div>
</div>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>