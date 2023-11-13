<%@ page import="util.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%
    // 이름이 "loginId" 인 쿠키를 읽어와 loginId 변수에 저장
    String loginId = CookieManager.readCookie(request, "loginId");

    // cookieCheck 변수의 값 설정
    // 이름이 "loginId"인 쿠키가 있을 때 checked 속성을 부여
    String cookieCheck = "";
    if (!loginId.equals("")) {
        cookieCheck = "checked";
    }
%>
<html>
<head>
    <title>Cookie - 아이디 저장하기</title>
</head>
<body>
    <h2>로그인 페이지</h2>
    <form action="IdSaveProcess.jsp" method="post">
        아이디 : <input type="text" name="user_id" value="<%= loginId %>" /><!-- loginId 변수를 value 값으로 사용 -->
        <input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> /><!-- cookieCheck 변수를 속성 값으로 사용 -->
        아이디 저장하기
        <br/>
        패스워드 : <input type="text" name="user_pw" />
        <br/>
        <input type="submit" value="로그인하기" />
    </form>
</body>
</html>
