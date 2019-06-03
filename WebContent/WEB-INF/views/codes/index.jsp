<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

        <h2>すべてのコード</h2>
        <p>${codes_count}件のエントリがあります。</p><br />
        <div id="sidebar" class="col-md-4 col-sm-2">
            <div class="sidebar-inner">
                <div class="global-nav-header">言語を選択</div>
                    <ul class="global-nav">
                        <li><a href="<c:url value='/code/html' />">html</a></li>
                        <li><a href="<c:url value='/code/css' />">css</a></li>
                        <li><a href="<c:url value='/code/java' />">java</a></li>
                    </ul>
            </div>
        </div>

        <c:choose>
            <c:when test="${login_user != null}">
                <p><a href="<c:url value='/codes/new' />">新しいコードを作成する</a></p>
            </c:when>
            <c:otherwise>
                <p><a href="<c:url value='/login' />">ログインしてコードを作成する</a></p>
            </c:otherwise>
        </c:choose>

        <div id="main_contents" class="col-md-8 col-sm-10 col-xs-12" style="background: #fff">
            <table id ="code_list">
                <tbody>
                    <c:forEach var="code" items="${codes}" varStatus="status">
                        <tr>
                            <td><a href="<c:url value='/codes/show?id=${code.id}' />">${code.title}</a></td>
                            <td><fmt:formatDate value='${code.created_at}' pattern='yyyy/MM/dd' /></td>
                            <td>${code.content}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <nav>
        <ul class="pagination">
            <c:forEach var="i" begin="1" end="${((codes_count - 1) / 10) + 1}" step="1">
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
                        <li><a href="<c:url value='/codes?page=${i}' />"><c:out value="${i}" /></a></li>
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