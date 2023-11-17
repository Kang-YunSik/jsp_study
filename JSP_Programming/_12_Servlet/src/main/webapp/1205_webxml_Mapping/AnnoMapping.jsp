<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>AnnoMapping.jsp</title>
</head>
<body>
<h2>web.xml에서 매핑 후 JSP에서 출력하기</h2>
<p>
    <%-- EL문자로 Attribute를 받아오기 때문에 null로 표시되지 않는다. --%>
    <strong>${message}</strong> <br/>
    <%-- 현재 jsp 파일의 경로를 <%=request.getContextPath()%>/1205_webxml_Mapping로 한 경우 --%>
    <a href="<%=request.getContextPath()%>/1205_webxml_Mapping/AnnoMapping.do">바로가기1</a> <br/>
    <%-- 현재 jsp 파일의 경로를 ./ 으로 한 경우 --%>
    <a href="./AnnoMapping.do">바로가기2</a>
</p>
</body>
</html>
