<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>

<%
    // page 영역과 request 영역에 속성 저장
    pageContext.setAttribute("pAttr", "김유신");   // forward는 page 영역은 공유하지 않음.
    request.setAttribute("rAttr", "계백");    // forward는 request 영역만 공유
%>
<html>
<head>
    <title>액션 태그 - forward</title>
</head>
<body>
    <h2>액션 태그를 이용한 포워딩</h2>
    <%-- ForwardSub.jsp로 포워드--%>
    <%-- forward를 만나면 이전의 코드는 모두 무시해버린다. -> title/h2 태그 변화 확인 --%>
    <jsp:forward page="./ForwardSub.jsp"></jsp:forward>
</body>
</html>
