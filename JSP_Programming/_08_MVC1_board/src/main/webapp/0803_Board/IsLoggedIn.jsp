<%@ page import="model1.common.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>


<%
    // 로그인 여부 확인 코드 (재사용 ㄱㄱ)
    if (session.getAttribute("UserId") == null) {
        JSFunction.alertLocation("로그인 후 이용해주십시오.",
                "../0603_Session_DB_Login/LoginForm.jsp", out);
        return;
    }
%>