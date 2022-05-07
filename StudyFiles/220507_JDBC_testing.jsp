<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<html>
    <head>
        <title>Tomcat, Mysql 연동 테스트</title>
    </head>
    <body>
        <table width="100%" border="1">
            <tr>
                <td>user 테이블</td>
            </tr>
            <% // MySQL JDBC Driver Loading
                Class.forName("com.mysql.cj.jdbc.Driver"); //JDBC 로딩 함수
                Connection conn =null;
                Statement stmt =null;
                ResultSet rs =null;
                try {	
                    String jdbcDriver ="jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC"; 
                    String dbUser ="tester"; //mysql id
                    String dbPass ="1234"; //mysql password
                    String query ="select * from user"; //query에 user의 * 속성 출력
                    // Create DB Connection
                    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); //접속 시도

                    // Create Statement
                    stmt = conn.createStatement(); //접속한 객체에 Statement 생성

                    // Run Qeury
                    rs = stmt.executeQuery(query); //query 실행
                    //rs : query를 실행한 결과 result set

                    // Print Result (Run by Query)
                    while(rs.next()) { //rs를 한 줄씩 반복하며 출력
             %>

             //DB 데이터 출력
            <tr>
                <td><%= rs.getString("id") %></td>
                <td><%= rs.getString("passwd") %></td>
            </tr>

            //예외처리
            <%
                }
            } catch(SQLException ex) {
                out.println(ex.getMessage());
                ex.printStackTrace();
            } finally {
                // Close Statement
                if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
                if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
                // Close Connection
                if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
            }
            %>
        </table>
    </body>
</html>