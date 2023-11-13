<%@ page import="util.CookieManager" %>
<%@ page import="util.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%
    // form 값 읽기
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    String save_check = request.getParameter("save_check");

    if ("must".equals(user_id) && "1234".equals(user_pw)) {     // 사용자 인증
        // 로그인 성공
        if (save_check != null && save_check.equals("Y")) {     // [아이디 저장하기] 체크 확인
            CookieManager.makeCookie(response, "loginId", user_id, 86400);
        } else {
            CookieManager.deleteCookie(response, "loginId");
        }

        JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);    // JSFunction 사용
    }
    else {
        // 로그인 실패
        JSFunction.alertback("로그인에 실패했습니다.", out);  // JSFunction 사용
    }
%>