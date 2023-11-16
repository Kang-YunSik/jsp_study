<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - forEach2</title>
</head>
<body>
<h2>향상된 for문 형태의 forEach 태그</h2>
<%
    String[] rgba = {"Red", "Green", "Blue", "Black"};
%>
<%--c변수로 rgba 배열을 반복 실행--%>
<c:forEach items="<%=rgba%>" var="c">
    <span style="color: ${c};">${c}</span>
</c:forEach>

<h4>varStauts 속성 살펴보기</h4>
<table border="1">
    <c:forEach items="<%=rgba%>" var="c" varStatus="loop">
        <tr>
            <td>
            <td>count : ${ loop.count }</td>
            <%--시작과 종료가 items에 지정된 객체에 따라 결정되므로 index는 0부터 시작--%>
            <td>index : ${ loop.index }</td>
            <%--현재 루프의 객체가 반환--%>
            <td>current : ${ loop.current }</td>
            <td>first : ${ loop.first }</td>
            <td>last : ${ loop.last }</td>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
