<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<table>
    <tr>
        <td>
            <%-- 로그인 정보에 따라 메뉴를 다르게 출력 --%>
            <% if (session.getAttribute("UserId") == null) { %>
                <%-- 로그아웃 시 로그인 메뉴 출력 --%>
                <a href="LoginForm.jsp">로그인</a>
            <% } else { %>
                <%-- 로그인 시 로그아웃 메뉴 출력 --%>
                <a href="Logout.jsp">로그아웃</a>
            <% } %>
                &nbsp;&nbsp;&nbsp; <!-- 메뉴 사이의 공백 처리 -->
                <a href="#">게시판(페이징X)</a>
                &nbsp;&nbsp;&nbsp; <!-- 메뉴 사이의 공백 처리 -->
                <a href="#">게시판(페이징O)</a>
        </td>
    </tr>
</table>
