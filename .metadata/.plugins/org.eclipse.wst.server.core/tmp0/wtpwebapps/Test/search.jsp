
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null; //초기화
String url = "jdbc:mysql://localhost:3306/test"; // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
String id = "root"; // SQL 사용자 이름
String pw = "1234"; // SQL 사용자 패스워드
Class.forName("com.mysql.jdbc.Driver"); // DB와 연동하기 위해 DriverManager에 등록한다.
    String code=request.getParameter("code");
	String pass=request.getParameter("pass");
    //out.println("code=>"+code);
    //Connection conn = DBconn.getConnection();
   conn = DriverManager.getConnection(url, id, pw);
    Statement st = conn.createStatement();
    String sql = "Select * from emp where name='"+code+"' and id ="+pass;
    ResultSet rs = st.executeQuery(sql);
    if(rs.next()){ //검색된 결과가 존재하면 true
        String r_code = rs.getString("name"); //columnIndex or columnLabel
        int r_irum = rs.getInt("id"); //columnIndex or columnLabel
        //String r_celphone = rs.getString(3); //columnIndex or columnLabel
        int r_celphone = rs.getInt("s_id");
        %>
       
        <h1>조회결과</h1>
        <table border="1">
            <tr>
                <td>코드</td><td><%=r_code %></td>
            </tr>
            <tr>
                <td>품명</td><td><%=r_irum %></td>
            </tr>
            <tr>
                <td>담당연락처</td><td><%=r_celphone %></td>
            </tr>
            
        </table>
        <script>location.href="login.html" </script>
       
       
        <%
    }else{
        out.println("입력하신 "+code+"는 존재하지 않습니다.");
    }
    rs.close();
    st.close();
   
   
%>
</body>
</html>
