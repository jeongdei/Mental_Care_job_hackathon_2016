/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.72
 * Generated at: 2016-10-27 09:35:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class db_005ftest_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("list.jsp\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>게시판</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");

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

      out.write("\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n");
      out.write("<tr height=\"5\"><td width=\"5\"></td></tr>\n");
      out.write("<tr>\n");
      out.write("<td width=\"5\"></td>\n");
      out.write("<td width=\"73\">번호</td>\n");
      out.write("<td width=\"379\">제목</td>\n");
      out.write("<td width=\"73\">작성자</td>\n");
      out.write("<td width=\"164\">작성일</td>\n");
      out.write("<td width=\"58\">조회수</td>\n");
      out.write("<td width=\"7\"></td>\n");
      out.write("</tr>\n");

if(total==0) {

      out.write("\n");
      out.write("<tr align=\"center\" bgcolor=\"#FFFFFF\" height=\"30\">\n");
      out.write("<td colspan=\"6\">등록된 글이 없습니다.</td>\n");
      out.write("</tr>\n");

} else {
while(rs.next()) {
int idx = rs.getInt(1);
String name = rs.getString(2);
int title = rs.getInt(3);
int time = rs.getInt(4);
String hit = rs.getString(5);

      out.write("\n");
      out.write("<tr height=\"25\" align=\"center\">\n");
      out.write("<td>&nbsp;</td>\n");
      out.write("<td>");
      out.print(idx );
      out.write("</td>\n");
      out.write("<td align=\"left\">");
      out.print(title );
      out.write("</td>\n");
      out.write("<td align=\"center\">");
      out.print(name );
      out.write("</td>\n");
      out.write("<td align=\"center\">");
      out.print(time );
      out.write("</td>\n");
      out.write("<td align=\"center\">");
      out.print(hit );
      out.write("</td>\n");
      out.write("<td>&nbsp;</td>\n");
      out.write("</tr>\n");
      out.write("<tr height=\"1\" bgcolor=\"#D2D2D2\"><td colspan=\"6\"></td></tr>\n");

}
}
rs.close();
stmt.close();
conn.close();
} catch(SQLException e) {
out.println( e.toString() );
}

      out.write("\n");
      out.write("<tr height=\"1\" bgcolor=\"#82B5DF\"><td colspan=\"6\" width=\"752\"></td></tr>\n");
      out.write("</table>\n");
      out.write("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n");
      out.write("<tr><td colspan=\"4\" height=\"5\"></td></tr>\n");
      out.write("<tr align=\"center\">\n");
      out.write("<td><input type=button value=\"글쓰기\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
