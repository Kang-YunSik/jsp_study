<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<html>
<head>
    <title>액션 태그 - Sub</title>  <%-- forward로 title 변경 --%>
</head>
<body>
    <h2>포워드 결과</h2> <%-- forward로 h2 변경 --%>
    <ul>
        <li>
            page 영역 : <%= pageContext.getAttribute("pAttr")%>   <%-- page 영역은 null --%>
        </li>
        <li>
            request 영역 : <%= request.getAttribute("rAttr")%>    <%-- request 영역은 공유 --%>
        </li>
    </ul>
</body>
</html>
