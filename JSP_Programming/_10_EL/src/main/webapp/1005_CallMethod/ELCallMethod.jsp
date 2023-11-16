<%@ page import="el.MyELClass" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="mytag" uri="../WEB-INF/MytagLib.tld" %>

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

    <%-- WEB-INF폴더에 TLD 파일을 만들고, TLD 파일에서 메소드를 등록해야 한다. --%>
    <h3>TLD 파일 등록 후 정적 메소드 호출하기</h3>
    <ul>
        <li>mytag:isNumber("100") => ${ mytag:isNumber("100")}</li>
        <li>mytag:isNumber("이백") => ${ mytag:isNumber("이백")}</li>
    </ul>
</body>
</html>
