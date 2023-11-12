<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장 객체 - Response</title>
</head>
<body>
    <%
        // user_id와 user_pw의 값을 확인하여 일치하면, ResponseWelcome.jsp 페이지로 보냄

        // id, pw 변수 선언
        String id = request.getParameter("user_id");
        String pw = request.getParameter("user_pw");
        // id, pw 변수가 특정 값과 일치한지 비교
        if (id.equalsIgnoreCase("must") && pw.equalsIgnoreCase("1234")) {
            // 일치하면 ResponseWelcome.jsp로 이동(Redirect)
            response.sendRedirect("ResponseWelcome.jsp");
        }else {
            // 일치하지 않으면 ResponseMain.jsp로 전달(forward)
            // 이때 쿼리스트링으로 loginErr 매개변수를 전달
            request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
                    .forward(request, response);
        }
    %>
</body>
</html>
