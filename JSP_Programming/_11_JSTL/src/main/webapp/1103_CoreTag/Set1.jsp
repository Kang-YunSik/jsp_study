<%@ page import="java.util.Date" %>
<%@ page import="com.example._11_jstl.PersonDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%-- core 태그를 사용하기 위한 taglib 지시어--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - set 1</title>
</head>
<body>
<%-- 변수 선언 --%>
<c:set var="directVar" value="100"/>
<c:set var="elVar" value="${ directVar mod 5 }"/>
<c:set var="expVar" value="<%= new Date()%>"/>
<c:set var="betweenVar">변수값 요렇게 설정</c:set>  <%-- value를 태그 사이에 정의할 수 있다. --%>

<h4>EL을 이용해 변수 출력</h4>
<ul>
    <%-- 변수 출력 --%>
    <li>directVar : ${ pageScope.directVar }</li>   <%-- scope 속성의 default 값은 page이다. --%>
    <li>elVar : ${ elVar }</li>
    <li>expVar : ${ expVar }</li>
    <li>betweenVar : ${ betweenVar }</li>
</ul>

<h4>자바빈즈 생성 1 - 생성자 사용</h4>
<%-- value에서 자바빈즈를 생성하고, 자바빈즈의 값을 주었다. --%>
<c:set var="personVar1" value='<%=new PersonDTO("박문수", 50)%>' scope="request"/> <%-- value를 줄 때 ''안에 값을 준다. --%>
<ul>
    <%-- var에서 자바빈즈의 속성(name, age)를 출력한다. --%>
    <%-- 영역은 Scope --%>
    <li>이름 : ${ requestScope.personVar1.name }</li>
    <li>나이 : ${ personVar1.age }</li>
</ul>

<h4>자바빈즈 생성 2 - target, property 사용</h4>
<%-- value에서 자바빈즈를 생성만 했다. --%>
<c:set var="personVar2" value="<%=new PersonDTO()%>" scope="request"/>
<%-- target, property 속성으로 자바빈즈의 값을 주었다. --%>
<c:set target="${ personVar2 }" property="name" value="정약용"/>
<c:set target="${ personVar2 }" property="age" value="60"/> <%-- value를 줄 때 타입에 상관없이 ""안에 값을 준다. --%>
<ul>
    <li>이름 : ${ requestScope.personVar2.name }</li>
    <li>나이 : ${ personVar2.age }</li>
</ul>
</body>
</html>
