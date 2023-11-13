<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>

<%
    // 방법1: 회원인증정보 속성 삭제
    // getMemberDTO() 메소드를 수행하지 못하게 함
    session.removeAttribute("UserId");
    session.removeAttribute("UserName");

    // 방법2: 모든 속성 한꺼번에 삭제
    // 세션 자체를 무효화. 이때 session 영역의 모든 속성을 한꺼번에 삭제함.
    // 세션 정보를 다 삭제시키는 것이므로 해당 방법이 더 선호된다.
    session.invalidate();

    // 속성 삭제 후 페이지 이동
    response.sendRedirect("LoginForm.jsp");
%>