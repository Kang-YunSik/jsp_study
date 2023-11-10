<%@ page import="common.PersonDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%
    request.setAttribute("requestString", "request 영역의 문자열");
    request.setAttribute("requestPerson", new PersonDTO("안중근", 31));
    request.setAttribute("requestPerson2", new PersonDTO("사라질 이름", 99));
%>
<html>
<head>
    <title>request 영역</title>
</head>
<body>
    <h2>request 영역의 속성값 삭제하기</h2>
    <%
        request.removeAttribute("requestString");
        request.removeAttribute("requestPerson2");
    %>

    <h2>request 영역의 속상값 읽기</h2>
    <%
        PersonDTO personDTO = (PersonDTO)(request.getAttribute("requestPerson"));
        PersonDTO personDTO2 = (PersonDTO)(request.getAttribute("requestPerson2"));
    %>
    <ul>
        <li>String 객체 : <%= request.getAttribute("requestString")%></li>
        <li>Person 객체 : <%= (personDTO == null) ? "값 없음" : personDTO.getName() %></li>
        <li>Person2 객체 : <%= (personDTO2 == null) ? "값 없음" : personDTO2.getName() %></li>
    </ul>

    <h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
    <%
        request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English")
                .forward(request, response);
    %>
    <%-- getRequestDispatcher 코드의 다른 형식  --%>
<%--    <%--%>
<%--        RequestDispatcher rd = request.getRequestDispatcher(--%>
<%--                "RequestForward.jsp?paramHan=한글&paramEng=English");--%>
<%--        rd.forward(request, response);--%>
<%--    %>--%>
</body>
</html>
