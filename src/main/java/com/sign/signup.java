package com.sign;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/signup-servlet")
public class signup extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("fname");
        String dob = req.getParameter("dob");
        String phoneNo = req.getParameter("phoneNo");
        String uname = req.getParameter("uname");
        String upassword = req.getParameter("upassword");

        Student student = new Student();
        student.setFname(fname);
        student.setDob(dob);
        student.setPhoneNo(phoneNo);
        student.setUname(uname);
        student.setUpassword(upassword);

        HttpSession session = req.getSession();
        StudentDao studentDao = new StudentDao();
        int check = studentDao.checkStudent(uname,upassword);
        if(check == 1){
            resp.sendRedirect("exists.jsp");
        }
        else {
            studentDao.registerStudent(student);
            session.setAttribute("username",uname);
            resp.sendRedirect("home.jsp");

        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("signup.jsp");
        dispatcher.forward(req,resp);
    }

}
