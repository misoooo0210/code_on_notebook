<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Code on Notebook</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div id="wrapper">
                <div class="col-xs-12" id="header">
                    <h1>＜Code_on_Notebook /＞</h1>
                </div>
                <div id="content">
                    <nav class="navbar navbar-default navbar-fixed-bottom">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed"data-toggle="collapse"data-target="#navbarEexample8">
                                    <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="<c:url value='/' />">
                                    <img alt="Home" src="<c:url value='/home.png' />" style="height: 40px;">
                                </a>
                            </div>
                            <div class="collapse navbar-collapse" id="navbarEexample8">
                                <ul class="nav navbar-nav">
                                    <li><a href="<c:url value='/codes' />">コード</a></li>
                                    <c:choose>
                                        <c:when test="${login_user == null}">
                                            <li><a href="<c:url value='/login' />">ログイン</a></li>
                                            <li><a href="<c:url value='/registration' />">新規登録</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="<c:url value='/account' />">アカウント情報</a></li>
                                            <li><a href="<c:url value='/logout' />">ログアウト</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                    <li><a href="#">このサイトについて</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>

                    ${param.content}

                </div>
                <div id="footer">
                    by Hitomi Bamba.
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="main.js"></script>
    </body>
</html>

