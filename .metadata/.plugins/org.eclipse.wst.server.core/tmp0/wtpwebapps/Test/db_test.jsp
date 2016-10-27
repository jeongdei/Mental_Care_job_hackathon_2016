list.jsp

<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
</head>
<body>
<%
Connection conn = null; //초기화
String url = "jdbc:mysql://localhost:3306/test"; // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
String id = "root"; // SQL 사용자 이름
String pw = "1234"; // SQL 사용자 패스워드
Class.forName("com.mysql.jdbc.Driver"); // DB와 연동하기 위해 DriverManager에 등록한다.
int total = 0;
try {
conn = DriverManager.getConnection(url,id,pw);
Statement stmt = conn.createStatement();
String sqlCount = "SELECT COUNT(*) FROM emp where name = '" + id + "';";
ResultSet rs = stmt.executeQuery(sqlCount);
if(rs.next()){
total = rs.getInt(1);
}
rs.close();
out.print("총 게시물 : " + total + "개");
String listdb02 = "select * from emp";
rs = stmt.executeQuery(listdb02);
%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr height="5"><td width="5"></td></tr>
<tr>
<td width="5"></td>
<td width="73">번호</td>
<td width="379">제목</td>
<td width="73">작성자</td>
<td width="164">작성일</td>
<td width="58">조회수</td>
<td width="7"></td>
</tr>
<%
if(total==0) {
%>
<tr align="center" bgcolor="#FFFFFF" height="30">
<td colspan="6">등록된 글이 없습니다.</td>
</tr>
<%
} else {
while(rs.next()) {
int idx = rs.getInt(1);
String name = rs.getString(2);
int title = rs.getInt(3);
int time = rs.getInt(4);
String hit = rs.getString(5);
%>
<tr height="25" align="center">
<td>&nbsp;</td>
<td><%=idx %></td>
<td align="left"><%=title %></td>
<td align="center"><%=name %></td>
<td align="center"><%=time %></td>
<td align="center"><%=hit %></td>
<td>&nbsp;</td>
</tr>
<tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<%
}
}
rs.close();
stmt.close();
conn.close();
} catch(SQLException e) {
out.println( e.toString() );
}
%>
<tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr><td colspan="4" height="5"></td></tr>
<tr align="center">
<td><input type=button value="글쓰기"></td>
</tr>
</table>
</body>
</html>