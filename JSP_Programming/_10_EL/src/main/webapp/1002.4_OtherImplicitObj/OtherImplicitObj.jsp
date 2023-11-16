<%@ page import="com.example._10_el.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%
    // 쿠키 생성
    // 처음 브라우저로 접속 시에는 쿠키가 없다. 새로고침을 해야 쿠키가 적용된다.
    CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10);
%>
<html>
<head>
    <meta  charset="UTF-8">
    <title>표현 언어(EL) - 그 외 내장 객체</title>
</head>
<body>
<h3>쿠키값 읽기</h3>
<li>ELCookie값 : ${ cookie.ELCookie.value }</li> <%--새로고침 해야 값이 뜬다.--%>

<h3>HTTP 헤더 읽기</h3>
<ul>
    <li>host : ${ header.host }</li>
    <li>user-agent : ${ header['user-agent'] }</li>
    <li>cookie : ${ header.cookie }</li>    <%--새로고침 해야 값이 뜬다.--%>
</ul>

<%--web.xml에서 정의한 매개변수 읽기--%>
<h3>컨텍스트 초기화 매개변수 읽기</h3>
<li>mariaDBDriver : ${ initParam.Driver }</li>  <%--org.mariadb.jdbc.Driver--%>

<%--톰캣에서 Arifact(war, exploded war) 읽기--%>
<h3>컨텍스트 루트 경로 읽기</h3>
<li>${ pageContext.request.contextPath }</li>   <%-- _10_EL_war_exploded 출력 --%>
</body>
</html>
