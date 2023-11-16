<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<html>
<head>
    <title>JSTL - forEach 1</title>
</head>
<body>

<h4>일반 for문 형태의 forEach 태그</h4>
<c:forEach begin="1" end="3" step="1" var="i">
    <p>반복 ${i}입니다.</p>
</c:forEach>

<h4>varStatus 속성 살펴보기</h4>
<table border="1">
    <%-- 루프의 현재 속성을 알아볼 수 있다. --%>
    <c:forEach begin="3" end="5" var="i" varStatus="loop">
        <tr>
            <p>${i*10}</p>
            <td>count : ${ loop.count }</td>    <%-- 루프 돈 횟수 --%>
            <td>index : ${ loop.index }</td>    <%-- 루프에 사용된 변수(i) 값 --%>
            <td>current : ${ loop.current }</td>    <%-- 루프에 사용된 변수(i) 값?? --%>
            <td>first : ${ loop.first }</td>    <%-- 루프에 사용된 변수(i) 값이 시작값인지 --%>
            <td>last : ${ loop.last }</td>      <%-- 루프에 사용된 변수(i) 값이 마지막값인지 --%>
        </tr>
    </c:forEach>
</table>

<h4>1에서 100까지 정수 중 홀수의 합</h4>
<c:forEach begin="1" end="100" var="j">
    <c:if test="${j % 2 != 0}">
        <c:set var="sum" value="${sum+j}"/>
    </c:if>
</c:forEach>
1~100사이의 정수 중 홀수의 합은 ? ${sum}

</body>
</html>
