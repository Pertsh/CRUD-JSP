<%@ page import="am.pac.UserDao" %>
<%@ page import="am.pac.User" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>crud</title>
    <link href="../style/styleForEdit.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="main">
    <div id="head">
        <H2 ID="head-title">BASIC CRUD UI</H2>

    </div>
        <%
        UserDao userDao = new UserDao();
        int id = Integer.parseInt(request.getParameter("id"));
       String firstname = request.getParameter("firstname");
       String lastname  = request.getParameter("lastname");
       String email = request.getParameter("email");
       String date = request.getParameter("date");
    %>
    <div id="body">

        <div id="inputAreas">
            <h3> Edit USER</h3>
            <form action="" method="post">
                <input name="in2" class="Areas" id="in2" type="text" placeholder="firstname"
                       onmouseover="dropShadow(id)" onmouseout="eraseShadow(id)" value="<%=firstname%>" required/>
                <input name="in3" class="Areas" id="in3" type="text" placeholder="lastname"
                       onmouseover="dropShadow(id)" onmouseout="eraseShadow(id)" value="<%=lastname%>" required/>
                <input name="in4" class="Areas" id="in4" type="text" placeholder="email"
                       onmouseover="dropShadow(id)" onmouseout="eraseShadow(id)" value="<%=email%>" required/>
                <input name="in5" class="Areas" id="in5" type="date" placeholder="date" onmouseover="dropShadow(id)"
                       onmouseout="eraseShadow(id)" value="<%=date%>" required/>
                <input type="submit" name="bt1" class="buttons" id="bt1" onmouseover="dropShadow(id)"
                       onmouseout="eraseShadow(id)" value="update" required/>


            </form>
            <%
                if (request.getParameter("bt1") != null) {
                    session.invalidate();
                    User tmp = new User();

                    tmp.setId(id);
                    tmp.setFirsname(request.getParameter("in2"));
                    tmp.setLastname(request.getParameter("in3"));
                    tmp.setEmail(request.getParameter("in4"));
                    tmp.setDate(Date.valueOf(request.getParameter("in5")));
                    try {
                        userDao.edit(tmp);
                        userDao.update();

                    } catch (Exception e) {
                        System.out.println(e.getMessage());

                    }
                    response.sendRedirect("../index.jsp");
                }
            %>


        </div>

    </div>

    <script src="../js/functions.js"></script>
</body>
</html>