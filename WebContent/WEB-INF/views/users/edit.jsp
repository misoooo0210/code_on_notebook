<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">
                <h2>登録情報編集</h2>
                <p>（パスワードは変更する場合のみ入力してください）</p>
                <form method="POST" action="<c:url value='/users/update' />">
                    <c:import url="_form.jsp" />
                </form>
                <p><a href="<c:url value='/users/deactive?id=${user.id}' />">アカウントを削除する</a></p>
            </c:when>
            <c:otherwise>
                <p>お探しのページは見つかりませんでした。</p>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>