<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%-- core 태그를 사용하기 위한 taglib 지시어--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - set 1</title>
</head>
<body>
<%-- 변수 선언 --%>
<c:set var="directVar" value="100"/>
<c:set var="elVar" value="${ directVar mod 5 }"/>
<c:set var="expVar" value="<%= new Date()%>"/>
<c:set var="betweenVar">변수값 요렇게 설정</c:set>  <%-- value를 태그 사이에 정의할 수 있다. --%>

<h4>EL을 이용해 변수 출력</h4>
<ul>
    <%-- 변수 출력 --%>
    <li>directVar : ${ pageScope.directVar }</li>   <%-- scope 속성의 default 값은 page이다. --%>
    <li>elVar : ${ elVar }</li>
    <li>expVar : ${ expVar }</li>
    <li>betweenVar : ${ betweenVar }</li>
</ul>
</body>
</html>
