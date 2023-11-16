<%@ page import="el.MyELClass" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%
    MyELClass myELClass = new MyELClass();  // 일반 클래스를 호출하려면 객체 생성이 필수이다.
    pageContext.setAttribute("myClass", myELClass); // 객체를 page영역 "myclass"라는 이름으로 저장
%>
<html>
<head>
    <title>표현 언어(EL) - 메소드 호출</title>
</head>
<body>
    <%-- 일반 메소드를 호출하는 방법은 클래스로 객체를 생성해 영역에 객체를 저장하고 호출해야 한다. --%>
    <h3>영역에 저장 후 메소드 호출하기</h3>
    001225-3000000 => ${ myClass.getGender("001225-3000000") } <br/>
    001225-2000000 => ${ myClass.getGender("001225-2000000") }

    <%-- 정적(static) 메소드를 호출하는 방법으로 클래스명을 직접 호출하는 방법이 있다. --%>
    <h3>클래스명을 통해 정적 메소드 호출하기</h3>
    ${ MyELClass.showGugudan(7) }   <%-- MyELClass.java를 직접 호출하여 정적 메소드를 사용할 수 있다. --%>
                                    <%-- getGender()는 호출하지 못한다.(일반 메소드라서) --%>

</body>
</html>
