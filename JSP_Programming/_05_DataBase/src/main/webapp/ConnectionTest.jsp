<%@ page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head><title>JDBC</title></head>
<body>
<h2>JDBC 테스트 1</h2>
<%
    JDBConnect jdbc1 = new JDBConnect();
    jdbc1.close();
%>

<h2>JDBC 테스트 2</h2>
<%
    // 두 번째 생성자 사용. (web.xml 에서 <context-param>에 정의한 값 불러오기)
    String driver = application.getInitParameter("Driver");
    String url = application.getInitParameter("DriverURL");
    String id = application.getInitParameter("DriverId");
    String pw = application.getInitParameter("DriverPw");

    JDBConnect jdbc2 = new JDBConnect(driver,url,id, pw);
    jdbc2.close();
%>

<h2>JDBC 테스트 3</h2>
<%
    // 세 번째 생성자 사용. (클래스에서 context 매개변수 가져오기)
    JDBConnect jdbc3 = new JDBConnect(application);
    jdbc3.close();
%>
</body>
</html>