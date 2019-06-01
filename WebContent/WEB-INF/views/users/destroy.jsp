<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">
                <p>本当に退会しますか？</p>

                <form method="POST" action="<c:url value='/account/destroy' />">
                    <input type="hidden" name="_token" value="${_token}" />
                    <input type="submit" value="退会する">
                </form>
            </c:when>
            <c:otherwise>
                <h2>お探しのページは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>