<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import ="java.sql.*" %>

<%
    //1. JDBC 드라이버 로딩
    Class.forName("com.mysql.cj.jdbc.Driver");

    //2. Connection 객체 생성
    String url = "jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(url, "tester", "1234");

    //3, 4. 쿼리 실행
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select ID, passwd from user");

    //5. 쿼리 실행 결과 처리
    while(rs.next()){
        out.println(rs.getString("id") + " - " + rs.getString("passwd") + "<br>");
    }

    //6. 사용한 객체 닫기
    rs.close(); //ResultSet 닫기
    stmt.close(); //Statement 닫기
    conn.close(); //Connection 닫기
%>