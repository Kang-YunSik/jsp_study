<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JDBC</title>
</head>
<body>
    <h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
    <%
        // DB에 연결
        JDBConnect jdbc = new JDBConnect();

        // 쿼리문 생성
        String sql = "SELECT id, pass, name, regidate FROM member";
        Statement stmt = jdbc.con.createStatement();


    %>
</body>
</html>
