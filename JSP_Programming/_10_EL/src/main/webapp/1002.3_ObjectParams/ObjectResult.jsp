<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>표현 언어(El) - 객체 매개변수</title>
</head>
<body>
<h2>영역을 통해 전달된 객체 읽기</h2>
<ul>
    <%--EL문자로 객체 읽기--%>
    <li>Person 객체 => 이름 : ${personObj.name}, 나이 : ${personObj.age}</li>
    <li>String 객체 => ${requestScope.stringObj} </li>
    <li>Integer 객체 => ${integerObj}</li>
</ul>

<h2>매개변수로 전달된 값 읽기</h2>
<ul>
    <%--EL문자 연산--%>
    <li>${param.firstNum + param['secondNum']}</li> <%--EL문자 연산 O--%>
    <li>${param.firstNum} + ${param['secondNum']}</li>  <%--EL문자 연산 X--%>
</ul>
</body>
</html>
