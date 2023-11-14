<%@ page import="model1.membership.MemberDAO" %>
<%@ page import="model1.membership.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%
    // 로그인 폼으로 부터 받은 아이디와 패스워드
    // request 내장 객체를 통해 받음
    String userId = request.getParameter("user_id");
    String userPwd = request.getParameter("user_pw");

    // web.xml에서 가져온 데이터베이스 연결 정보
    // application 내장 객체로 web.xml 정보를 받음
    String driver = application.getInitParameter("Driver");
    String url = application.getInitParameter("DriverURL");
    String id = application.getInitParameter("DriverId");
    String pwd = application.getInitParameter("DriverPw");

    // 회원 테이블 DAO를 통해 회원 정보 DTO 획득
    MemberDAO dao = new MemberDAO(driver, url, id, pwd);     // DB 연결
    MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);    // 쿼리문 수행(메소드 수행)
                                                                // request 객체로 얻은 값으로
                                                                // 일치한 회원정보가 있는지 확인(getMemberDTO() 수행)
    dao.close();

    // 로그인 성공 여부에 따른 처리
    if (memberDTO.getId() != null) {
        // 로그인 성공 (return 값인 dto가 존재함)
        // 세션의 정보 가져오기
        session.setAttribute("UserId", memberDTO.getId());
        session.setAttribute("UserName", memberDTO.getName());
        response.sendRedirect("./LoginForm.jsp"); // session 영역에 속성값을 저장한 뒤 LoginForm.jsp로 이동
                                                // (Redirect: 페이지 변경)
    }
    else {
        // 로그인 실패
        request.setAttribute("LoginErrMsg", "로그인 오류입니다.");  // LoginForm에서 LoginErrMsg를 출력하는 코드 존재
        request.getRequestDispatcher("./LoginForm.jsp").forward(request, response);
                // forward: 주소에는 LoginProcess.jsp가 표시되지만, LoginForm.jsp의 내용이 출력됨
    }
%>