<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <title>페이지를 불러올 수 없습니다.</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/commons-style.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/error-style.css" />" />
    </head>
    <body style="background-color: aliceblue; padding-top: 200px">
        <div id="wrap-error" class="error-wrap">
            <div id="content" class="content">
                <div class="error-img">
                    <img src="<c:url value="/img/error_unresponsive.png" />" alt="페이지가 묵묵부답">
                </div>
                <p class="error-txt">문제가 발생했어요!(오류 코드 : 500())</p>
            </div>
        </div>
    </body>
</html>