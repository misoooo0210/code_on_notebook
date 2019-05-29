<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2>HTMLの記事 一覧</h2>
        HTMLのエントリは${HTMLs_count}件です。<br />
        <table id ="html_list">
            <tbody>
                <c:forEach var="HTML" items="${HTMLs}" varStatus="status">
                    <tr>
                        <td><a href="<c:url value='/${html.title}' />">${html.title}</a></td>
                    </tr>
                    <tr>
                        <td>${html.created_at}</td>
                    </tr>
                    <tr>
                        <td>${html.content}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            <c:forEach var="i" begin="1" end="${((HTMLs_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/categories/html?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                        </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

    </c:param>
</c:import>