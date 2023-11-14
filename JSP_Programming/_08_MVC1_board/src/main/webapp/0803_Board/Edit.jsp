<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%@ include file="./IsLoggedIn.jsp"%>
<%
    String num = request.getParameter("num");   // 일련번호 받기
    BoardDAO dao = new BoardDAO(application);   // DAO 생성
    BoardDTO dto = dao.selectView(num);     // 게시물 가져오기
    String sessionId = session.getAttribute("UserId").toString();   // 로그인 ID 얻기
    // 로그인 한 유저의 게시글이 맞는지 판별
    if (!sessionId.equals(dto.getId())) {
        JSFunction.alertback("작성자 본인만 수정할 수 있습니다.", out);
        return;
    }
    dao.close();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원제 게시판</title>
    <script type="text/javascript">
        function validateForm(form) {   // 폼 내용 검증
            // 제목을 입력하지 않았으면, 경고창을 띄우고 title로 focus()
            if (form.title.value == "") {
                alert("제목을 입력하세요.");
                form.title.focus();
                return false;   // false가 반환되면 form 값을 submit(전송)하지 않음
            }
            // 내용을 입력하지 않았으면, 경고창을 띄우고 content로 focus()
            if (form.content.value == "") {
                alert("내용을 입력하세요.");
                form.content.focus();   // false가 반환되면 form 값을 submit(전송)하지 않음
                return false;
            }
        }
    </script>
</head>
<body>
<jsp:include page="../common/Link.jsp" />
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<%-- 수정 처리는 EditProcess.jsp --%>
<form name="writeFrm" method="post" action="EditProcess.jsp"
      onsubmit="return validateForm(this);">
    <input type="hidden" name="num" value="<%= dto.getNum() %>" />
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;"
                        value="<%= dto.getTitle() %>" />    <%-- 기존 게시글의 Title을 미리 입력 --%>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"><%= dto.getContent() %></textarea> <%-- 기존 게시글의 Content를 미리 입력 --%>
                                                                                        <%-- textarea 내부의 값은 공백이 없어야 한다. --%>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp';">목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
