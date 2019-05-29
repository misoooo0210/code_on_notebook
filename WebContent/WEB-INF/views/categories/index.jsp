<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>カテゴリー一覧</h2>
            <tbody>
                <c:forEach var="category" items="${categories}" varStatus="status">
                    <tr>
                        <td><a href="<c:url value='/${category.name}' />">${category.name}</a></td>
                    </tr>
                </c:forEach>
            </tbody>
    </c:param>
</c:import>