<%@ page import="am.pac.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="am.pac.User" %>
<%@ page import="java.sql.Date" %>
<%@ page import="am.pac.Db" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.SQLException" %><%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>crud</title>
    <link href="style/style.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="main">
    <div id="head">
        <H2 ID="head-title">BASIC CRUD UI</H2>

    </div>

        <%
    UserDao userDao = new UserDao();
    try {
        userDao.fillUsers();
    }catch (Exception ee){
        System.out.println(ee.getMessage());
    }
        %>


    <div id="body">
        <div id="rightBar">
            <div id="inputAreas">
                <h3> Create USER</h3>
                <form action="index.jsp" method="post">
                    <input name="in2" class="Areas" id="in2" type="text" placeholder="firstname"
                           onmouseover="dropShadow(id)" onmouseout="eraseShadow(id)" required/>
                    <input name="in3" class="Areas" id="in3" type="text" placeholder="lastname"
                           onmouseover="dropShadow(id)" onmouseout="eraseShadow(id)" required/>
                    <input name="in4" class="Areas" id="in4" type="text" placeholder="email"
                           onmouseover="dropShadow(id)" onmouseout="eraseShadow(id)" required/>
                    <input name="in5" class="Areas" id="in5" type="date" placeholder="date" onmouseover="dropShadow(id)"
                           onmouseout="eraseShadow(id)" required/>
                    <input type="submit" name="bt1" class="buttons" id="bt1" onmouseover="dropShadow(id)"
                           onmouseout="eraseShadow(id)" value="submit" required/>

                </form>

            </div>

        </div>


        <div id="tableDiv">
            <form action="index.jsp" method="post">
                <input type="submit" name="bt2" class="buttons" id="bt2" onmouseover="dropShadow(id)"
                       onmouseout="eraseShadow(id)" value="delete"/>
                <table class="content-table">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>firstname</th>
                        <th>lastname</th>
                        <th>email</th>
                        <th>date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%


                        List<User> newList = userDao.returnList();
                        for (int i = 0; i < newList.size(); i++) {

                            out.print("<tr>");
                            out.print(
                                    "<td>" + newList.get(i).getId() + "</td>" + "<td>" + newList.get(i).getFirsname() + "</td>" +
                                            "<td>" + newList.get(i).getLastname() + "</td>" + "<td>" + newList.get(i).getEmail() + "</td>" +
                                            "<td>" + newList.get(i).getDate() + "</td>" +
                                            "<td> " + "<a href='pages/edit.jsp?id="
                                            + newList.get(i).getId() + "&firstname=" + newList.get(i).getFirsname() + "&lastname="
                                            + newList.get(i).getLastname() + "&email=" + newList.get(i).getEmail() + "&date="
                                            + newList.get(i).getDate() + "'> edit</a>" + "</td>" +
                                            "<td>" + "<input type='radio' name='delradio' value=" + newList.get(i).getId() + " required></td>"
                            );

                            out.print("</tr>");
                        }
                    %>
                    <%

                        if (request.getParameter("bt2") != null) {
                            String value = request.getParameter("delradio");

                            int id = Integer.parseInt(value);

                            try {
                                userDao.delete(id);
                                userDao.update();
                                response.setHeader("REFRESH", "0");    // 0 for refresh without delay
                            } catch (Exception ee) {
                                System.out.println(ee.getMessage());
                            }
                        }

                    %>
                    </tbody>
                </table>
            </form>
        </div>
        <%
            if (request.getParameter("bt1") != null) {

                User tmp = new User();

                tmp.setFirsname(request.getParameter("in2"));
                tmp.setLastname(request.getParameter("in3"));
                tmp.setEmail(request.getParameter("in4"));
                tmp.setDate(Date.valueOf(request.getParameter("in5")));
                try {

                    userDao.insert(tmp);
                    userDao.update();
                    response.setHeader("REFRESH", "0");    // 0 for refresh without delay
                } catch (Exception e) {
                    System.out.println(e.getMessage());

                }
            }
        %>


    </div>


    <script src="js/functions.js">


    </script>
</body>
</html>