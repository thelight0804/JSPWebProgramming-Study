<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import ="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<%
        request.setCharacterEncoding("utf-8");

        //url 쿼리스트링을 통한 입력 값 저장
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        //DB에 저장된 데이터
        ArrayList <String> passId = new ArrayList<String>();
        ArrayList <String> passPw = new ArrayList<String>();
        boolean Enter = false;

        // MySQL JDBC Driver Loading
        Class.forName("com.mysql.cj.jdbc.Driver"); //JDBC 로딩 함수
        
        String jdbcDriver ="jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC"; 
        String dbUser ="tester"; //mysql id
        String dbPass ="1234"; //mysql password
        String query ="select * from user"; //query에 user의 * 속성 출력

        // Create DB Connection
        Connection conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); //접속 시도

        // Create Statement
        Statement stmt = conn.createStatement(); //접속한 객체에 Statement 생성

        // Run Qeury
        ResultSet rs = stmt.executeQuery(query); //query 실행
        //rs : query를 실행한 결과 result set

        // Print Result (Run by Query)
        
        while(rs.next()) {  //rs를 한 줄씩 반복
                passId.add(rs.getString("id"));
                passPw.add(rs.getString("passwd"));
        } //while(rs.next()) 끝
%>


<%
        for(int i=0; i<passId.size(); i++){
                if(id.equals(passId.get(i))&&pw.equals(passPw.get(i))){ //ID와 PW가 일치할 시
                        Enter = true;
                        break; //일치하면 바로 for문을 빠져 나간다
                }
                else{
                        Enter = false;
                }
        }
        if(Enter == true)
                out.println("Login Succese!");
        else
                out.println("Login fail");
%>