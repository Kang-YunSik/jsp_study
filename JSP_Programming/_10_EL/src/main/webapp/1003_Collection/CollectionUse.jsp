<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example._10_el.PersonDTO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta  charset="UTF-8">
    <title>표현 언어(EL) - 컬렉션</title>
</head>
<body>
<h2>List 컬렉션</h2>
<%
    List<Object> aList = new ArrayList<>();
    aList.add("청해진");
    aList.add(new PersonDTO("장보고", 28));
    pageContext.setAttribute("Ocean", aList);   <%-- page영역에 "Ocean"이라는 이름으로 aList를 저장 --%>
%>
<ul>
    <li>0번째 요소 : ${ Ocean[0] }</li>
    <li>1번째 요소 : ${ Ocean[1].name }, ${ Ocean[1].age }</li> <%-- 객체 출력 방법 --%>
    <li>2번째 요소 : ${ Ocean[2] }</li> <%-- 출력되지 않음 : 2번째 요소가 없으니깐 ㅋㅋ --%>
                                        <%-- 하지만 EL문자라서 null이라고 컴파일 오류가 발생하는 것은 아님 --%>
</ul>

<h2>Map 컬렉션</h2>
<%
    Map<String, String> map = new HashMap<>();
    map.put("한글", "훈민정음");
    map.put("Eng", "English");
    pageContext.setAttribute("King", map);  <%-- page영역에 "King"이라는 이름으로 aList를 저장 --%>
%>
<ul>
    <li>영문 Key : ${ King["Eng"] }, ${ King['Eng'] }, ${ King.Eng }</li>
    <li>한글 Key : ${ King["한글"] }, ${ King['한글'] }, \${ King.한글 }</li>
</ul>
</body>
</html>
