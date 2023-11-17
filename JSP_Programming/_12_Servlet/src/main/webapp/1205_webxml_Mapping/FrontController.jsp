<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FrontController.jsp</title>
</head>
<body>
<h3>한 번의 매핑으로 여러 가지 요청 처리하기</h3>
${ resultValue }
<ol>
    <li>URI : ${ uri }</li>
    <li>요청명 : ${ commanandStr }</li>
</ol>
<ul>
    <li><a href="../1205_webxml_Mapping/regist.one">회원가입</a></li>
    <li><a href="../1205_webxml_Mapping/login.one">로그인</a></li>
    <li><a href="../1205_webxml_Mapping/freeboard.one">자유게시판</a></li>
</ul>
</body>
</html>
