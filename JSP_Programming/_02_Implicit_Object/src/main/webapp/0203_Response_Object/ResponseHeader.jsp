<%@ page import="java.util.Collection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%
    // 응답 헤더에 추가할 값 준비
    SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-DD HH:mm");
    long add_date = s.parse(request.getParameter("add_date")).getTime();
    int add_int = Integer.parseInt(request.getParameter("add_int"));
    String add_str = request.getParameter("add_str");

    // 응답 헤더에 값 추가
    response.addDateHeader("add_myBirthday(입력값)", add_date);
    response.addIntHeader("add_myNumber(입력값)", add_int);
    response.addIntHeader("add_myNumber(서버에서 값 추가)", 5885);
    response.setIntHeader("set_myNumber(서버에서 값 변경)", 1004);
    response.addIntHeader("myNumber", add_int);
    response.addHeader("add_myName(입력값)", add_str);
    response.setHeader("set_myName(서버에서 값 변경)", "안중근");
%>
<html>
<head>
    <title>내장 객체 - response</title>
</head>
<body>
    <h2>응답 헤더 정보 출력하기</h2>
    <%
        // getHeaderNames()로 addHeader의 "Name"을 불러온다.
        // addHeader("Name", Value)
        Collection<String> headerNames = response.getHeaderNames();
        //
        for (String hName : headerNames) {
            // getHeader()로 addHeader의 value를 불러온다.
            String hValue = response.getHeader(hName);
    %>
    <li><%= hName %> : <%= hValue%> </li>
    <%
        }
    %>
    <h2>myNumber만 출력하기</h2>
    <%

        Collection<String> myNumber = response.getHeaders("myNumber");
        for (String myNum : myNumber) {
    %>
    <li>myNumber: <%= myNum %></li>
    <%
        }
    %>
</body>
</html>
