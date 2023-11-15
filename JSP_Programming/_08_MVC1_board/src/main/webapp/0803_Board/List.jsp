<%@ page import="model1.board.BoardDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%
    // DB 연결
    BoardDAO dao = new BoardDAO(application);

    // 사용자가 입력한 검색 조건을 Map에 저장
    Map<String, Object> param = new HashMap<String, Object>();
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");
    if (searchWord != null) {
        param.put("searchField", searchField);
        param.put("searchWord", searchWord);
    }

    int totalCount = dao.selectCount(param);    // 게시물 수 확인
    List<BoardDTO> boardLists = dao.selectList(param);  // 게시물 목록 받기
    dao.close();    // DB 연결 닫기
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원제 게시판</title>
</head>
<body>
    <%-- 상단 메뉴 include --%>
    <jsp:include page="../common/Link.jsp" />
    <h2>목록 보기(List)</h2>
    <%-- 검색 폼 --%>
    <form method="get">
        <table border="1" width="90%">
            <tr>
                <td align="center">
                    <select name="searchField">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord" />
                    <input type="submit" value="검색하기" />
                </td>
            </tr>
        </table>
    </form>

    <%-- 게시물 목록 테이블(표) --%>
    <table border="1" width="90%">
        <%-- 각 컬렘의 이름 --%>
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        <%-- 목록의 내용 --%>
        <%
            if (boardLists.isEmpty()) {
                // 게시물이 하나도 없을 때
        %>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
        <%
            }
            else {
                // 게시물이 있을 때
                int virtualNum = 0; // 화면상에서의 게시물 번호
                for (BoardDTO dto : boardLists) {   // 게시글 목록 읽기 메소드 반환값 List를 한 줄 씩 읽기
                    virtualNum = totalCount--;  // 전체 게시글 개수 확인 메소드 반환값 totalCount로 게시물 번호 정의
        %>
                    <tr align="center">
                        <td><%= virtualNum %></td>  <!-- 게시물 번호 -->
                        <td align="left">
                            <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>   <!-- 하이퍼링크(제목값) -->
                        </td>
                        <td align="center"><%= dto.getId() %></td>  <!-- 작성자 아이디 -->
                        <td align="center"><%= dto.getVisitcount() %></td>  <!-- 조회수 -->
                        <td align="center"><%= dto.getPostdate() %></td>    <!-- 작성일 -->
                    </tr>
            <%
                }
            }
            %>
    </table>
    <!-- 목록 하단의 [글쓰기] 버튼 -->
    <table border="1" width="90%">
        <tr align="right">
            <td>
                <button type="button" onclick="location.href='./Write.jsp';">글쓰기</button>
            </td>
        </tr>
    </table>
</body>
</html>
