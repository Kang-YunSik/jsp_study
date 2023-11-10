<%@ page import="common.PersonDTO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>application 영역</title>
</head>
<body>
    <h2>application 영역의 속성 읽기</h2>
    <%
        Map<String, PersonDTO> maps = (Map<String, PersonDTO>) application.getAttribute("application_Object");
        Set<String> keys = maps.keySet();
        for (String key : keys) {
            PersonDTO personDTO = maps.get(key);
            out.print(String.format("이름 : %s, 나이 : %d<br/>",
                    personDTO.getName(), personDTO.getAge()));
        }
    %>
</body>
</html>
