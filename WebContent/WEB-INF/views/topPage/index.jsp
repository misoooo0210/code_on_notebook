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
            <c:when test="${login_user != null}">
                <p id="toppage_p">ようこそ、<c:out value="${login_user.username}" />さん</p>
            </c:when>
            <c:otherwise>
                <p id="toppage_p">ようこそ、ゲストさん</p>
            </c:otherwise>
        </c:choose>
        <h2>今日の気まぐれコード</h2>
        <h2>人気のコード</h2>
    </c:param>
</c:import>