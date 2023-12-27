package com.login;

import com.dao.StudentDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

@WebServlet("/login-servlet")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String entereduname = req.getParameter("uname");
        String enteredupassword = req.getParameter("upassword");

        StudentDao studentDao = new StudentDao();

        String[] userArray = studentDao.checkStudent(entereduname, enteredupassword);
        String dbuname = userArray[0];
        String dbupassword = userArray[1];

        HttpSession session = req.getSession();
        if(enteredupassword.equals(dbupassword) && entereduname.equals(dbuname)){
            session.setAttribute("username",entereduname);
            resp.sendRedirect("home.jsp");
        } else {
           resp.sendRedirect("error.jsp");
        }
    }
}
