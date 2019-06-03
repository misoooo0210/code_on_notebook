<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>
    </div>
</c:if>
<label for="author">作成者</label><br />
<c:out value="${sessionScope.login_user.username}" />
<br /><br />

<label for="category">言語</label><br />
<select name="category">
    <c:set var="categories" value=""/>
    <c:forEach var="category" items="${categoryList}">
        <option value="${category.name}">${category.name}</option>
    </c:forEach>
</select>
<br /><br />

<label for="title">タイトル</label><br />
<input type="text" name="title" value="${code.title}" />
<br /><br />

<label for="content">内容</label><br />
<textarea name="content" rows="10" cols="50">${code.content}</textarea>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>