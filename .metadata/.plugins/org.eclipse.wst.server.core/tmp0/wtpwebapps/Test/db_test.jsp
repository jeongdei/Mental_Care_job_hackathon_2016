list.jsp

<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Խ���</title>
</head>
<body>
<%
Connection conn = null; //�ʱ�ȭ
String url = "jdbc:mysql://localhost:3306/test"; // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
String id = "root"; // SQL ����� �̸�
String pw = "1234"; // SQL ����� �н�����
Class.forName("com.mysql.jdbc.Driver"); // DB�� �����ϱ� ���� DriverManager�� ����Ѵ�.
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
out.print("�� �Խù� : " + total + "��");
String listdb02 = "select * from emp";
rs = stmt.executeQuery(listdb02);
%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr height="5"><td width="5"></td></tr>
<tr>
<td width="5"></td>
<td width="73">��ȣ</td>
<td width="379">����</td>
<td width="73">�ۼ���</td>
<td width="164">�ۼ���</td>
<td width="58">��ȸ��</td>
<td width="7"></td>
</tr>
<%
if(total==0) {
%>
<tr align="center" bgcolor="#FFFFFF" height="30">
<td colspan="6">��ϵ� ���� �����ϴ�.</td>
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
<td><input type=button value="�۾���"></td>
</tr>
</table>
</body>
</html>