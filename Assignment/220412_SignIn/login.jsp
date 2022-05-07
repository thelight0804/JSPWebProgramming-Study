<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String enterId = "park";
	String pw = request.getParameter("pw");
	String enterPw = "20183145";
	boolean Enter = false;
%>
<%
        if (id.equals(enterId)&&pw.equals(enterPw)){
                Enter = true;
		out.println("Login Succese!");
		out.println("ID : " + id);
		out.println("PW : " + pw);
        }
        else{
                Enter = false;
		out.println("Login fail");
        }
%>
