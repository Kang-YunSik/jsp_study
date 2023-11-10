<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<%
    String popupMode = "on";

    // 쿠키 읽기
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            String cookieName = c.getName();
            String cookieValue = c.getValue();
            if (cookieName.equals("PopupClose")) {
                popupMode = cookieValue;
            }
        }
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>쿠키를 이용한 팝업 관리 ver 0.0.1</title>
    <style>
        div#popup {
            position : absolute;
            top: 100px;
            left: 50px;
            color: yellow;
            width: 270px;
            height: 100px;
            background-color: gray;
        }
        div#popup>div {
            position: relative;
            background-color: #ffffff;
            top: 0px;
            border: solid 1px gray;
            padding: 10px;
            color: black;
        }
        div#popup>h2 {
            text-align: center;
        }
        div#popup>div>form {
            text-align: right;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script>
        $(function () {
            $('#closeBtn').click(function () { // id=closeBtn(닫기버튼)을 클릭하면
                $('#popup').hide(); // id=popup(팝업창)을 숨겨라
                var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
                if (chkVal==1) {
                    $.ajax({
                        url : './PopupCookie.jsp',
                        type : 'get',
                        date : {inactiveToday : chkVal},
                        dataType : 'text',
                        success : function (resData) {
                            if (resData != '') {
                                location.reload();
                            }
                        }
                    })
                }
            })
        })
    </script>
</head>
<body>
    <h2>팝업 메인 페이지(ver 0.0.1)</h2>
    <%
        for (int i=1; i<=10; i++) {
            out.print("현재 팝업창은 "+ popupMode + " 상태입니다.<br/>");
        }

        if (popupMode.equals("on")) {
    %>
        <div id="popup">
            <h2>공지사항 팝업입니다.</h2>
            <div>
                <form name="popFrm">
<%--                    체크박스--%>
                    <input type="checkbox" id="inactiveToday" value="1"/>
                    하루 동안 열지 않음
<%--                    닫기 버튼--%>
                    <input type="button" value="닫기" id="closeBtn"/>
                </form>
            </div>
        </div>
    <%
        }
    %>
</body>
</html>
