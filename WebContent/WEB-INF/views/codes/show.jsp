<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${code != null}">
                <h2>${code.title}</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>作った人</th>
                            <td><c:out value="${code.user.username}" /></td>
                        </tr>
                        <tr>
                            <th>作成日</th>
                            <td><fmt:formatDate value='${code.created_at}' pattern='yyyy/MM/dd' /></td>
                        </tr>
                        <tr>
                            <th>内容</th>
                            <td>
                                <pre><c:out value="${code.content}" /></pre>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <p><a href="<c:url value='/codes/print?id=${code.id}' />">このコードを印刷する</a></p>
                <c:if test="${sessionScope.login_user.id == code.user.id}">
                    <p><a href="<c:url value='/codes/edit?id=${code.id}' />">このコードを編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/codes' />">一覧に戻る</a></p>
    </c:param>
</c:import>