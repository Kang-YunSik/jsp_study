<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<html>
<head>
    <title>JSTL - fmt 1</title>
</head>
<body>

<c:set var="today" value="<%= new Date()%>"/>

<h4>날짜 형식 만들기</h4>
<fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/> <br/>
<fmt:formatDate value="${ today }" type="both" pattern="yy/MM/dd HH:mm:ss"/>    <br/>
<fmt:formatDate value="${ today }" type="both" pattern="yyyy년 MM월 dd일 a hh:mm:ss"/> <br/>

</body>
</html>
