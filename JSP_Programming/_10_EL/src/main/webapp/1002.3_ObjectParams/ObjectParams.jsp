<%@ page import="com.example._10_el.PersonDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>표현 언어(El) - 객체 매개변수</title>
</head>
<body>
    <%
        // request 영역에 객체 생성
        request.setAttribute("personObj", new PersonDTO("홍길동", 33));    // 객체
        request.setAttribute("stringObj", "나는 문자열");    // 문자열
        request.setAttribute("integerObj", 99); // 정수
    %>
    <%--실행시 ObjectResult로 forward--%>
    <%--<jsp:param> : 액션 태그로 객체 생성, forward에 객체 전송--%>
    <jsp:forward page="ObjectResult.jsp">
        <jsp:param name="firstNum" value="10"/>
        <jsp:param name="secondNum" value="20"/>
    </jsp:forward>
</body>
</html>
