<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example._11_jstl.PersonDTO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - set 2</title>
</head>
<body>
<h4>List 컬렉션 이용하기</h4>
<%
    // List 객체 생성 및 객체 추가
    ArrayList<PersonDTO> pList = new ArrayList<>();
    pList.add(new PersonDTO("성삼문", 55));
    pList.add(new PersonDTO("박팽년", 60));
%>
<%--List 객체를 변수로 선언--%>
<c:set var="personList" value="<%=pList%>" scope="request"/>
<ul>
    <%--List 객체의 값 불러오기.--%>
    <%--List는 순서가 있기 때문에 index로 구분할 수 있음--%>
    <li>1번 Person의 이름 : ${ requestScope.personList[0].name}</li>    <%--성삼문--%>
    <li>2번 Person의 나이 : ${ requestScope.personList[1].age}</li>     <%--60--%>
</ul>

<h4>Map 컬렉션 이용하기</h4>
<%
    // Map 객체 생성 및 객체 추가
    Map<String, PersonDTO> pMap = new HashMap<>();
    pMap.put("personArgs1", new PersonDTO("하위지", 65));
    pMap.put("personArgs2", new PersonDTO("이개", 67));
%>
<%--Map 객체를 변수로 선언--%>
<c:set var="personMap" value="<%=pMap%>" scope="request"/>
<ul>
    <%--Map 객체의 값 불러오기.--%>
    <%--Map은 순서가 없기 때문에 Map 속성값(personArgs1,2)으로 구분--%>
    <li>1번 Person의 이름 : ${ requestScope.personMap.personArgs1.name}</li>    <%--하위지--%>
    <li>2번 Person의 나이 : ${ requestScope.personMap.personArgs2.age}</li>     <%--67--%>
</ul>
</body>
</html>
