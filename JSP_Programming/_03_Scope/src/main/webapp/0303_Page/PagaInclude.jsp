<%@ page import="common.PersonDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
    <h4>Include 페이지</h4>
    <%
        PersonDTO personDTO2 = (PersonDTO) (pageContext.getAttribute("pagePerson"));
    %>
    <ul>
        <li>Person 객체 : <%= personDTO2.getName() %>, <%= personDTO2.getAge() %></li>
    </ul>
