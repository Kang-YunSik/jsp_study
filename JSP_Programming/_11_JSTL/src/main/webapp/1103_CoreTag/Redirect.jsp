<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - redirect</title>
</head>
<body>
<c:set var="requestVar" value="MustHave" scope="request"/>  <%--리다이렉트는 포워드와 달리 request 영역이 공유되지 않는다.--%>
<c:redirect url="./OtherPage.jsp">
    <c:param name="user_param1" value="출판사"/>   <%--<c:param>으로 전달한 매개변수만 출력--%>
    <c:param name="user_param2" value="골든래빗"/>
</c:redirect>
</body>
</html>
