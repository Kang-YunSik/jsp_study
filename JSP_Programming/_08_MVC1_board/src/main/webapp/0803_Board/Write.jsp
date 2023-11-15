<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>

<%@include file="IsLoggedIn.jsp"%> <!-- 로그인 확인 -->
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

        window.onpageshow = function(event) {
        //back 이벤트 일 경우
        if (event.persisted) {
            location.reload(true);
            }
        }

    </script>
</head>
<body>
    <jsp:include page="../common/Link.jsp" />   <%-- Link.jsp include --%>
    <h2>회원제 게시판 - 글쓰기(Write)</h2>
    <form name="writeFrm" method="post" action="./WriteProcess.jsp"
            onsubmit="return validateForm(this);">  <%-- submit(작성완료)를 눌렀을 때, validateForm() 호출 --%>
        <table border="1" width="90%">
            <tr>
                <td>제목</td>
                <td>
                    <input type="text" name="title" style="width: 90%;" />
                </td>
            </tr>
            <tr>
                <td>내용</td>
                <td>
                    <textarea name="content" style="width: 90%; height: 100px;"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit">작성 완료</button>
                    <button type="reset">다시 입력</button>
                    <button type="button" onclick="location.href='List.jsp';">
                        목록 보기</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
