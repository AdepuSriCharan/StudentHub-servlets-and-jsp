package com.signup;

import com.dao.StudentDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/signup-servlet")
public class Signup extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("fname");
        String dob = req.getParameter("dob");
        String phoneNo = req.getParameter("phoneNo");
        String entereduname = req.getParameter("uname");
        String enteredupassword = req.getParameter("upassword");

        HttpSession session = req.getSession();
        StudentDao studentDao = new StudentDao();
        String dbuname = studentDao.isAlreadyExists(entereduname);


        if(entereduname.equals(dbuname)){
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Student with username " + dbuname + " already exists.');");
            out.println("window.location.href='signin.jsp';");
            out.println("</script>");
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
