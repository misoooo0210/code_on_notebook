<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <c:choose>
            <c:when test="${user != null}">
                <h2>${user.username}のアカウント情報</h2>

                <h3>登録情報</h3><br />
                ユーザ名 : <c:out value="${user.username}" /><br />
                メールアドレス : <c:out value="${user.email}" />
                <p><a href="<c:url value='/account/edit?id=${user.id}' />">登録情報の編集</a></p>
                <h3>いいねした記事</h3>
            </c:when>
            <c:otherwise>
                <h2>お探しのページは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>