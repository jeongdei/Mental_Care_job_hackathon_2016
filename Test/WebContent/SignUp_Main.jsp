<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
 request.setCharacterEncoding("utf-8");  //Set encoding
 
 
Connection conn = null; //초기화
String url = "jdbc:mysql://localhost:3306/project"; // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
String id = "root"; // SQL 사용자 이름
String pw = "1234"; // SQL 사용자 패스워드
Class.forName("com.mysql.jdbc.Driver"); // DB와 연동하기 위해 DriverManager에 등록한다.
    String user_id=request.getParameter("user_id");
	String user_pw=request.getParameter("user_pw");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
    //out.println("code=>"+code);
    //Connection conn = DBconn.getConnection();
   conn = DriverManager.getConnection(url, id, pw);
    Statement st = conn.createStatement();
    String sql = "insert into counselor values('"+user_id+"','"+user_pw+"','"+tel+"','"+email+"',null,null,null,null,null,null,null,null,null)";
    
    

    st.executeUpdate(sql);
    st.close();
    conn.close();
       
%>

