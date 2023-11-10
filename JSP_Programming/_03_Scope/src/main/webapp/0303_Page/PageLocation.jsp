<%@ page import="common.PersonDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("pagePerson2", new PersonDTO("강윤식", 26));
%>
<html>
<head>
    <title>page 영역</title>
</head>
<body>
<h2>page 영역의 속성값 읽기</h2>
<%
    PersonDTO personDTO = (PersonDTO) (pageContext.getAttribute("pagePerson"));
    PersonDTO personDTO2 = (PersonDTO) (pageContext.getAttribute("pagePerson2"));
%>
<ul>
    <li>Person 객체 : <%= (personDTO == null) ? "값 없음" : personDTO.getName() %></li>
    <li>Person2 객체 : <%= (personDTO2 == null) ? "값 없음" : personDTO2.getName() %></li>
</ul>
</body>
</html>
