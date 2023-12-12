package com.sign;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login-servlet")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String uname = req.getParameter("uname");
        String upassword = req.getParameter("upassword");

        StudentDao studentDao = new StudentDao();
        int exp = studentDao.checkStudent(uname,upassword);

        if(exp == 1){
            HttpSession session = req.getSession();
            session.setAttribute("username",uname);
            resp.sendRedirect("home.jsp");
        } else {
            PrintWriter out = resp.getWriter();
            out.println("Username or password Invalid");
            resp.sendRedirect("signin.jsp");
        }
    }
}
