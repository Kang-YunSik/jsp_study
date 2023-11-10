<%@ page import="common.PersonDTO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>application 영역</title>
</head>
<body>
    <h2>application 영역의 공유</h2>
    <%
        Map<String, PersonDTO> maps = new HashMap<>();
        maps.put("배우1", new PersonDTO("이수일", 30));
        maps.put("배우2", new PersonDTO("심순애", 28));
        application.setAttribute("application_Object", maps);
    %>
    application 영역에 속성이 저장되었습니다.
</body>
</html>
