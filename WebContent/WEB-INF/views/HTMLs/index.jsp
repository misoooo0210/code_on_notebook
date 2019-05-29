<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2>HTMLの記事 一覧</h2>
        ${HTMLs_count}件のエントリがあります。<br />
        <table id ="html_list">
            <tbody>
                <c:forEach var="HTML" items="${HTMLs}" varStatus="status">
                    <tr>
                        <td><a href="<c:url value='/categories/html/id=${HTML.id}' />">${HTML.title}</a></td>
                        <td>${HTML.created_at}</td>
                        <td>${HTML.content}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <nav>
        <ul class="pagination">
            <c:forEach var="i" begin="1" end="${((HTMLs_count - 1) / 15) + 1}" step="1">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:choose>
                    <c:when test="${i == page}">
                        <li class="disabled"><a href="#">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<c:url value='/categories/html?page=${i}' />"><c:out value="${i}" /></a></li>
                    </c:otherwise>
                </c:choose>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:forEach>
        </ul>
        </nav>

    </c:param>
</c:import>