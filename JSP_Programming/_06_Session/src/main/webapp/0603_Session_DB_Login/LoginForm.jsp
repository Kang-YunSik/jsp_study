<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<html>
<head>
    <title>Session</title>
    <style>
        table {
            border: 1px solid;
            width: 90%;
            margin: 0 auto;
        }
        td {
            text-align: center;
        }
    </style>
</head>
<body>
    <jsp:include page="common/Link.jsp" />
    <h2>로그인 페이지</h2>
    <span style="color: red;
            font-size: 1.2em;">
        <%-- request 내장 객체 영역에 LoginErrMsg가 있는지 판별 --%>
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg")%>
    </span>
    <%
        // 세션 영역에 사용자 아이디가 있는지 확인.
        // 없으면 로그아웃 상태, 있으면 로그인 상태
        if(session.getAttribute("UserId") == null) {    // 로그인 상태 확인
            // 로그아웃 상태
    %>
    <script>
        <%-- validateForm으로 빈 form이 있는지 판별 --%>
        function validateForm(form) {
            if (!form.user_id.value) {
                alert("아이디를 입력하세요.");
                return false;
            }
            if (form.user_pw.value == "") {
                alert("패스워드를 입력하세요.");
                return false;
            }
        }
    </script>
    <%-- submit 수행하면 LoginProcess.jsp(로그인 성공여부 판단)로 이동 --%>
    <form action="LoginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);">  <%-- submit을 실행하면, validateForm 메소드를 수행 --%>
        아이디 : <input type="text" name="user_id" /> <br/>
        패스워드 : <input type="password" name="user_pw"/> <br/>
        <input type="submit" value="로그인하기"/>
    </form>
    <%
        } else { // 로그인 상태
    %>
        <%= session.getAttribute("UserName")%> 회원님, 로그인하셨습니다. <br/>
        <a href="Logout.jsp">[로그아웃]</a>
    <%
        }
    %>
</body>
</html>
