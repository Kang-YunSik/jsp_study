<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%@include file="./IsLoggedIn.jsp"%>
<%
    // 일련번호 얻기
    String num = request.getParameter("num");

    // DB에 저장
    BoardDTO dto = new BoardDTO();
    BoardDAO dao = new BoardDAO(application);
    dto = dao.selectView(num);

    // 로그인된 사용자 ID 얻기
    String sessionId = session.getAttribute("UserId").toString();

    int delResult = 0;

    if (sessionId.equals(dto.getId())) {    // 작성자가 본인인지 확인
        // 작성자가 본인이면
        dto.setNum(num);
        delResult = dao.deletePost(dto);    // 삭제
        dao.close();

        // 성공, 실패 처리
        if (delResult == 1) {
            JSFunction.alertLocation("삭제되었습니다.", "./List.jsp", out);
        } else {
            JSFunction.alertback("삭제에 실패하였습니다.", out);
        }
    } else {
        // 작성자가 본인이 아니면
        JSFunction.alertback("본인만 삭제할 수 있습니다.", out);

        return;
    }
%>