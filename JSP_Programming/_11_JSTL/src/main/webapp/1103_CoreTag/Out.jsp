<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<html>
<head>
    <title>JSTL - out</title>
</head>
<body>
<c:set var="iTag">
    i 태그는 <i>기울임</i>을 표현합니다.
</c:set>

<h4>기본 사용</h4>
<c:out value="${iTag}"/>    <%--HTML 태그를 인식하지 않음--%>

<h4>escapeXml 속성</h4>
<c:out value="${iTag}" escapeXml="false"/>  <%--HTML 태그를 인식함--%>

<h4>default 속성</h4>
<c:out value="${param.name}" default="이름 없음"/>  <%--null값이라 default값이 출력--%>
<c:out value="" default="빈 문자열도 값입니다."/>    <%--빈 문자열도 값이다(null이 아니다)--%>
</body>
</html>
