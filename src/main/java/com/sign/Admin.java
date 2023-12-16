package com.sign;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin-servlet")
public class Admin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uname = req.getParameter("uname");
        String upassword = req.getParameter("upassword");
        if(uname.equals("Sricharan") && upassword.equals("charan123")){
               HttpSession session = req.getSession();
               session.setAttribute("username",uname);
               session.setAttribute("password",upassword);
               resp.sendRedirect("adminaccess.jsp");
            }
            else {
                resp.sendRedirect("index.jsp");
            }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
