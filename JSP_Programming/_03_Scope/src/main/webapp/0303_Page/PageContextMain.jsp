<%@ page import="common.PersonDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%
    pageContext.setAttribute("pagePerson", new PersonDTO("한석봉", 99));
%>
<html>
<head>
    <title>Page 영역</title>
</head>
<body>
    <h2>page 영역의 속성값 읽기</h2>
    <%
        PersonDTO personDTO = (PersonDTO) (pageContext.getAttribute("pagePerson"));
    %>
    <ul>
        <li>Person 객체 : <%= personDTO.getName() %>, <%= personDTO.getAge() %></li>
    </ul>

    <h2>include된 파일에서 page 영역 읽어오기</h2>
    <%@ include file="PagaInclude.jsp"%>

    <h2>페이지 이동 후 page 영역 읽어오기</h2>
    <a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>

</body>
</html>
