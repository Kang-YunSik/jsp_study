<%@ page import="model1.board.BoardDTO" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%@include file="IsLoggedIn.jsp"%>  <%-- 로그인 여부 확인 --%>
<%
    // 폼 값 받기
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    // 폼값을 DTO 객체에 저장
    BoardDTO dto = new BoardDTO();
    dto.setTitle(title);
    dto.setContent(content);
    dto.setId(session.getAttribute("UserId").toString());   // board(id)는 member(id)와 외래키 관계이므로
                                                            // member(id)가 null이면 INSERT를 수행할 때 오류가 발생하기 때문에
                                                            // session 영역에 저장된 UserId를 dto에 저장한다.

    // DAO 객체를 통해 DB에 DTO 저장
    BoardDAO dao = new BoardDAO(application);   // DB 연결
    int iResult = dao.insertWrite(dto);     // INSERT 쿼리 실행. 결과를 iResult 변수에 저장
    dao.close();    // DB 연결 해제

    // 성공 or 실패?
    if (iResult == 1) {
        response.sendRedirect("List.jsp");  // 성공하면 List 페이지로 이동
    } else {
        JSFunction.alertback("글쓰기에 실패하였습니다.", out); // 실패하면 경고창을 띄운 후, 이전페이지(글쓰기 페이지)로 이동
    }
%>
