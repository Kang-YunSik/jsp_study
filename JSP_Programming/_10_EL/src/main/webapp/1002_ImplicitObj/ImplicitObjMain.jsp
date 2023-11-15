<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>

<%
    // 각 영역에 속성값 저장/정의한다.
    // 속성값의 이름을 정의하고, EL문자에서 이 이름을 불러온다. (이름: scopeValue)
    pageContext.setAttribute("scopeValue", "페이지 영역");
    request.setAttribute("scopeValue", "리퀘스트 영역");
    session.setAttribute("scopeValue", "세션 영역");
    application.setAttribute("scopeValue", "애플리케이션 영역");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>표현 언어(EL) - 내장 객체</title>
</head>
<body>
    <h2>ImplicitObjMain 페이지</h2>
    <h3>각 영역에 저장된 속성 읽기</h3>
    <ul>
        <!--각 영역에 저장된 속성값을 출력한다.-->
        <!--변수를 EL로 사용-->
        <li>페이지 영역 : ${ pageScope.scopeValue }</li>
        <li>리퀘스트 영역 : ${ requestScope.scopeValue }</li>
        <li>세션 영역 : ${ sessionScope.scopeValue }</li>
        <li>애플리케이션 영역 : ${ applicationScope.scopeValue }</li>
    </ul>

    <h3>영역 지정 없이 속성 읽기</h3>
    <ul>
        <!--영역을 지정하지 않으면 가장 좁은 영역에서부터 속성을 찾는다.-->
        <li>${scopeValue}</li>
    </ul>

    <jsp:forward page="ImplicitForwardResult.jsp"/> <!--다른 페이지로 이동하는 액션 태그-->
</body>
</html>
