<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>

<%
    // 포함할 파일의 경로(표현식으로 사용할 변수)
    String outerpath1 = "OuterPage1.jsp";
    String outerpath2 = "OuterPage2.jsp";

    // page 영역과 request 영역에 속성 저장
    pageContext.setAttribute("pAttr", "동명왕");
    request.setAttribute("rAttr", "온조왕");
%>
<html>
<head>
    <title>지시어와 액션 태그 동작 방식 비교</title>
</head>
<body>
    <h2>지시어와 액션 태그 동작 방식 비교</h2>
    <%-- 지시어 방식 --%>
    <%-- 표현식 사용 불가능(Main에서 선언한 outerpath1 사용 불가) --%>
    <%-- 지시어 방식은 파일을 포함하기 때문에 해당 파일에서 선언한 변수(newVar1) 사용 가능 --%>
    <%-- 지시어 방식은 page 영역 속성을 사용할 수 있다.(용량=덩어리이 커짐) --%>
    <h3>지시어로 페이지 포함하기</h3>
    <%@ include file="OuterPage1.jsp"%>
    <p>외부 파일에 선언한 변수 : <%= newVar1 %></p>

    <%-- 액션 태그 방식 --%>
    <%-- 표현식 사용 가능(Main에서 선언한 outerpath2 사용 가능) --%>
    <%-- 액션 태그 방식은 링크 연결 방식이기 때문에 해당 파일에서 선언한 변수(newVar2) 사용 불가능 --%>
    <%-- 액션 태그 방식은 page 영역 속성을 사용할 수 없다.(용량=덩어리이 작아짐) --%>
    <h3>액션 태그로 페이지 포함하기</h3>
    <jsp:include page="OuterPage2.jsp" />   <!-- jsp 파일 경로로 포함 -->
    <jsp:include page="<%= outerpath2 %>" />    <!-- jsp 파일 경로를 저장한 변수로 포함(표현식 사용 가능) -->
    <p>외부 파일에 선언한 변수 : <%-- <%= newVar2 %> --%> </p>
</body>
</html>
