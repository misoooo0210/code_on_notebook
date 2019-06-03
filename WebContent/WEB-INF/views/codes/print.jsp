<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/print.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${code != null}">
                <div id="section">
                    <h2>${code.title}</h2>
                        <pre><c:out value="${code.content}" /></pre>
                </div>
                <aside id="box">
                    <p>note</p>
                </aside>
            </c:when>
            <c:otherwise>
                <h2>お探しのページは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>