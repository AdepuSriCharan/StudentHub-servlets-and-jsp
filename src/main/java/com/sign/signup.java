package com.sign;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;

@WebServlet("/signup-servlet")
public class signup extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("fname");
        String dob = req.getParameter("dob");
        String phoneNo = req.getParameter("phoneNo");
        String entereduname = req.getParameter("uname");
        String enteredupassword = req.getParameter("upassword");

        HttpSession session = req.getSession();
        StudentDao studentDao = new StudentDao();
        String dbuname = studentDao.isAlreadyExists(entereduname, enteredupassword);


        if(entereduname.equals(dbuname)){
            resp.sendRedirect("exists.jsp");
        }
        else {
            Student student = new Student();
            student.setFname(fname);
            student.setDob(dob);
            student.setPhoneNo(phoneNo);
            student.setUname(entereduname);
            student.setUpassword(enteredupassword);
            studentDao.registerStudent(student);
            session.setAttribute("username",entereduname);
            resp.sendRedirect("home.jsp");

        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("signup.jsp");
        dispatcher.forward(req,resp);
    }

}
