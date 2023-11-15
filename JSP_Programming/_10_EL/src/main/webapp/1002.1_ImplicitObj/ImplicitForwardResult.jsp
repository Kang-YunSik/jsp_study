<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>표현 언어(EL) - 내장 객체</title>
</head>
<body>
<h2>ImplicitForwardResult</h2>
<h3>각 영역에 저장된 속성 읽기</h3>
<ul>
    <li>페이지 영역 : ${ pageScope.scopeValue }</li> <!--page 영역의 값이므로 값이 출력되지 않는다.-->
    <li>리퀘스트 영역 : ${ requestScope.scopeValue }</li>
    <li>세션 영역 : ${ sessionScope.scopeValue }</li>
    <li>애플리케이션 영역 : ${ applicationScope.scopeValue }</li>
</ul>

<h3>영역 지정 없이 속성 읽기</h3>
<ul>
    <!--영역을 지정하지 않으면 가장 좁은 영역에서부터 속성을 찾는다.-->
    <!--request 영역의 값이 출력된다.-->
    <li>${scopeValue}</li>
</ul>
</body>
</html>
