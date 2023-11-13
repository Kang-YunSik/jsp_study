<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss"); // 날짜 표시 형식

    long creationTime = session.getCreationTime(); // 최초 요청(세션 생성) 시각
    String creationTimeStr = dateFormat.format(new Date(creationTime)); // Date 포맷을 String으로 변경

    long lastTime = session.getLastAccessedTime(); // 마지막 요청 시각
    String lastTimeStr = dateFormat.format(new Date(lastTime)); // Date 포맷을 String으로 변경
%>

<html>
<head>
    <title>Session 설정 확인</title>
</head>
<body>
    <h2>Session 설정 확인</h2>
    <ul>
        <li>세선 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
        <li>세선 아이디 : <%= session.getId() %></li>
        <li>최초 요청 시각 : <%= creationTimeStr %></li>
        <li>마지막 요청 시각 : <%= lastTimeStr %></li>
    </ul>

</body>
</html>
